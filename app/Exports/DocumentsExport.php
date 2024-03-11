<?php

namespace App\Exports;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Illuminate\Support\Str;
use Modules\Category\Models\Category;
use Modules\Department\Models\Department;
use Modules\DocumentType\Models\DocumentType;
use Modules\Document\Models\Document;
use App\Models\User;
use App\Models\Counter;
use App\Models\DocumentSchedule;
use App\Models\SchedulePic;
use Illuminate\Support\Facades\Auth;


class DocumentsExport implements FromView
{
    public function view(): View
    {
        $user = auth()->user();
        $userId = Auth::id();


        if ($user->hasRole('super admin')) {
            $documents = Document::select('documents.id', 'user_id', 'status', 'location', 'description','user_name', 'source', 'is_used','code', 'name', 'department_name', 'document_schedules.schedule_date',
            'document_type_name','description', 'file','documents.updated_at', 'documents.created_by')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')->get();
        } else {
            $documents = Document::select('documents.id', 'documents.user_id', 'documents.status', 'documents.is_used', 'documents.location', 'documents.source', 'documents.user_name', 'documents.description', 'documents.code', 'documents.name', 'documents.department_name',
            'documents.document_type_name','documents.description', 'documents.file','documents.updated_at', 'documents.created_by', 'document_schedules.schedule_date')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->orWhere('documents.user_id', auth()->id())
            ->orWhere('schedule_pics.user_pic_id', auth()->id())
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)->get();
        }
        return view('exports.documents', [
            'documents' => $documents
        ]);
    }
}
