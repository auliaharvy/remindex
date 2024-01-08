<?php

namespace Modules\Document\Http\Middleware;

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

            // Documents
            // $menu->add('<i class="nav-icon fa-regular fa-sun"></i> '.__('Documents'), [
            //     'route' => 'backend.documents.index',
            //     'class' => 'nav-item',
            // ])
            // ->data([
            //     'order'         => 77,
            //     'activematches' => ['admin/documents*'],
            //     'permission'    => ['view_documents'],
            // ])
            // ->link->attr([
            //     'class' => 'nav-link',
            // ]);
            $menu = $menu->add('<i class="nav-icon fa fa-file"></i> Documents', [
                'class' => 'nav-group',
            ])
                ->data([
                    'order' => 2,
                    'activematches' => [
                        'admin/documents*',
                    ],
                    'permission' => ['view_documents'],
                ]);
            $menu->link->attr([
                'class' => 'nav-link nav-group-toggle',
                'href' => '#',
            ]);

            // Submenu: List Dokumen
            $menu->add('<i class="nav-icon fa fa-list"></i> '.__('List'), [
                'route' => 'backend.documents.index',
                'class' => 'nav-item',
            ])
            ->data([
                'order'         => 3,
                'activematches' => ['admin/documents*'],
                'permission'    => ['view_documents'],
            ])
            ->link->attr([
                'class' => 'nav-link',
            ]);

            // Submenu: Create Dokumen
            $menu->add('<i class="nav-icon fa fa-plus"></i> '.__('Create'), [
                'route' => 'backend.documents.create',
                'class' => 'nav-item',
            ])
            ->data([
                'order'         => 3,
                'activematches' => ['admin/documents*'],
                'permission'    => ['view_documents'],
            ])
            ->link->attr([
                'class' => 'nav-link',
            ]);
        })->sortBy('order');

        return $next($request);
    }
}
