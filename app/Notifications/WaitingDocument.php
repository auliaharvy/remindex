<?php

namespace App\Notifications;

use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Lang;
use Illuminate\Support\Facades\URL;
use Spatie\IcalendarGenerator\Components\Calendar;
use Spatie\IcalendarGenerator\Components\Event;
use Spatie\IcalendarGenerator\Properties\TextProperty;

class WaitingDocument extends Notification
{
    public $document;

    public function __construct($document, $document_expired)
    {
        $this->document = $document;
        $this->document_expired = $document_expired;
    }


    /**
     * The callback that should be used to build the mail message.
     *
     * @var \Closure|null
     */
    public static $toMailCallback;

    /**
     * Get the notification's channels.
     *
     * @param  mixed  $notifiable
     * @return array|string
     */
    public function via($notifiable)
    {
        return ['database', 'mail'];
    }

    /**
     * Build the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        // $verificationUrl = $this->verificationUrl($notifiable);

        // $user = User::where('id', '=', $validatedData['owner'])->first();
        $url = route('backend.documents.show', $this->document->id);
        if (static::$toMailCallback) {
            return call_user_func(static::$toMailCallback, $notifiable, $url);
        }

        $calendar = Calendar::create()
        ->productIdentifier('Reminder Notification')
        ->event(function (Event $event) {
            $event->name($this->document->name)
                ->startsAt(Carbon::parse($this->document_expired->schedule_timestamp))
                ->endsAt(Carbon::parse($this->document_expired->schedule_timestamp))
                ->address($this->document->location ?? '-')
                ->organizer('remindex@scjp.co.id', 'Remindex');
        });
        $calendar->appendProperty(TextProperty::create('METHOD', 'REQUEST'));

        // $url = route('backend.documents.show', $this->document->id);
        return (new MailMessage())
            ->subject('Document Entering the reminder period : ' . $this->document->name)
            ->line('Document Entering the reminder period:')
            ->line('Document Name: ' . $this->document->name)
            ->line('Description: ' . $this->document->description)
            ->line('Created by: ' . $this->document->user->name) // Assuming a 'user' relationship on document
            ->line('Please renew document' . $this->document->user->name) // Assuming a 'user' relationship on document
            ->action('View Document', $url)
            ->attachData($calendar->get(), 'invite.ics', [
                'mime' => 'text/calendar; charset=UTF-8; method=REQUEST',
            ]);
    }

    /**
     * Set a callback that should be used when building the notification mail message.
     *
     * @param  \Closure  $callback
     * @return void
     */
    public static function toMailUsing($callback)
    {
        static::$toMailCallback = $callback;
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        $document = $this->document;
        $user = $notifiable;

        $text = 'Document Entering the reminder period | <strong>'.$document->name.'</strong> on <strong>'.$document->user_name.'</strong>';

        $url_backend = route('backend.documents.show', $document->id);

        return [
            'title' => 'Document Entering the reminder period!',
            'module' => 'Document',
            'type' => 'created', // created, published, viewed,
            'icon' => 'fas fa-file',
            'text' => $text,
            'url_backend' => $url_backend,
            'url_frontend' => '',
        ];
    }
}
