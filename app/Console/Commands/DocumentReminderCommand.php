<?php

namespace App\Console\Commands;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Models\DocumentSchedule;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Str;
use Modules\Document\Models\Document;
use App\Notifications\ExpiredDocument;
use App\Notifications\WaitingDocument;
use App\Models\User;

class DocumentReminderCommand extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'app:document-reminder';

    /**
     * The console command description.
     */
    protected $description = 'Create Permissions for default mothods. The Names shoule be plural.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $reminders = DocumentSchedule::get();

        foreach ($reminders as $reminder) {
            // Hitung waktu pengingat berikutnya
            $nextRemindAt = Carbon::now()->addDays($reminder->reminder_day);
            $today = Carbon::now();
            $reminder_gap = Carbon::now()->diffInDays($reminder->schedule_date);
            $reminder_repeat = $reminder->reminder_repeat - $reminder->reminder_sent;

            // $this->info($today);
            // $this->info($reminder_gap);
            // $this->info($reminder_repeat);

            if($reminder_gap < $reminder->reminder_day ) {
                $reminder->reminder_day--;
                $reminder->reminder_sent++;
                $reminder->next_reminder = $nextRemindAt;
                // $reminder->status = 2;
                $reminder->save();

                $document = Document::findOrFail($reminder->document_id);
                $document->status = 2;
                $document->save();

                if($reminder_repeat > 0) {
                    // kirim email
                    $userPic = User::where('id', '=', $document->user_id)->first();
                    $userPic->notify(new ExpiredDocument($document, $reminder));
                }
            }

            if($reminder->schedule_date <  $today) {
                $reminder->reminder_day--;
                $reminder->reminder_sent++;
                $reminder->next_reminder = $nextRemindAt;
                // $reminder->status = 2;
                $reminder->save();

                $document = Document::findOrFail($reminder->document_id);
                $document->status = 3;
                $document->save();

                if($reminder_repeat > 0) {
                    // kirim email
                    $userPic = User::where('id', '=', $document->user_id)->first();
                    $userPic->notify(new WaitingDocument($document, $reminder));
                }
            }
            // Kirim email pengingat
            // $reminder->sendEmail();

            // Update data reminder

        }
    }
}
