<?php

namespace Modules\Document\Http\Controllers\Backend;

use App\Authorizable;
use App\Http\Controllers\Backend\BackendBaseController;
use Carbon\Carbon;
use Flash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Modules\Document\Events\NewDocumentCreated;
use Modules\Document\Notifications\DocumentCreated;
use Modules\Comment\Notifications\NewCommentAdded;
use App\Notifications\NewUserDocumentCreated;
use Modules\Category\Models\Category;
use Modules\Department\Models\Department;
use Modules\DocumentType\Models\DocumentType;
use Modules\Document\Models\Document;
use App\Models\User;
use App\Models\Counter;
use App\Models\DocumentSchedule;
use App\Models\SchedulePic;
use Modules\Article\Http\Requests\Backend\PostsRequest;
use Yajra\DataTables\DataTables;


class DocumentsController extends BackendBaseController
{
    use Authorizable;

    public function __construct()
    {
        // Page Title
        $this->module_title = 'Documents';

        // module name
        $this->module_name = 'documents';

        // directory path of the module
        $this->module_path = 'document::backend';

        // module icon
        $this->module_icon = 'fa-regular fa-file';

        // module model name, path
        $this->module_model = "Modules\Document\Models\Document";
    }

    public function index()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'List';

        $$module_name = $module_model::simplePaginate(15);

        logUserAccess($module_title.' '.$module_action);

        return view(
            "{$module_path}.{$module_name}.index_datatable",
            compact('module_title', 'module_name', "{$module_name}", 'module_icon', 'module_name_singular', 'module_action')
        );
    }

    /**
     * Retrieves a list of items based on the search term.
     *
     * @param  Request  $request  The HTTP request object.
     * @return JsonResponse The JSON response containing the list of items.
     */
    public function index_list(Request $request)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'List';

        $term = trim($request->q);

        if (empty($term)) {
            return response()->json([]);
        }

        $query_data = $module_model::where('name', 'LIKE', "%{$term}%")->limit(7)->get();

        $$module_name = [];

        foreach ($query_data as $row) {
            $$module_name[] = [
                'id' => $row->id,
                'text' => $row->name,
            ];
        }

        return response()->json($$module_name);
    }

    /**
     * Retrieves the data for the index page of the module.
     *
     * @return Illuminate\Http\JsonResponse
     */
    public function index_data()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'List';

        $page_heading = label_case($module_title);
        $title = $page_heading.' '.label_case($module_action);

        $$module_name = $module_model::select('id', 'user_id', 'status', 'code', 'name', 'department_name', 
        'document_type_name','description','updated_at', 'created_by')->with('document_schedules');

        $data = $$module_name;

        return Datatables::of($$module_name)
            ->addColumn('action', function ($data) {
                $module_name = $this->module_name;

                return view('backend.includes.action_column_document', compact('module_name', 'data'));
            })
            ->editColumn('status', function ($data) {
                switch ($data->status) {
                    case '1':
                        $return_string = '<span class="badge bg-success">Active</span>';
                        break;
        
                    case '2':
                        $return_string = '<span class="badge bg-warning text-dark">Inactive</span>';
                        break;
                    
                    case '3':
                        $return_string = '<span class="badge bg-danger">Expired</span>';
                        break;
        
                    default:
                        $return_string = '<span class="badge bg-primary">Status:'.$this->status.'</span>';
                        break;
                }
                return $return_string;
            })
            ->editColumn('schedule_date', function ($data) {
                if ($data->document_schedules->isNotEmpty()) {
                    $referenceDate = Carbon::parse($data->document_schedules->first()->schedule_date);
                    $today = Carbon::today();
                    $diffInDays = $referenceDate->diffInDays($today, false);
                    // Check for negative value
                    if ($diffInDays < 0) {
                        $output =  abs($diffInDays)." Hari Menuju expired"; // Absolute value for formatting
                    } else {
                        $output = abs($diffInDays)." Hari Lewat expired";
                    }
                    
                    // Format with desired units
                    $formattedOutput = $referenceDate->format('Y-m-d') . " ( $output )";
                    return $formattedOutput;
                } else {
                    return '-';
                }
            })
            ->editColumn('schedule_date', '<strong>{{$schedule_date}}</strong>')
            ->editColumn('name', '<strong>{{$name}}</strong>')
            ->editColumn('updated_at', function ($data) {
                $module_name = $this->module_name;

                $diff = Carbon::now()->diffInHours($data->updated_at);

                if ($diff < 25) {
                    return $data->updated_at->diffForHumans();
                }

                return $data->updated_at->isoFormat('llll');
            })
            ->rawColumns(['name', 'action', 'schedule_date', 'status'])
            ->orderColumns(['id'], '-:column $1')
            ->make(true);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Create';

        $users = User::pluck('name', 'id', 'department_id', 'department_name', 'email');
        $categories = DocumentType::pluck('name', 'id');
        $departments = Department::pluck('name', 'id');

        Log::info(label_case($module_title.' '.$module_action).' | User:'.Auth::user()->name.'(ID:'.Auth::user()->id.')');

        return view(
            "document::backend.{$module_name}.create",
            compact('module_title', 'module_name', 'module_path','module_icon', 'module_action', 'module_name_singular', 'categories', 'departments', 'users')
        );
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Store';

        try {
            DB::beginTransaction();
            // Validasi input
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'document_type' => 'required|exists:document_types,id',
                'department' => 'required|exists:departments,id',
                'description' => 'nullable|string',
                'expiration_date' => 'required|date',
                'reminder_day' => 'required|integer',
                'reminder_repeat' => 'required|integer',
                'reminder_interval' => 'required|integer',
                'owner' => 'required|string',
                'pic_list' => 'nullable|array',
                'file' => 'nullable|string',
                'location' => 'nullable|string',
                'description' => 'nullable|string',
            ]);

            // Mendapatkan kode dokumen
            $document_count = Counter::firstOrCreate(['year' => now()->year])->counter;
            Counter::where('year', now()->year)->increment('counter');
            $code = "DOC-".now()->year."-".$document_count;

            // Buat dokumen baru
            $document = Document::create([
                'user_id' => $validatedData['owner'],
                'document_type_id' => $validatedData['document_type'],
                'department_id' => $validatedData['department'],
                'file' => $validatedData['file'],
                'code' => $code,
                'name' => $validatedData['name'],
                'location' => $validatedData['location'],
                'description' => $validatedData['description'],
                'status' => 1,
            ]);
    
            $date = Carbon::parse($validatedData['expiration_date']);
            $dateWithTime = $date->startOfDay();

            // Buat jadwal dokumen
            $schedule = DocumentSchedule::create([
                'document_id' => $document->id,
                'schedule_timestamp' => $dateWithTime,
                'schedule_date' => $validatedData['expiration_date'],
                'reminder_day' => $validatedData['reminder_day'],
                'reminder_repeat' => $validatedData['reminder_repeat'],
                'reminder_interval' => $validatedData['reminder_interval'],
            ]);

            $user = User::where('id', '=', $validatedData['owner'])->first();
            // Mail::to($user)
            // ->send(new NewUserDocumentCreated($document));

            $user->notify(new NewUserDocumentCreated($document, $schedule));
            auth()->user()->notify(new DocumentCreated($$module_name_singular));
            // $user->sendEmailVerificationNotification();
            // $user = auth()->user();
            // $user->notify(new NewUserDocumentCreated($document));
            // auth()->user()->notify(new NewCommentAdded('Comment'));
    
            // Buat penugasan PIC
            foreach ($validatedData['pic_list'] as $userPicId) {
                SchedulePic::create([
                    'document_schedule_id' => $schedule->id,
                    'user_pic_id' => $userPicId,
                ]);
            }
    
            DB::commit();
            // Berikan respons sukses
            Flash::success("<i class='fas fa-check'></i> New '".Str::singular($module_title)."' Added")->important();
            Log::info(label_case($module_title.' '.$module_action)." | '".$$module_name_singular->name.'(ID:'.$$module_name_singular->id.") ' by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect("admin/{$module_name}");
            // Berikan respons sukses
        } catch (\Exception $e) {
            DB::rollBack();
            session()->put('form_data', $request->all());
            Log::error(label_case($module_title.' '.$module_action)." | Error Creating Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Show';

        $$module_name_singular = $module_model::findOrFail($id);
        // get data document shcedule
        $documentSchedule = DocumentSchedule::where('document_id', $$module_name_singular->id)->first();
        // get data document PIC
        $documentPic = SchedulePic::where('document_schedule_id', $documentSchedule->id)->with('userPic')->get();
        
        // data schedule
        $referenceDate = Carbon::parse($documentSchedule->schedule_date);
        $today = Carbon::today();
        $diffInDays = $referenceDate->diffInDays($today, false);
            // Check for negative value
        if ($diffInDays < 0) {
            $outputScheduleDate =  abs($diffInDays)." Hari Menuju expired"; // Absolute value for formatting
        } else {
            $outputScheduleDate = abs($diffInDays)." Hari Lewat expired";
        }
            // Format with desired units
        $formattedExpired = $referenceDate->format('Y-m-d') . " ( $outputScheduleDate )";

        Log::info(label_case($module_title.' '.$module_action).' | User:'.Auth::user()->name.'(ID:'.Auth::user()->id.')');

        return view(
            "document::backend.{$module_name}.show",
            compact('module_title', 'module_name', 'module_icon', 'module_name_singular', 'module_action', "{$module_name_singular}", 'formattedExpired', 'documentPic', 'documentSchedule')
        );
    }

    /**
     * Delete PIC in Document.
     *
     * @param  int  $id
     * @return Response
     */
    public function deletePic($id)
    {

        $deleted = SchedulePic::where('id', $id)->forceDelete();
        if ($deleted) {
            Flash::success("Success Delete PIC")->important();
            Log::info(label_case("Document delete PIC").' | User:'.Auth::user()->name.'(ID:'.Auth::user()->id.')');

            return redirect()->back();
        } else {
            Log::error(label_case("Document delete PIC")." | Error Delete PIC by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors("Error Delete PIC");
        }
        
        
    }

    /**
     * Add PIC in Document.
     *
     * @param  Request  $request
     * @return Response
     */
    public function add_pic(Request $request)
    {

        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        try {
            DB::beginTransaction();
           
            // Buat penugasan PIC
            foreach ($request->pic_list as $userPicId) {
                SchedulePic::create([
                    'document_schedule_id' => $request->document_shcedule_id,
                    'user_pic_id' => $userPicId,
                ]);
            }
    
            DB::commit();
            // Berikan respons sukses
            Flash::success("<i class='fas fa-check'></i> New '".Str::singular($module_title)."' PIC Assign")->important();
            Log::info(label_case("Assign Document PIC")." | '' by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back();
            // Berikan respons sukses
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error(label_case("Assign Document PIC")." | Error Creating Assign PIC Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }
        
        
    }

    /**
     * Renew schedule in Document.
     *
     * @param  Request  $request
     * @return Response
     */
    public function renew_document(Request $request)
    {

        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        try {
            DB::beginTransaction();
           
            // Buat penugasan PIC
            foreach ($request->pic_list as $userPicId) {
                SchedulePic::create([
                    'document_schedule_id' => $request->document_shcedule_id,
                    'user_pic_id' => $userPicId,
                ]);
            }
    
            DB::commit();
            // Berikan respons sukses
            Flash::success("<i class='fas fa-check'></i> New '".Str::singular($module_title)."' PIC Assign")->important();
            Log::info(label_case("Assign Document PIC")." | '' by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back();
            // Berikan respons sukses
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error(label_case("Assign Document PIC")." | Error Creating Assign PIC Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }
        
        
    }
    
}
