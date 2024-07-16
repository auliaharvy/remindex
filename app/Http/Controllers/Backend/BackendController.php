<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Spatie\Permission\Traits\HasRoles;
use Flash;
use App\Models\DocumentSchedule;
use App\Models\SchedulePic;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Carbon\Carbon;
use Illuminate\Support\Str;
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
        session()->forget('selected_departments');
        session()->forget('selected_documenttypes');
        $currentYear = Carbon::now()->year;
        $startYear = $currentYear - 1;
        $endYear = $currentYear + 1;
        $years = range($startYear, $endYear);
        $userId = Auth::id();
        $user = auth()->user();
        $department_model = $this->department_model;
        $documenttype_model = $this->documenttype_model;
        $document_model = $this->document_model;

       

        if ($user->hasRole('super admin')) {
            // Mendpatkan data department
            $departments = $department_model::select('name')->get();
            // Mendpatkan data document type
            $documenttypes = $document_model::select('document_type_name as name')->groupBy('document_type_name')->get();
            // Mendapatkan data lokasi dokumen
            $locations = $document_model::select('location as name')->groupBy('location')->get();

            // Mendapatkan data count document
            $used_document = $document_model::where('deleted_at', null)->where('is_used', 0)->count();
            $unused_document = $document_model::where('deleted_at', null)->where('is_used', 1)->count();
            $with_expired_document = $document_model::where('deleted_at', null)->where('is_expired',0)->count();
            $without_expired_document = $document_model::where('deleted_at', null)->where('is_expired',1)->count();
            $total_active_document = $document_model::where('status', 1)->where('deleted_at', null)->count();
            $total_to_process_document = $document_model::where('status', 2)->where('deleted_at', null)->count();
            $total_on_process_document = $document_model::where('status', 3)->where('deleted_at', null)->count();
            $total_expired_document = $document_model::where('status', 4)->where('deleted_at', null)->count();
            $count_document = [
                'used_document' => $used_document,
                'unused_document' => $unused_document,
                'with_expired' => $with_expired_document,
                'without_expired' => $without_expired_document,
                'active' => $total_active_document,
                'to_process' => $total_to_process_document,
                'on_process' => $total_on_process_document,
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

            $grouped_forecast_data = [];
            function add_to_grouped_data(&$grouped_data, $data) {
                foreach ($data as $item) {
                    $year = $item->year;
                    $month = $item->month;
                    $total_documents = $item->total_documents;

                    if (!isset($grouped_data[$year])) {
                        $grouped_data[$year] = [];
                    }

                    if (!isset($grouped_data[$year][$month])) {
                        $grouped_data[$year][$month] = 0;
                    }

                    $grouped_data[$year][$month] += $total_documents;
                }
            
            }
            add_to_grouped_data($grouped_forecast_data, $forecast_data);

            // Convert the data to the desired format
            $final_grouped_forecast_data = [];
            foreach ($grouped_forecast_data as $year => $months) {
                foreach ($months as $month => $total_documents) {
                    $final_grouped_forecast_data[$year][] = [
                        'month' => $month,
                        'total_documents' => $total_documents,
                    ];
                }
            }

            logUserAccess("Dashboard");

            return view(
                "backend.index",
                compact('locations', 'departments', 'documenttypes', 'count_document', 'final_grouped_forecast_data')
            );

        } else {

            // Mendpatkan data department
            $departments = $document_model::select('documents.department_name as name')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->groupBy('documents.department_name')
            ->orWhere('documents.user_id', $userId)
            ->orWhere('documents.admin_id', $userId)
            ->orWhere('schedule_pics.user_pic_id', $userId)
            ->get();

            // Mendpatkan data document type
            $documenttypes = $document_model::select('documents.document_type_name as name')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->groupBy('department_name')
            ->orWhere('documents.user_id', $userId)
            ->orWhere('documents.admin_id', $userId)
            ->orWhere('schedule_pics.user_pic_id', $userId)
            ->groupBy('documents.document_type_name')
            ->get();

            // Mendapatkan data lokasi dokumen
            $locations = $document_model::select('location as name')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->groupBy('documents.location')
            ->orWhere('documents.user_id', $userId)
            ->orWhere('documents.admin_id', $userId)
            ->orWhere('schedule_pics.user_pic_id', $userId)
            ->get();

            // Mendapatkan data count used document
            $pic_used_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->where('documents.deleted_at', null)
            ->where('documents.is_used', 0)
            ->where('documents.user_id', '!=', $userId)
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->count();

            $owner_used_document = $document_model::where('documents.deleted_at', null)
            ->where('documents.is_used', 0)
            ->where('documents.user_id', $userId)
            ->count();

            $admin_used_document = $document_model::where('documents.deleted_at', null)
            ->where('documents.is_used', 0)
            ->where('documents.admin_id', $userId)
            ->count();

            $used_document = $pic_used_document + $owner_used_document + $admin_used_document;

            // Mendapatkan data count unused document
            $pic_unused_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->where('documents.deleted_at', null)
            ->where('documents.is_used', 1)
            ->where('documents.user_id', '!=', $userId)
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->count();

            $owner_unused_document = $document_model::where('documents.deleted_at', null)
            ->where('documents.is_used', 1)
            ->where('documents.user_id', $userId)
            ->count();

            $admin_unused_document = $document_model::where('documents.deleted_at', null)
            ->where('documents.is_used', 1)
            ->where('documents.admin_id', $userId)
            ->count();

            $unused_document = $pic_unused_document + $owner_unused_document + $admin_unused_document;

            // Mendapatkan data count with expired document
            $pic_with_expired_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->count();

            $owner_with_expired_document = $document_model::where('documents.user_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->count();

            $admin_with_expired_document = $document_model::where('documents.admin_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->count();

            $with_expired_document = $pic_with_expired_document + $owner_with_expired_document + $admin_with_expired_document;

            // Mendapatkan data count without expired document
            $pic_without_expired_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.deleted_at', null)
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.is_expired',1)
            ->count();

            $owner_without_expired_document = $document_model::where('documents.user_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',1)
            ->count();

            $admin_without_expired_document = $document_model::where('documents.admin_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',1)
            ->count();

            $without_expired_document = $pic_without_expired_document + $owner_without_expired_document + $admin_without_expired_document;

            // Mendapatkan data count without expired document
            $pic_total_active_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 1)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_active_document = $document_model::where('documents.user_id', $userId)
            ->where('documents.status', 1)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_active_document = $document_model::where('documents.admin_id', $userId)
            ->where('documents.status', 1)
            ->where('documents.deleted_at', null)
            ->count();

            $total_active_document = $pic_total_active_document + $owner_total_active_document + $admin_total_active_document;

            // Mendapatkan data count without expired document
            $pic_total_to_process_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 2)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_to_process_document = $document_model::where('documents.user_id', $userId)
            ->where('documents.status', 2)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_to_process_document = $document_model::where('documents.admin_id', $userId)
            ->where('documents.status', 2)
            ->where('documents.deleted_at', null)
            ->count();

            $total_to_process_document = $pic_total_to_process_document + $owner_total_to_process_document + $admin_total_to_process_document;

            // Mendapatkan data count without expired document
            $pic_total_on_process_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 3)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_on_process_document = $document_model::where('documents.user_id', $userId)
            ->where('documents.status', 3)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_on_process_document = $document_model::where('documents.admin_id', $userId)
            ->where('documents.status', 3)
            ->where('documents.deleted_at', null)
            ->count();

            $total_on_process_document = $pic_total_on_process_document + $owner_total_on_process_document + $admin_total_on_process_document;

            // Mendapatkan data count without expired document
            $pic_total_expired_document = $document_model::leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 4)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_expired_document = $document_model::where('documents.user_id', $userId)
            ->where('documents.status', 4)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_expired_document = $document_model::where('documents.admin_id', $userId)
            ->where('documents.status', 4)
            ->where('documents.deleted_at', null)
            ->count();

            $total_expired_document = $pic_total_expired_document + $owner_total_expired_document + $admin_total_expired_document;

            $count_document = [
                'used_document' => $used_document,
                'unused_document' => $unused_document,
                'with_expired' => $with_expired_document,
                'without_expired' => $without_expired_document,
                'active' => $total_active_document,
                'to_process' => $total_to_process_document,
                'on_process' => $total_on_process_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data_pic = DocumentSchedule::join('schedule_pics', function ($join) {
                $join->on('document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                     ->where('schedule_pics.user_pic_id', auth()->id());  // Filter within the join itself
            })
            ->leftJoin('documents', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.user_id', '!=', auth()->id())
            // ->where('documents.admin_id', '!=', auth()->id())
            ->select(
                'documents.id',  // Included in GROUP BY
                DB::raw('YEAR(schedule_date) AS year'),
                DB::raw('MONTH(schedule_date) AS month'),
                DB::raw('COUNT(*) AS total_documents')
            )
            ->groupBy('documents.id', DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))  // Group by document ID, year, and month
            ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            ->get();
            

            // dd($forecast_data_pic);
            // $forecast_data_owner = DocumentSchedule::join('schedule_pics', function ($join) {
            //     $join->on('document_schedules.id', '=', 'schedule_pics.document_schedule_id');
            //         //  ->where('schedule_pics.user_pic_id', '!=',auth()->id());  // Filter within the join itself
            // })
            // ->leftJoin('documents', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.user_id', auth()->id())
            // // ->where('documents.admin_id', '!=', auth()->id())
            // ->select(
            //     'documents.id',  // Included in GROUP BY
            //     DB::raw('YEAR(schedule_date) AS year'),
            //     DB::raw('MONTH(schedule_date) AS month'),
            //     DB::raw('COUNT(*) AS total_documents')
            // )
            // ->groupBy('documents.id', DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))  // Group by document ID, year, and month
            // ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            // ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            // ->get();

            $forecast_data_owner = $document_model::where('documents.user_id', auth()->id())
            ->join('document_schedules', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.user_id', auth()->id())
            // ->where('documents.admin_id', '!=', auth()->id())
            ->select(
                'documents.id',  // Included in GROUP BY
                DB::raw('YEAR(document_schedules.schedule_date) AS year'),
                DB::raw('MONTH(document_schedules.schedule_date) AS month'),
                DB::raw('COUNT(*) AS total_documents')
            )
            ->groupBy('documents.id', DB::raw('YEAR(document_schedules.schedule_date)'), DB::raw('MONTH(document_schedules.schedule_date)'))  // Group by document ID, year, and month
            ->orderBy(DB::raw('YEAR(document_schedules.schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(document_schedules.schedule_date)'), 'asc')
            ->get();

            // dd($forecast_data_owner);

            $forecast_data_admin = $document_model::where('documents.admin_id', auth()->id())
            ->join('document_schedules', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.user_id', auth()->id())
            // ->where('documents.admin_id', '!=', auth()->id())
            ->select(
                'documents.id',  // Included in GROUP BY
                DB::raw('YEAR(document_schedules.schedule_date) AS year'),
                DB::raw('MONTH(document_schedules.schedule_date) AS month'),
                DB::raw('COUNT(*) AS total_documents')
            )
            ->groupBy('documents.id', DB::raw('YEAR(document_schedules.schedule_date)'), DB::raw('MONTH(document_schedules.schedule_date)'))  // Group by document ID, year, and month
            ->orderBy(DB::raw('YEAR(document_schedules.schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(document_schedules.schedule_date)'), 'asc')
            ->get();
            


            // $forecast_data_admin = DocumentSchedule::join('schedule_pics', function ($join) {
            //     $join->on('document_schedules.id', '=', 'schedule_pics.document_schedule_id');
            //         //  ->where('schedule_pics.user_pic_id', '!=',auth()->id());  // Filter within the join itself
            // })
            // ->leftJoin('documents', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.admin_id', auth()->id())
            // // ->where('documents.user_id', '!=', auth()->id())
            // ->select(
            //     'documents.id',  // Included in GROUP BY
            //     DB::raw('YEAR(schedule_date) AS year'),
            //     DB::raw('MONTH(schedule_date) AS month'),
            //     DB::raw('COUNT(*) AS total_documents')
            // )
            // ->groupBy('documents.id', DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))  // Group by document ID, year, and month
            // ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            // ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            // ->get();

            $grouped_forecast_data = [];
            function add_to_grouped_data(&$grouped_data, $data) {
                foreach ($data as $item) {
                    $year = $item->year;
                    $month = $item->month;
                    $total_documents = $item->total_documents;

                    if (!isset($grouped_data[$year])) {
                        $grouped_data[$year] = [];
                    }

                    if (!isset($grouped_data[$year][$month])) {
                        $grouped_data[$year][$month] = 0;
                    }

                    $grouped_data[$year][$month] += $total_documents;
                }
            }
            
            // Adding data from each source to the grouped forecast data array
            add_to_grouped_data($grouped_forecast_data, $forecast_data_pic);
            add_to_grouped_data($grouped_forecast_data, $forecast_data_owner);
            add_to_grouped_data($grouped_forecast_data, $forecast_data_admin);

            // Convert the data to the desired format
            $final_grouped_forecast_data = [];
            foreach ($grouped_forecast_data as $year => $months) {
                foreach ($months as $month => $total_documents) {
                    $final_grouped_forecast_data[$year][] = [
                        'month' => $month,
                        'total_documents' => $total_documents,
                    ];
                }
            }

            logUserAccess("Dashboard");

            return view(
                "backend.index",
                compact('locations', 'departments', 'documenttypes', 'count_document', 'final_grouped_forecast_data')
            );
        }

        
        // dd($final_grouped_forecast_data);
       
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

        // access department checkbox
        if($request->departments_select) {
            $selectedDepartments = $request->input('departments_select', []);
            session()->put('selected_departments', $selectedDepartments);
        }

        // access document type checkbox
        if($request->documenttypes_select) {
            $selectedDocumenttypes = $request->input('documenttypes_select', []);
            session()->put('selected_documenttypes', $selectedDocumenttypes);
        }

        // access document type checkbox
        if($request->locations_select) {
            $selectedLocations = $request->input('locations_select', []);
            session()->put('selected_locations', $selectedLocations);
        }

        if ($user->hasRole('super admin')) {
            // Mendpatkan data department
            $departments = $department_model::select('name')->get();

            // Mendpatkan data document type
            $documenttypes = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->select('document_type_name as name')->groupBy('document_type_name')->get();

            // Mendapatkan data lokasi dokumen
            $locations = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->select('location as name')->groupBy('location')->get();

            // Mendapatkan data count document
            $used_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('deleted_at', null)->where('is_used', 0)->count();

            $unused_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('deleted_at', null)->where('is_used', 1)->count();

            $with_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('deleted_at', null)->where('is_expired',0)->count();

            $without_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('deleted_at', null)->where('is_expired',1)->count();

            $total_active_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('status', 1)->where('deleted_at', null)->count();

            $total_to_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('status', 2)->where('deleted_at', null)->count();

            $total_on_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('status', 3)->where('deleted_at', null)->count();

            $total_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('status', 4)->where('deleted_at', null)->count();

            $count_document = [
                'used_document' => $used_document,
                'unused_document' => $unused_document,
                'with_expired' => $with_expired_document,
                'without_expired' => $without_expired_document,
                'active' => $total_active_document,
                'to_process' => $total_to_process_document,
                'on_process' => $total_on_process_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
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


            $grouped_forecast_data = [];
            function add_to_grouped_data(&$grouped_data, $data) {
                foreach ($data as $item) {
                    $year = $item->year;
                    $month = $item->month;
                    $total_documents = $item->total_documents;

                    if (!isset($grouped_data[$year])) {
                        $grouped_data[$year] = [];
                    }

                    if (!isset($grouped_data[$year][$month])) {
                        $grouped_data[$year][$month] = 0;
                    }

                    $grouped_data[$year][$month] += $total_documents;
                }
            
            }
            add_to_grouped_data($grouped_forecast_data, $forecast_data);

            // Convert the data to the desired format
            $final_grouped_forecast_data = [];
            foreach ($grouped_forecast_data as $year => $months) {
                foreach ($months as $month => $total_documents) {
                    $final_grouped_forecast_data[$year][] = [
                        'month' => $month,
                        'total_documents' => $total_documents,
                    ];
                }
            }

            logUserAccess("Dashboard");

            return view(
                "backend.index",
                compact('locations', 'departments', 'documenttypes', 'count_document', 'final_grouped_forecast_data')
            );


        } else {

            // Mendpatkan data department
            $departments = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->select('documents.department_name as name')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->groupBy('documents.department_name')
            ->orWhere('documents.user_id', $userId)
            ->orWhere('schedule_pics.user_pic_id', $userId)
            ->get();

            // Mendpatkan data document type
            $documenttypes = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->select('documents.document_type_name as name')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->groupBy('department_name')
            ->orWhere('documents.user_id', $userId)
            ->orWhere('documents.admin_id', $userId)
            ->orWhere('schedule_pics.user_pic_id', $userId)
            ->groupBy('documents.document_type_name')
            ->get();

            // Mendapatkan data lokasi dokumen
            $locations = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->select('location as name')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->groupBy('documents.location')
            ->orWhere('documents.user_id', $userId)
            ->orWhere('documents.admin_id', $userId)
            ->orWhere('schedule_pics.user_pic_id', $userId)
            ->get();

            // Mendapatkan data count used document
            $pic_used_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->where('documents.deleted_at', null)
            ->where('documents.is_used', 0)
            ->where('documents.user_id', '!=', $userId)
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->count();

            $owner_used_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.deleted_at', null)
            ->where('documents.is_used', 0)
            ->where('documents.user_id', $userId)
            ->count();

            $admin_used_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.deleted_at', null)
            ->where('documents.is_used', 0)
            ->where('documents.admin_id', $userId)
            ->count();

            $used_document = $pic_used_document + $owner_used_document + $admin_used_document;

            // Mendapatkan data count unused document
            $pic_unused_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->where('documents.deleted_at', null)
            ->where('documents.is_used', 1)
            ->where('documents.user_id', '!=', $userId)
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->count();

            $owner_unused_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.deleted_at', null)
            ->where('documents.is_used', 1)
            ->where('documents.user_id', $userId)
            ->count();

            $admin_unused_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.deleted_at', null)
            ->where('documents.is_used', 1)
            ->where('documents.admin_id', $userId)
            ->count();

            $unused_document = $pic_unused_document + $owner_unused_document + $admin_unused_document;

            // Mendapatkan data count with expired document
            $pic_with_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->count();

            $owner_with_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->count();

            $admin_with_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->count();

            $with_expired_document = $pic_with_expired_document + $owner_with_expired_document + $admin_with_expired_document;

            // Mendapatkan data count without expired document
            $pic_without_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.deleted_at', null)
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.is_expired',1)
            ->count();

            $owner_without_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',1)
            ->count();

            $admin_without_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', $userId)
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',1)
            ->count();

            $without_expired_document = $pic_without_expired_document + $owner_without_expired_document + $admin_without_expired_document;

            // Mendapatkan data count without expired document
            $pic_total_active_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 1)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_active_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', $userId)
            ->where('documents.status', 1)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_active_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', $userId)
            ->where('documents.status', 1)
            ->where('documents.deleted_at', null)
            ->count();

            $total_active_document = $pic_total_active_document + $owner_total_active_document + $admin_total_active_document;

            // Mendapatkan data count without expired document
            $pic_total_to_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 2)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_to_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', $userId)
            ->where('documents.status', 2)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_to_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', $userId)
            ->where('documents.status', 2)
            ->where('documents.deleted_at', null)
            ->count();

            $total_to_process_document = $pic_total_to_process_document + $owner_total_to_process_document + $admin_total_to_process_document;

            // Mendapatkan data count without expired document
            $pic_total_on_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 3)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_on_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', $userId)
            ->where('documents.status', 3)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_on_process_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', $userId)
            ->where('documents.status', 3)
            ->where('documents.deleted_at', null)
            ->count();

            $total_on_process_document = $pic_total_on_process_document + $owner_total_on_process_document + $admin_total_on_process_document;

            // Mendapatkan data count without expired document
            $pic_total_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->whereHas('document_schedules', function($query) use ($userId) {  // Assuming a relationship named 'documentSchedules'
                $query->where('schedule_pics.user_pic_id', $userId);  // Filter documentSchedules with matching user_pic_id
            })
            ->where('documents.user_id', '!=', $userId)
            ->where('documents.status', 4)
            ->where('documents.deleted_at', null)
            ->count();

            $owner_total_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', $userId)
            ->where('documents.status', 4)
            ->where('documents.deleted_at', null)
            ->count();

            $admin_total_expired_document = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', $userId)
            ->where('documents.status', 4)
            ->where('documents.deleted_at', null)
            ->count();

            $total_expired_document = $pic_total_expired_document + $owner_total_expired_document + $admin_total_expired_document;

            $count_document = [
                'used_document' => $used_document,
                'unused_document' => $unused_document,
                'with_expired' => $with_expired_document,
                'without_expired' => $without_expired_document,
                'active' => $total_active_document,
                'to_process' => $total_to_process_document,
                'on_process' => $total_on_process_document,
                'expired' => $total_expired_document,
            ];

            // Mendapatkan data forecast document
            $forecast_data_pic = DocumentSchedule::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->leftJoin('schedule_pics', function ($join) {
                $join->on('document_schedules.id', '=', 'schedule_pics.document_schedule_id')
                     ->where('schedule_pics.user_pic_id', auth()->id());  // Filter within the join itself
            })
            ->leftJoin('documents', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.user_id', '!=', auth()->id())
            // ->where('documents.admin_id', '!=', auth()->id())
            ->select(
                'documents.id',  // Included in GROUP BY
                DB::raw('YEAR(schedule_date) AS year'),
                DB::raw('MONTH(schedule_date) AS month'),
                DB::raw('COUNT(*) AS total_documents')
            )
            ->groupBy('documents.id', DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))  // Group by document ID, year, and month
            ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            ->get();

            $forecast_data_owner = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.user_id', auth()->id())
            ->join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
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

            // $forecast_data_owner = DocumentSchedule::when($request->has('departments_select'), function($query) use ($request) {
            //     return $query->whereIn('department_name', $request->departments_select);
            // })->when($request->has('documenttypes_select'), function($query) use ($request) {
            //     return $query->whereIn('document_type_name', $request->documenttypes_select);
            // })->when($request->has('locations_select'), function($query) use ($request) {
            //     return $query->whereIn('location', $request->locations_select);
            // })->leftJoin('schedule_pics', function ($join) {
            //     $join->on('document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            //          ->where('schedule_pics.user_pic_id', '!=',auth()->id());  // Filter within the join itself
            // })
            // ->leftJoin('documents', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.user_id', auth()->id())
            // // ->where('documents.admin_id', '!=', auth()->id())
            // ->select(
            //     'documents.id',  // Included in GROUP BY
            //     DB::raw('YEAR(schedule_date) AS year'),
            //     DB::raw('MONTH(schedule_date) AS month'),
            //     DB::raw('COUNT(*) AS total_documents')
            // )
            // ->groupBy('documents.id', DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))  // Group by document ID, year, and month
            // ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            // ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            // ->get();

             $forecast_data_admin = $document_model::when($request->has('departments_select'), function($query) use ($request) {
                return $query->whereIn('department_name', $request->departments_select);
            })->when($request->has('documenttypes_select'), function($query) use ($request) {
                return $query->whereIn('document_type_name', $request->documenttypes_select);
            })->when($request->has('locations_select'), function($query) use ($request) {
                return $query->whereIn('location', $request->locations_select);
            })->where('documents.admin_id', auth()->id())
            ->join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
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

            // $forecast_data_admin = DocumentSchedule::when($request->has('departments_select'), function($query) use ($request) {
            //     return $query->whereIn('department_name', $request->departments_select);
            // })->when($request->has('documenttypes_select'), function($query) use ($request) {
            //     return $query->whereIn('document_type_name', $request->documenttypes_select);
            // })->when($request->has('locations_select'), function($query) use ($request) {
            //     return $query->whereIn('location', $request->locations_select);
            // })->leftJoin('schedule_pics', function ($join) {
            //     $join->on('document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            //          ->where('schedule_pics.user_pic_id', '!=',auth()->id());  // Filter within the join itself
            // })
            // ->leftJoin('documents', 'document_schedules.document_id', '=', 'documents.id')
            // ->where('documents.admin_id', auth()->id())
            // // ->where('documents.user_id', '!=', auth()->id())
            // ->select(
            //     'documents.id',  // Included in GROUP BY
            //     DB::raw('YEAR(schedule_date) AS year'),
            //     DB::raw('MONTH(schedule_date) AS month'),
            //     DB::raw('COUNT(*) AS total_documents')
            // )
            // ->groupBy('documents.id', DB::raw('YEAR(schedule_date)'), DB::raw('MONTH(schedule_date)'))  // Group by document ID, year, and month
            // ->orderBy(DB::raw('YEAR(schedule_date)'), 'asc')
            // ->orderBy(DB::raw('MONTH(schedule_date)'), 'asc')
            // ->get();


            $grouped_forecast_data = [];
            function add_to_grouped_data(&$grouped_data, $data) {
                foreach ($data as $item) {
                    $year = $item->year;
                    $month = $item->month;
                    $total_documents = $item->total_documents;

                    if (!isset($grouped_data[$year])) {
                        $grouped_data[$year] = [];
                    }

                    if (!isset($grouped_data[$year][$month])) {
                        $grouped_data[$year][$month] = 0;
                    }

                    $grouped_data[$year][$month] += $total_documents;
                }
            }
            
            // Adding data from each source to the grouped forecast data array
            add_to_grouped_data($grouped_forecast_data, $forecast_data_pic);
            add_to_grouped_data($grouped_forecast_data, $forecast_data_owner);
            add_to_grouped_data($grouped_forecast_data, $forecast_data_admin);

            // Convert the data to the desired format
            $final_grouped_forecast_data = [];
            foreach ($grouped_forecast_data as $year => $months) {
                foreach ($months as $month => $total_documents) {
                    $final_grouped_forecast_data[$year][] = [
                        'month' => $month,
                        'total_documents' => $total_documents,
                    ];
                }
            }

            logUserAccess("Dashboard");

            return view(
                "backend.index",
                compact('locations', 'departments', 'documenttypes', 'count_document', 'final_grouped_forecast_data')
            );
        }
    }

    public function calendar_event()
    {
        $user = auth()->user();
        $department_model = $this->department_model;
        $documenttype_model = $this->documenttype_model;
        $document_model = $this->document_model;

        if ($user->hasRole('super admin')) {
            $documents = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->select('documents.name', 'documents.status','document_schedules.schedule_date')
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->get();
        } else {
            $documents = $document_model::join('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->join('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->select('documents.name', 'documents.status','document_schedules.schedule_date')
            ->orWhere('documents.user_id', auth()->id())
            ->orWhere('documents.admin_id', auth()->id())
            ->orWhere('schedule_pics.user_pic_id', auth()->id())
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0)
            ->get();
        }

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
