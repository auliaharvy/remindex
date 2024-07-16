<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;
use Modules\Department\Models\Department;
use Modules\DocumentType\Models\DocumentType;
use Modules\Document\Models\Document;
use App\Models\User;
use App\Models\Counter;
use App\Models\DocumentSchedule;
use App\Models\SchedulePic;
use Carbon\Carbon;
use Flash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterImport;


class DocumentsImport implements ToCollection,WithHeadingRow, WithEvents
{
    private $users;
    private $departments;
    private $document_types;
    private $counters;
    public $successCount = 0;
    public $failureCount = 0;
    public $errors = [];

    public function __construct() {
        $this->users = User::select('id', 'name', 'email')->get();
        $this->departments = Department::select('id', 'name')->get();
        $this->document_types = DocumentType::select('id', 'name')->get();
    }


    /**
    * @param array $row
    */
    public function collection(Collection $rows)
    {
        $rowNumber = 2;
        foreach ($rows as $row)
        {

             try {
                // Assuming the same code as before for processing each row
                $document_type =  $this->document_types->where('name', $row['type'])->first();
                $department =  $this->departments->where('name', $row['department'])->first();
                $owner =  $this->users->where('email', $row['owner'])->first();
                $admin =  $this->users->where('email', $row['admin'])->first();
                $pic = $row['pic'] ? $this->users->where('email', $row['pic'])->first() : null;
                $document_count = Counter::firstOrCreate(['year' => now()->year])->counter;
                Counter::where('year', now()->year)->increment('counter');
                $code = "DOC-" . now()->year . "-" . $document_count;

                if ($row['expiration_date']) {
                    $schedule_date = $row['expiration_date'];
                    $reminder_day = $row['reminder_day_before_expiration'];
                    $reminder_gap = Carbon::now()->diffInDays($schedule_date);
                    $today = Carbon::now();

                    if ($reminder_gap < $reminder_day) {
                        $status = 2;
                    } elseif ($schedule_date < $today) {
                        $status = 4;
                    } else {
                        $status = 1;
                    }

                    $document = Document::create([
                        'user_id' => $owner->id ?? null,
                        'admin_id' => $admin->id ?? null,
                        'document_type_id' => $document_type->id ?? null,
                        'department_id' => $department->id ?? null,
                        'code' => $code,
                        'name' => $row['name'],
                        'location' => $row['location'],
                        'description' => $row['description'],
                        'source' => $row['source'],
                        'is_used' => $row['is_used'],
                        'is_expired' => 0,
                        'status' => $status,
                    ]);

                    $date = Carbon::parse($schedule_date);
                    $dateWithTime = $date->startOfDay();
                    $nextRemindAt = Carbon::now()->subDays($reminder_day);
                    $reminder_gap = Carbon::now()->diffInDays($schedule_date);

                    $schedule = DocumentSchedule::create([
                        'document_id' => $document->id,
                        'schedule_timestamp' => $dateWithTime,
                        'schedule_date' => $schedule_date,
                        'reminder_day' => $reminder_day,
                        'reminder_repeat' => $row['reminder_repeat'],
                        'reminder_interval' => $row['reminder_interval'],
                        'next_reminder' => $nextRemindAt,
                    ]);

                    SchedulePic::create([
                        'document_schedule_id' => $schedule->id,
                        'user_pic_id' => $pic->id ?? null,
                    ]);
                } else {
                    Document::create([
                        'user_id' => $owner->id ?? null,
                        'admin_id' => $admin->id ?? null,
                        'document_type_id' => $document_type->id ?? null,
                        'department_id' => $department->id ?? null,
                        'code' => $code,
                        'name' => $row['name'],
                        'location' => $row['location'],
                        'description' => $row['description'],
                        'source' => $row['source'],
                        'is_used' => $row['is_used'],
                        'is_expired' => 1,
                        'status' => 5,
                    ]);
                }
                $this->successCount++;
            } catch (\Exception $e) {
                $this->failureCount++;
                $this->errors[] = "Row $rowNumber: " . $e->getMessage();
            }
            $rowNumber++;
        }
    }

    public static function afterImport(AfterImport $event)
    {
        $import = $event->getConcernable();
        session()->flash('successCount', $import->successCount);
        session()->flash('failureCount', $import->failureCount);
        session()->flash('errors', $import->errors);
    }

    public function registerEvents(): array
    {
        return [
            AfterImport::class => [self::class, 'afterImport'],
        ];
    }
}
