<?php

namespace Modules\Department\Http\Controllers\Backend;

use App\Authorizable;
use App\Http\Controllers\Backend\BackendBaseController;

class DepartmentsController extends BackendBaseController
{
    use Authorizable;

    public function __construct()
    {
        // Page Title
        $this->module_title = 'Departments';

        // module name
        $this->module_name = 'departments';

        // directory path of the module
        $this->module_path = 'department::backend';

        // module icon
        $this->module_icon = 'fa-regular fa-sun';

        // module model name, path
        $this->module_model = "Modules\Department\Models\Department";
    }

}
