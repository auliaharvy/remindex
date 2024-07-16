<?php

namespace Modules\Document\Models;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Modules\Department\Models\Department;
use Modules\DocumentType\Models\DocumentType;
use App\Models\User;
use Modules\Document\Models\Presenters\DocumentPresenter;

class Document extends BaseModel
{
    use HasFactory;
    use SoftDeletes;
    use HasUuids;
    use DocumentPresenter;

    protected $table = 'documents';

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logUnguarded()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->useLogName($this->table);
    }

    public function document_type()
    {
        return $this->belongsTo('Modules\DocumentType\Models\DocumentType');
    }

    public function setDocumentTypeIdAttribute($value)
    {
        $this->attributes['document_type_id'] = $value;

        try {
            $document_type = DocumentType::findOrFail($value);
            $this->attributes['document_type_name'] = $document_type->name;
        } catch (\Exception $e) {
            $this->attributes['document_type_name'] = null;
        }
    }

    public function department()
    {
        return $this->belongsTo('Modules\Department\Models\Department');
    }

    public function setDepartmentIdAttribute($value)
    {
        $this->attributes['department_id'] = $value;

        try {
            $department = Department::findOrFail($value);
            $this->attributes['department_name'] = $department->name;
        } catch (\Exception $e) {
            $this->attributes['department_name'] = null;
        }
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function setUserIdAttribute($value)
    {
        $this->attributes['user_id'] = $value;

        try {
            $user = User::findOrFail($value);
            $this->attributes['user_name'] = $user->name;
            $this->attributes['user_email'] = $user->email;
        } catch (\Exception $e) {
            $this->attributes['user_name'] = null;
            $this->attributes['user_email'] = null;
        }
    }

    public function admin()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function setAdminIdAttribute($value)
    {
        $this->attributes['admin_id'] = $value;

        try {
            $user = User::findOrFail($value);
            $this->attributes['admin_name'] = $user->name;
            $this->attributes['admin_email'] = $user->email;
        } catch (\Exception $e) {
            $this->attributes['admin_name'] = null;
            $this->attributes['admin_email'] = null;
        }
    }

    public function document_schedules()
    {
        return $this->hasMany('App\Models\DocumentSchedule');
    }

    public function getScheduleDatesAttribute()
    {
        return $this->document_schedules->pluck('scheduled_date');
    }

    /**
     * Create a new factory instance for the model.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    protected static function newFactory()
    {
        return \Modules\Document\database\factories\DocumentFactory::new();
    }
}
