<?php

namespace Modules\DocumentType\Models;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class DocumentType extends BaseModel
{
    use HasFactory;
    use SoftDeletes;
    use HasUuids;

    protected $table = 'document_types';

    /**
     * Create a new factory instance for the model.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    protected static function newFactory()
    {
        return \Modules\DocumentType\database\factories\DocumentTypeFactory::new();
    }
}
