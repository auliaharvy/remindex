<?php

namespace Modules\Document\Models\Presenters;

use Illuminate\Support\Facades\Cache;

/**
 * Presenter Class for Book Module.
 */
trait DocumentPresenter
{
    /**
     * Get Status Label.
     */
    public function getStatusLabelAttribute()
    {
        $return_string = '';
        switch ($this->status) {
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
    }

}
