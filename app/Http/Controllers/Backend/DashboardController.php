<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function __construct()
    {
        // module model name, path
        $this->dokumen_model = "Modules\Department\Models\Department";
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function index()
    {
        $dokumen_model = $this->dokumen_model;
        $total_dokumen = $dokumen_model::count();
        return view('backend.index', ['total_dokumen' => $total_dokumen]);
    }
}
