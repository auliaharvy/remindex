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
use App\Notifications\NewUserDocumentCreatedWithoutSchedule;
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
use App\Exports\DocumentsExport;
use App\Imports\DocumentsImport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Storage;



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
        $user = auth()->user();
        $userId = Auth::id();

        $page_heading = label_case($module_title);
        $title = $page_heading.' '.label_case($module_action);

        if ($user->hasRole('super admin')) {
            $$module_name = $module_model::select('id', 'user_id', 'status', 'code', 'name', 'department_name',
            'document_type_name','description', 'file','updated_at', 'created_by')
            ->with('document_schedules');
        } else {
            $$module_name = $module_model::select('documents.id', 'documents.user_id', 'documents.status', 'documents.code', 'documents.name', 'documents.department_name',
            'documents.document_type_name','documents.description', 'documents.file','documents.updated_at', 'documents.created_by')
            ->leftJoin('document_schedules', 'documents.id', '=', 'document_schedules.document_id')
            ->leftJoin('schedule_pics', 'document_schedules.id', '=', 'schedule_pics.document_schedule_id')
            ->orWhere('documents.user_id', auth()->id())
            ->orWhere('documents.admin_id', auth()->id())
            ->orWhere('schedule_pics.user_pic_id', auth()->id())
            ->where('documents.deleted_at', null)
            ->where('documents.is_expired',0);
        }


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
                        $return_string = '<span class="badge bg-warning text-dark">To be Process</span>';
                        break;

                    case '3':
                        $return_string = '<span class="badge bg-warning text-dark">On Process</span>';
                        break;

                    case '4':
                        $return_string = '<span class="badge bg-danger">Expired</span>';
                        break;

                    case '5':
                        $return_string = '<span class="badge bg-danger">Without Expiration</span>';
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
            ->editColumn('name', function ($data) {
                if ($data->file) {
                    $fileUrl = url("uploads/$data->file");
                    $return_string = "<a href='$fileUrl' data-toggle='tooltip' title='Download File'><strong>{$data->name}</strong></a>";
                    return $return_string;
                } else {
                    $return_string = "<strong>{$data->name}</strong>";
                    return $return_string;
                }
            })
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
        $document_types = DocumentType::pluck('name', 'id');
        $departments = Department::pluck('name', 'id');

        Log::info(label_case($module_title.' '.$module_action).' | User:'.Auth::user()->name.'(ID:'.Auth::user()->id.')');

        return view(
            "document::backend.{$module_name}.create",
            compact('module_title', 'module_name', 'module_path','module_icon', 'module_action', 'module_name_singular', 'document_types', 'departments', 'users')
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

            if($request->expiration_date){
                // Validasi input
                $validatedData = $request->validate([
                    'name' => 'required|string|max:255',
                    'document_type_id' => 'required|exists:document_types,id',
                    'department_id' => 'required|exists:departments,id',
                    'description' => 'nullable|string',
                    'expiration_date' => 'required|date',
                    'reminder_day' => 'required|integer',
                    'reminder_repeat' => 'required|integer',
                    'reminder_interval' => 'required|integer',
                    'user_id' => 'required|string',
                    'admin_id' => 'required|string',
                    'pic_list' => 'nullable|array',
                    // 'file' => 'nullable|string',
                    'location' => 'nullable|string',
                    'source' => 'nullable|string',
                    'is_used' => 'nullable|integer',
                    'is_expired' => 'nullable|integer',
                    'description' => 'nullable|string',
                ]);

                // Mendapatkan kode dokumen
                $document_count = Counter::firstOrCreate(['year' => now()->year])->counter;
                Counter::where('year', now()->year)->increment('counter');
                $code = "DOC-".now()->year."-".$document_count;
                $reminder_gap = Carbon::now()->diffInDays($validatedData['expiration_date']);
                $today = Carbon::now();
                if($reminder_gap < $validatedData['reminder_day'] ) {
                    $status = 2;
                } elseif($validatedData['expiration_date'] <  $today) {
                    $status = 4;
                } else{
                    $status = 1;
                }
                // Buat dokumen baru
                $document = Document::create([
                    'user_id' => $validatedData['user_id'],
                    'admin_id' => $validatedData['admin_id'],
                    'document_type_id' => $validatedData['document_type_id'],
                    'department_id' => $validatedData['department_id'],
                    // 'file' => $validatedData['file'],
                    'code' => $code,
                    'name' => $validatedData['name'],
                    'location' => $validatedData['location'],
                    'description' => $validatedData['description'],
                    'source' => $validatedData['source'],
                    'is_used' => $validatedData['is_used'],
                    'is_expired' => 0,
                    'status' => $status,
                ]);

                $date = Carbon::parse($validatedData['expiration_date']);
                $dateWithTime = $date->startOfDay();
                $nextRemindAt = Carbon::now()->subDays($validatedData['reminder_day']);
                $reminder_gap = Carbon::now()->diffInDays($validatedData['expiration_date']);


                // Buat jadwal dokumen
                $schedule = DocumentSchedule::create([
                    'document_id' => $document->id,
                    'schedule_timestamp' => $dateWithTime,
                    'schedule_date' => $validatedData['expiration_date'],
                    'reminder_day' => $validatedData['reminder_day'],
                    'reminder_repeat' => $validatedData['reminder_repeat'],
                    'reminder_interval' => $validatedData['reminder_interval'],
                    'next_reminder' => $nextRemindAt,
                ]);

                
                // $user->sendEmailVerificationNotification();
                // $user = auth()->user();
                // $user->notify(new NewUserDocumentCreated($document));
                // auth()->user()->notify(new NewCommentAdded('Comment'));

                
            } else {
                // Validasi input
                $validatedData = $request->validate([
                    'name' => 'required|string|max:255',
                    'document_type_id' => 'required|exists:document_types,id',
                    'department_id' => 'required|exists:departments,id',
                    'description' => 'nullable|string',
                    'user_id' => 'required|string',
                    'admin_id' => 'required|string',
                    'file' => 'nullable|string',
                    'location' => 'nullable|string',
                    'source' => 'nullable|string',
                    'is_used' => 'nullable|integer',
                ]);

                // Mendapatkan kode dokumen
                $document_count = Counter::firstOrCreate(['year' => now()->year])->counter;
                Counter::where('year', now()->year)->increment('counter');
                $code = "DOC-".now()->year."-".$document_count;

                // Buat dokumen baru
                $document = Document::create([
                    'user_id' => $validatedData['user_id'],
                    'admin_id' => $validatedData['admin_id'],
                    'document_type_id' => $validatedData['document_type_id'],
                    'department_id' => $validatedData['department_id'],
                    // 'file' => $validatedData['file'],
                    'code' => $code,
                    'name' => $validatedData['name'],
                    'location' => $validatedData['location'],
                    'description' => $validatedData['description'],
                    'source' => $validatedData['source'],
                    'is_used' => $validatedData['is_used'],
                    'is_expired' => 1,
                    'status' => 5,
                ]);

                // $user = User::where('id', '=', $validatedData['user_id'])->first();
                // $admin = User::where('id', '=', $validatedData['admin_id'])->first();
                // $user->notify(new NewUserDocumentCreatedWithoutSchedule($document));
                // $admin->notify(new NewUserDocumentCreatedWithoutSchedule($document));
            }

            if ($request->file) {
                $fileName = time().'.'.$request->file->extension();
                $request->file->move(public_path('uploads'), $fileName);
                $document->file = $fileName;
                $document->save();
            }

            if($request->expiration_date){
                $user = User::where('id', '=', $validatedData['user_id'])->first();
                $admin = User::where('id', '=', $validatedData['admin_id'])->first();
                $user->notify(new NewUserDocumentCreated($document, $schedule));
                $admin->notify(new NewUserDocumentCreated($document, $schedule));
                // Buat penugasan PIC
                foreach ($validatedData['pic_list'] as $userPicId) {
                    SchedulePic::create([
                        'document_schedule_id' => $schedule->id,
                        'user_pic_id' => $userPicId,
                    ]);
                    $userPic = User::where('id', '=', $userPicId)->first();
                    $userPic->notify(new NewUserDocumentCreated($document, $schedule));
                }
            } else {
                $user = User::where('id', '=', $validatedData['user_id'])->first();
                $admin = User::where('id', '=', $validatedData['admin_id'])->first();
                $user->notify(new NewUserDocumentCreatedWithoutSchedule($document));
                $admin->notify(new NewUserDocumentCreatedWithoutSchedule($document));
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

        if($$module_name_singular->is_expired == 0) {
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
        } else {
            Log::info(label_case($module_title.' '.$module_action).' | User:'.Auth::user()->name.'(ID:'.Auth::user()->id.')');

            return view(
                "document::backend.{$module_name}.show",
                compact('module_title', 'module_name', 'module_icon', 'module_name_singular', 'module_action', "{$module_name_singular}")
            );
        }


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     * @return \Illuminate\Contracts\View\View
     */
    public function edit($id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Edit';

        $$module_name_singular = $module_model::findOrFail($id);

        // $documentSchedule = DocumentSchedule::where('document_id', $$module_name_singular->id)->first();
        // get data document PIC
        // $documentPic = SchedulePic::where('document_schedule_id', $documentSchedule->id)->with('userPic')->get();
        $document_types = DocumentType::pluck('name', 'id');
        $departments = Department::pluck('name', 'id');
        $users = User::pluck('name', 'id');
        $data = $$module_name_singular;

        logUserAccess($module_title.' '.$module_action.' | Id: '.$$module_name_singular->id);

        return view(
            "{$module_path}.{$module_name}.edit",
            compact('document_types', 'users', 'departments', 'module_title', 'module_name', 'module_path', 'module_icon', 'module_action', 'module_name_singular', "{$module_name_singular}")
        );
    }

    /**
     * Updates a resource.
     *
     * @param  int  $id
     * @param  Request  $request  The request object.
     * @param  mixed  $id  The ID of the resource to update.
     * @return Response
     * @return RedirectResponse The redirect response.
     *
     * @throws ModelNotFoundException If the resource is not found.
     */
    public function update(Request $request, $id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Update';

        try {
            DB::beginTransaction();
            // Validasi input
            $$module_name_singular = $module_model::findOrFail($id);


            $$module_name_singular->update($request->all());

            if ($request->file) {
                $fileName = time().'.'.$request->file->extension();
                $request->file->move(public_path('uploads'), $fileName);
                $$module_name_singular->file = $fileName;
                $$module_name_singular->save();
            }

            flash(icon().' '.Str::singular($module_title)."' Update Successfully")->success()->important();

            logUserAccess($module_title.' '.$module_action.' | Id: '.$$module_name_singular->id);

            return redirect()->route("backend.{$module_name}.show", $$module_name_singular->id);
        } catch (\Exception $e) {
            DB::rollBack();
            session()->put('form_data', $request->all());
            Log::error(label_case($module_title.' '.$module_action)." | Error Renew Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     * @return \Illuminate\Contracts\View\View
     */
    public function renew($id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Renew';

        $$module_name_singular = $module_model::findOrFail($id);

        // $documentSchedule = DocumentSchedule::where('document_id', $$module_name_singular->id)->first();
        // get data document PIC
        // $documentPic = SchedulePic::where('document_schedule_id', $documentSchedule->id)->with('userPic')->get();
        $document_types = DocumentType::pluck('name', 'id');
        $data = $$module_name_singular;

        logUserAccess($module_title.' '.$module_action.' | Id: '.$$module_name_singular->id);

        return view(
            "{$module_path}.{$module_name}.renew",
            compact('document_types' ,'module_title', 'module_name', 'module_path', 'module_icon', 'module_action', 'module_name_singular', "{$module_name_singular}")
        );
    }

    /**
     * Updates a resource.
     *
     * @param  int  $id
     * @param  Request  $request  The request object.
     * @param  mixed  $id  The ID of the resource to update.
     * @return Response
     * @return RedirectResponse The redirect response.
     *
     * @throws ModelNotFoundException If the resource is not found.
     */
    public function renew_update(Request $request, $id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Renew';

        try {
            DB::beginTransaction();
            // Validasi input
            $$module_name_singular = $module_model::findOrFail($id);

            $validatedData = $request->validate([
                'expiration_date' => 'required|date',
                'reminder_day' => 'required|integer',
                'reminder_repeat' => 'required|integer',
                'reminder_interval' => 'required|integer',
            ]);

            $schedule = DocumentSchedule::where('document_id', $id)->first();
            $schedule->schedule_date = $validatedData['expiration_date'];
            $schedule->reminder_day = $validatedData['reminder_day'];
            $schedule->reminder_repeat = $validatedData['reminder_repeat'];
            $schedule->reminder_interval = $validatedData['reminder_interval'];
            $schedule->save();

            $$module_name_singular->update($request->all());

            $reminder_gap = Carbon::now()->diffInDays($validatedData['expiration_date']);
            $today = Carbon::now();
            if($reminder_gap < $validatedData['reminder_day'] ) {
                $status = 2;
            } elseif($validatedData['expiration_date'] <  $today) {
                $status = 4;
            } else{
                $status = 1;
            }

            $$module_name_singular->status = $status;
            $$module_name_singular->save();

            if ($request->file) {
                $fileName = time().'.'.$request->file->extension();
                $request->file->move(public_path('uploads'), $fileName);
                $$module_name_singular->file = $fileName;
                $$module_name_singular->save();
            }

            flash(icon().' '.Str::singular($module_title)."' Renew Successfully")->success()->important();

            logUserAccess($module_title.' '.$module_action.' | Id: '.$$module_name_singular->id);

            return redirect()->route("backend.{$module_name}.show", $$module_name_singular->id);
        } catch (\Exception $e) {
            DB::rollBack();
            session()->put('form_data', $request->all());
            Log::error(label_case($module_title.' '.$module_action)." | Error Renew Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }
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

    /**
     * Renew schedule in Document.
     *
     * @param  Request  $request
     * @return Response
     */
    public function progress_document($id)
    {

        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        try {
            DB::beginTransaction();

            $$module_name_singular = $module_model::findOrFail($id);
            $$module_name_singular->status = 3;
            $$module_name_singular->save();


            DB::commit();
            // Berikan respons sukses
            Flash::success("<i class='fas fa-check'></i> Progress '".Str::singular($module_title)."' Success")->important();
            Log::info(label_case("Progress Document")." | '' by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back();
            // Berikan respons sukses
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error(label_case("Assign Document PIC")." | Error Progress Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }


    }


    /**
     * Send Email Reminder.
     *
     * @return Response
     */
    public function document_reminder()
    {

        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $reminders = DocumentSchedule::where('schedule_date', '>', Carbon::now())
            ->where('reminder_day', '<=', Carbon::now()->diffInDays($schedule_date))
            ->where('email_sent', false)
            ->get();

        foreach ($reminders as $reminder) {
            // Hitung waktu pengingat berikutnya
            $nextRemindAt = Carbon::now()->addDays($reminder->reminder_day);

            // Kirim email pengingat
            $reminder->sendEmail();

            // Update data reminder
            $reminder->reminder_day--;
            $reminder->reminder_day--;
            $reminder->save();
        }

    }

    /**
     * Export Document Data.
     *
     * @return Response
     */
    public function export()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        // return redirect()->back();
        return Excel::download(new DocumentsExport, 'document.xlsx');
    }

    public function import(Request $request)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Import';

        try {
            DB::beginTransaction();
            // $this->validate($request, [
            //     'file' => 'required|mimes:csv,xls,xlsx'
            // ]);

            $file = $request->file('file');

            // membuat nama file unik
            $nama_file = $file->hashName();

            //temporary file
            $path = $file->storeAs('public/excel/',$nama_file);

            // import data
            $import = Excel::import(new DocumentsImport(), storage_path('app/public/excel/'.$nama_file));

            //remove from server
            Storage::delete($path);


            DB::commit();
            $message = "<i class='fas fa-check'></i> Import '" . Str::singular($module_title) . "' Success with " . session('successCount') . " rows, " . session('failureCount') . " failed";

            if (session('errors')) {
                $message .= "<br>Errors: <ul>";
                foreach (session('errors') as $error) {
                    $message .= "<li>$error</li>";
                }
                $message .= "</ul>";
            }

            // Berikan respons sukses
            Flash::success($message)->important();
            Log::info(label_case($module_title . ' ' . $module_action) ." | Success Import Document by User:". Auth::user()->name . '(ID:' . Auth::user()->id . ')');
            // return redirect("admin/{$module_name}");
            // return redirect()->back();
            $$module_name = $module_model::simplePaginate(15);

            // logUserAccess($module_title.' '.$module_action);

            return view(
                "{$module_path}.{$module_name}.index_datatable",
                compact('module_title', 'module_name', "{$module_name}", 'module_icon', 'module_name_singular', 'module_action')
            );
            // Berikan respons sukses
        } catch (\Exception $e) {
            DB::rollBack();
            Storage::delete($path);
            Log::error(label_case($module_title.' '.$module_action)." | Error Import Document by User:".Auth::user()->name.'(ID:'.Auth::user()->id.')');
            return redirect()->back()->withErrors($e->getMessage())->withInput($request->all());
        }
    }
}
