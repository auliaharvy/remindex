<?php

namespace Modules\Document\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Modules\Document\Models\Document;

class DocumentCreated extends Notification implements ShouldQueue
{
    use Queueable;

    public $document;

    /**
     * The callback that should be used to build the mail message.
     *
     * @var \Closure|null
     */
    public static $toMailCallback;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Document $document)
    {
        $this->document = $document;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database', 'mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $document = $this->document;
        $user = $notifiable;

        return (new MailMessage())
            ->line('The introduction to the notification.')
            ->action('Notification Action', 'https://laravel.com')
            ->line('Thank you for using our application!');
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

        $text = 'New Document | <strong>'.$document->name.'</strong> on <strong>'.$document->user_name.'</strong>';

        $url_backend = route('backend.documents.show', $document->id);

        return [
            'title' => 'New Document added!',
            'module' => 'Document',
            'type' => 'created', // created, published, viewed,
            'icon' => 'fas fa-file',
            'text' => $text,
            'url_backend' => $url_backend,
            'url_frontend' => '',
        ];
    }
}