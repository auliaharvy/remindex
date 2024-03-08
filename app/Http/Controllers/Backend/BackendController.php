<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Spatie\Permission\Traits\HasRoles;
use App\Models\DocumentSchedule;
use App\Models\SchedulePic;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BackendController extends Controller
{
    public function __construct()
    {
        $this->department_model = "Modules\Department\Models\Department";
        $this->documenttype_model = "Modules\DocumentType\Models\DocumentType";
        $this->document_model = "Modules\Document\Models\Document";
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function index()
    {
        $currentYear = Carbon::now()->year;
        $startYear = $currentYear - 1;
        $endYear = $currentYear + 1;
        $years = range($startYear, $endYear);
        $userId = Auth::id();
        $user = auth()->user();
        $department_model = $this->department_model;
        $documenttype_model = $this->documenttype_model;
        $document_model = $this->document_model;

        // Mendpatkan data document Type



        if ($user->hasRole('super admin')) {
            // Mendpatkan data department
            $departments = $document_model::select('department_name as name')->groupBy('department_name')->get();
            // Mendpatkan data document type
            $documenttypes = $document_model::select('document_type_name as name')->groupBy('document_type_name')->get();
            // Mendapatkan data lokasi dokumen
            $locations = $document_model::select('location as name')->groupBy('location')->get();

            // Mendapatkan data count document
            $total_document = $document_model::count();
            $total_active_document = $document_model::where('status', 1)->count();
            $total_waiting_document = $document_model::where('status', 2)->count();
            $total_expired_document = $document_model::where('status', 3)->count();
            $count_document = [
                'total' => $total_document,
                'active' => $total_active_document,
                'waiting' => $total_waiting_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->select(
                DB::raw('YEAR(document_schedules.schedule_date) AS year'),
                DB::raw('MONTH(document_schedules.schedule_date) AS month'),
                DB::raw('COUNT(*) AS total_documents')
            )
            // ->whereIn(DB::raw('YEAR(schedule_date)'), [date('Y'), date('Y') + 1])
            ->groupBy(DB::raw('YEAR(document_schedules.schedule_date)'), DB::raw('MONTH(document_schedules.schedule_date)'))
            ->orderBy(DB::raw('YEAR(document_schedules.schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(document_schedules.schedule_date)'), 'asc')
            ->get();

        } else {

            // Mendpatkan data department
            $departments = $document_model::select('department_name as name')
            ->groupBy('department_name')
            ->where('user_id', $userId)
            ->get();
            // Mendpatkan data document type
            $documenttypes = $document_model::select('document_type_name as name')
            ->groupBy('document_type_name')
            ->where('user_id', $userId)
            ->get();
            // Mendapatkan data lokasi dokumen
            $locations = $document_model::select('location as name')->groupBy('location')
            ->where('user_id', $userId)
            ->get();

            // Mendapatkan data count document
            $total_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->count();

            $total_active_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->where('documents.status', 1)
                ->count();

            $total_waiting_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->where('documents.status', 2)
                ->count();

            $total_expired_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->where('documents.status', 3)
                ->count();

            $count_document = [
                'total' => $total_document,
                'active' => $total_active_document,
                'waiting' => $total_waiting_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data = DocumentSchedule::join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->join('documents', 'document_schedules.document_id', '=', 'documents.id')
            ->where('schedule_pics.user_pic_id', auth()->id())
            ->where('documents.user_id', auth()->id())
            ->select(
                DB::raw('YEAR(schedule_date) AS year'),
                DB::raw('MONTH(schedule_date) AS month'),
                DB::raw('COUNT(DISTINCT documents.id) AS total_documents') // Menggunakan COUNT(DISTINCT) untuk menghitung dokumen yang unik
            )
            // ->whereIn(DB::raw('YEAR(schedule_date)'), [date('Y'), date('Y') + 1])
            ->groupBy(DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))
            ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            ->get();
        }

        $grouped_forecast_data = [];
        foreach ($forecast_data as $data) {
            $grouped_forecast_data[$data->year][] = [
                'month' => $data->month,
                'total_documents' => $data->total_documents,
            ];
        }

        logUserAccess("Dashboard");

        return view(
            "backend.index",
            compact('locations', 'departments', 'documenttypes', 'count_document', 'forecast_data', 'grouped_forecast_data')
        );
    }

    /**
     * Get dashboard with filter data.
     *
     * @param  Request  $request
     * @return Response
     */
    public function index_filter(Request $request)
    {
        $currentYear = Carbon::now()->year;
        $startYear = $currentYear - 1;
        $endYear = $currentYear + 1;
        $years = range($startYear, $endYear);
        $userId = Auth::id();
        $user = auth()->user();
        $department_model = $this->department_model;
        $documenttype_model = $this->documenttype_model;
        $document_model = $this->document_model;

        // Mendpatkan data document Type
        $documenttypes = $documenttype_model::select('name', 'id')->get();


        if ($user->hasRole('super admin')) {
            // Mendpatkan data department
            $departments = $department_model::select('name', 'id')->get();

            // Mendapatkan data count document
            $total_document = $document_model::Where(function ($query) use($checkbox) {
                for ($i = 0; $i < count($checkbox ); $i++){
                      $query->orwhere('department_name', 'like',  '%' . $checkbox [$i] .'%');
            }})->count();
            $total_active_document = $document_model::where('status', 1)->count();
            $total_waiting_document = $document_model::where('status', 2)->count();
            $total_expired_document = $document_model::where('status', 3)->count();
            $count_document = [
                'total' => 2,
                'active' => $total_active_document,
                'waiting' => $total_waiting_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data = DB::table('document_schedules')
            ->select(
                DB::raw('YEAR(schedule_date) AS year'),
                DB::raw('MONTH(schedule_date) AS month'),
                DB::raw('COUNT(*) AS total_documents')
            )
            ->whereIn(DB::raw('YEAR(schedule_date)'), [date('Y'), date('Y') + 1])
            ->groupBy(DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))
            ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            ->get();

        } else {
            // Mendpatkan data department
            $departments = $department_model::select('name', 'id')->where('id', $user->department_id)->get();

            // Mendapatkan data count document
            $total_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->count();

            $total_active_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->where('documents.status', 1)
                ->count();

            $total_waiting_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->where('documents.status', 2)
                ->count();

            $total_expired_document = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
                ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                ->where('documents.user_id', $userId)
                ->where('schedule_pics.user_pic_id', $userId)
                ->where('documents.status', 3)
                ->count();

            $count_document = [
                'total' => $total_document,
                'active' => $total_active_document,
                'waiting' => $total_waiting_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data = DB::table('document_schedules')
            ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->join('documents', 'document_schedules.document_id', '=', 'documents.id')
            ->where('schedule_pics.user_pic_id', auth()->id())
            ->where('documents.user_id', auth()->id())
            ->select(
                DB::raw('YEAR(schedule_date) AS year'),
                DB::raw('MONTH(schedule_date) AS month'),
                DB::raw('COUNT(DISTINCT documents.id) AS total_documents') // Menggunakan COUNT(DISTINCT) untuk menghitung dokumen yang unik
            )
            ->whereIn(DB::raw('YEAR(schedule_date)'), [date('Y'), date('Y') + 1])
            ->groupBy(DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))
            ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            ->get();
        }

        $grouped_forecast_data = [];
        foreach ($forecast_data as $data) {
            $grouped_forecast_data[$data->year][] = [
                'month' => $data->month,
                'total_documents' => $data->total_documents,
            ];
        }

        logUserAccess("Dashboard-Filter");

        return view(
            "backend.index",
            compact('departments', 'documenttypes', 'count_document', 'forecast_data', 'grouped_forecast_data')
        );
    }

    public function calendar_event()
    {
        $user = auth()->user();
        $department_model = $this->department_model;
        $documenttype_model = $this->documenttype_model;
        $document_model = $this->document_model;

        $documents = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->select('documents.name', 'documents.status','document_schedules.schedule_date')
            ->get();

        // Transformasi data sesuai dengan format yang diinginkan
        $events = $documents->map(function ($document) {
            if($document->status == 1) {
                $color = "#2eb85c";
            } elseif($document->status == 2) {
                $color = "#f9b115";
            } else {
                $color = "#e55353";
            }
            return [
                'title' => $document->name,
                'start' => $document->schedule_date,
                'status' => $document->status,
                'color' => $color,
            ];
        });

        // Konversi ke format JSON
        $json_data = $events->toJson();

        // Outputkan data JSON
        echo $json_data;
    }
}
