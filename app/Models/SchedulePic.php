<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class SchedulePic extends BaseModel
{
    protected $fillable = [
        'document_schedule_id',
        'user_pic_id',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * Retrieves the associated User model.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function documentSchedule()
    {
        return $this->belongsTo('App\Models\DocumentSchedule');
    }

    public function userPic()
    {
        return $this->belongsTo('App\Models\User', 'user_pic_id');
    }
}
