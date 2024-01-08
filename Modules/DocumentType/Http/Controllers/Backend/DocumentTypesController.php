<?php

namespace Modules\DocumentType\Http\Controllers\Backend;

use App\Authorizable;
use App\Http\Controllers\Backend\BackendBaseController;

class DocumentTypesController extends BackendBaseController
{
    use Authorizable;

    public function __construct()
    {
        // Page Title
        $this->module_title = 'Document Types';

        // module name
        $this->module_name = 'documenttypes';

        // directory path of the module
        $this->module_path = 'documenttype::backend';

        // module icon
        $this->module_icon = 'fa-solid fa-sitemap';

        // module model name, path
        $this->module_model = "Modules\DocumentType\Models\DocumentType";
    }

}
