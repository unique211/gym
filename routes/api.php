<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['basicAuth'])->group(function () {
    //All the routes are placed in here

    ///for Package Api start---
    Route::resource('package', 'PackageController');
   // Route::post('insert', 'PackageController@store');
    Route::get('getallpackage', 'PackageController@get_packages');
    Route::get('getpackage/{id}', 'PackageController@getpackage');
    Route::get('deletepackage/{id}', 'PackageController@deletepackage');

    //for class Category Api Strat------
    Route::resource('class_category', 'Class_CategoryController');
    Route::get('getall_classcategory', 'Class_CategoryController@getall_classcategory');
    Route::get('getsingleclasscategory/{id}', 'Class_CategoryController@getsingleclasscategory');

    //for room master
    Route::resource('room', 'RoomController');
    Route::get('getallroom', 'RoomController@getallroom');
    Route::get('getsingleroom/{id}', 'RoomController@getsingleroom');

    //for class master
    Route::resource('class', 'ClassController');
    Route::get('getallclass', 'ClassController@getallclass');
    Route::get('getsingleclass/{id}', 'ClassController@getsingleclass');

    //for class sechedule
    Route::resource('class_schedule', 'ClassScheduleController');
    Route::get('getscedulaclass', 'ClassScheduleController@getscedulaclass');
    Route::get('getsinglescedulaclass/{id}', 'ClassScheduleController@getsingleclassschedule');

    //for deal
    Route::resource('deals', 'DealsController');
    Route::get('getalldeal', 'DealsController@getalldeal');
    Route::get('getsingledeal/{id}', 'DealsController@getsingledeal');

    //for gallary
    Route::resource('gallery', 'GalleryController');
    Route::get('getallgallary', 'GalleryController@getallgallary');
    Route::get('getsinglegallary/{id}', 'GalleryController@getsingleallgallary');

    //for membertype
    Route::resource('member_type', 'MemberTypeController');
    Route::get('getallmemberttype', 'MemberTypeController@getallmemberttype');
    Route::get('getsinglegmembertype/{id}', 'MemberTypeController@getsinglegmembertype');


   
});

