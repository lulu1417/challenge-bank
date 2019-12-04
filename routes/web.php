<?php

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

Route::get('/userHome', function () {
    return view('userHome');
});
Route::get('/shopHome', function () {
    return view('shopHome');
});
Route::get('/home', function () {
    return view('home');
});

Route::get('shop/login', 'WebController@shopLoginForm')->name('shopForm');
Route::post('shop/login', 'WebController@shopLogin')->name('shopLogin');

//post login data
Route::get('user/login', 'WebController@userLoginForm')->name('userForm');
Route::post('user/login', 'WebController@userLogin')->name('userLogin');

Route::get('watch', 'WebController@admin');

