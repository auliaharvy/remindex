<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*
*
* Frontend Routes
*
* --------------------------------------------------------------------
*/
Route::group(['namespace' => '\Modules\Document\Http\Controllers\Frontend', 'as' => 'frontend.', 'middleware' => 'web', 'prefix' => ''], function () {

    /*
     *
     *  Frontend Documents Routes
     *
     * ---------------------------------------------------------------------
     */
    $module_name = 'documents';
    $controller_name = 'DocumentsController';
    Route::get("$module_name", ['as' => "$module_name.index", 'uses' => "$controller_name@index"]);
    Route::get("$module_name/{id}/{slug?}", ['as' => "$module_name.show", 'uses' => "$controller_name@show"]);
});

/*
*
* Backend Routes
*
* --------------------------------------------------------------------
*/
Route::group(['namespace' => '\Modules\Document\Http\Controllers\Backend', 'as' => 'backend.', 'middleware' => ['web', 'auth', 'can:view_backend'], 'prefix' => 'admin'], function () {
    /*
    * These routes need view-backend permission
    * (good if you want to allow more than one group in the backend,
    * then limit the backend features by different roles or permissions)
    *
    * Note: Administrator has all permissions so you do not have to specify the administrator role everywhere.
    */

    /*
     *
     *  Backend Documents Routes
     *
     * ---------------------------------------------------------------------
     */
    $module_name = 'documents';
    $controller_name = 'DocumentsController';
    Route::get("$module_name/index_list", ['as' => "$module_name.index_list", 'uses' => "$controller_name@index_list"]);
    Route::get("$module_name/index_data", ['as' => "$module_name.index_data", 'uses' => "$controller_name@index_data"]);
    Route::get("$module_name/trashed", ['as' => "$module_name.trashed", 'uses' => "$controller_name@trashed"]);
    Route::patch("$module_name/trashed/{id}", ['as' => "$module_name.restore", 'uses' => "$controller_name@restore"]);
    Route::resource("$module_name", "$controller_name");
    Route::get("$module_name/{id}/renew", ['as' => "$module_name.renew", 'uses' => "$controller_name@renew"]);
    Route::patch("$module_name/{id}/renew", ['as' => "$module_name.renew.update", 'uses' => "$controller_name@renew_update"]);
    Route::get("$module_name/progress/{id}", ['as' => "$module_name.progress", 'uses' => "$controller_name@progress_document"]);
    Route::get("$module_name/export", ['as' => "$module_name.export", 'uses' => "$controller_name@export_document"]);
    Route::post("$module_name/import", ['as' => "$module_name.import", 'uses' => "$controller_name@import"]);

    Route::get("$module_name/delete-pic/{id}", ['as' => "$module_name.delete.pic", 'uses' => "$controller_name@deletePic"]);
    Route::post("$module_name/add-pic", ['as' => "$module_name.add_pic", 'uses' => "$controller_name@add_pic"]);
});
