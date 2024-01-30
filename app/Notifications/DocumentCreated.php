<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DocumentCreated extends Notification implements ShouldQueue
{
    use Queueable;

    protected $request;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(array $request)
    {
        $this->request = $request;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $request = $this->request;
        $user = $notifiable;

        $calendar = Calendar::create()
            ->productIdentifier('Kutac.cz')
            ->event(function (Event $event) {
                $event->name("Email with iCal 101")
                    ->attendee("attendee@gmail.com")
                    ->startsAt(Carbon::parse("2021-12-15 08:00:00"))
                    ->endsAt(Carbon::parse("2021-12-19 17:00:00"))
                    ->fullDay()
                    ->address('Online - Google Meet');
            });
        $calendar->appendProperty(TextProperty::create('METHOD', 'REQUEST'));  

        return (new MailMessage())
            ->line('Welcome to '.app_name().'!')
            ->line('A new account has been created for you. Please use the following credentials to login.')
            ->line(__('Username').': '.$user->username)
            ->line(__('Email').': '.$user->email)
            ->line(__('Password').': '.$request['password'])
            ->line(__('URL').': '.url('/login'))
            ->action(__('Visit').' '.app_name(), url('/'));
    }
}
