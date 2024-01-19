<?php

namespace Modules\Document\Models;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Document extends BaseModel
{
    use HasFactory;
    use SoftDeletes;
    use HasUuids;

    protected $table = 'documents';

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
