<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

class BackendController extends Controller
{
    public function __construct()
    {
        $this->department_model = "Modules\Department\Models\Department";
        $this->documenttype_model = "Modules\DocumentType\Models\DocumentType";
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function index()
    {
        $department_model = $this->department_model;
        $departments = $department_model::select('name', 'id')->get();

        $documenttype_model = $this->documenttype_model;
        $documenttypes = $documenttype_model::select('name', 'id')->get();
        return view(
            "backend.index",
            compact('departments', 'documenttypes')
        );
    }
}
