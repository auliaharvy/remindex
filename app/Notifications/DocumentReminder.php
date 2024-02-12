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

class DocumentReminder extends Notification
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
        return ['mail'];
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


        // $url = route('backend.documents.show', $this->document->id);
        return (new MailMessage())
            ->subject('New Document Created: ' . $this->document->name)
            ->line('A new document has been created:')
            ->line('Document Name: ' . $this->document->name)
            ->line('Description: ' . $this->document->description)
            ->line('Created by: ' . $this->document->user->name) // Assuming a 'user' relationship on document
            ->action('View Document', $url);
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
}
