<?php

namespace Modules\DocumentType\Http\Middleware;

use Closure;

class GenerateMenus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        /*
         *
         * Module Menu for Admin Backend
         *
         * *********************************************************************
         */
        \Menu::make('admin_sidebar', function ($menu) {

            // DocumentTypes
            // $menu->add('<i class="nav-icon fa-solid fa-sitemap"></i> '.__('Document Types'), [
            //     'route' => 'backend.documenttypes.index',
            //     'class' => 'nav-item',
            // ])
            // ->data([
            //     'order'         => 77,
            //     'activematches' => ['admin/documenttypes*'],
            //     'permission'    => ['view_documenttypes'],
            // ])
            // ->link->attr([
            //     'class' => 'nav-link',
            // ]);
        })->sortBy('order');

        return $next($request);
    }
}
