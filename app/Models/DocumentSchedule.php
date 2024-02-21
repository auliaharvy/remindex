<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class DocumentSchedule extends BaseModel
{
    protected $fillable = [
        'document_id',
        'schedule_timestamp',
        'schedule_date',
        'schedule_time',
        'reminder_day',
        'reminder_repeat',
        'reminder_interval',
    ];

    protected $dates = [
        'schedule_timestamp',
        'created_at',
        'updated_at',
    ];

    /**
     * Retrieves the associated User model.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function document()
    {
        return $this->belongsTo('Modules\Document\Models\Document');
    }

    public function schedulePic()
    {
        return $this->belongsTo('App\Models\SchedulePic');
    }
}
