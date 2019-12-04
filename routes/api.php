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


Route::post('user/register', 'UserController@store');
Route::post('user/login', 'UserController@login');
Route::middleware('auth:user_api')->post('web/user/transfer','UserController@transfer');
Route::middleware('auth:user_api')->get('web/user/watch', 'UserController@index');
Route::middleware('auth:user_api')->get('user/logout', 'UserController@logout');

Route::post('shop/register', 'ShopController@store');
Route::post('shop/login', 'ShopController@login');
Route::middleware('auth:api')->post('web/shop/transfer','ShopController@transfer');
Route::middleware('auth:api')->get('web/shop/watch', 'ShopController@index');
Route::middleware('auth:api')->get('shop/logout', 'ShopController@logout');

Route::middleware('auth:api')->get('admin/watch', 'ShopController@admin');
Route::put('user/update/{id}','UserController@update');
Route::put('shop/update/{id}','ShopController@update');

Route::post('shop/transfer', 'ApiController@shopTransfer');
Route::post('user/transfer', 'ApiController@userTransfer');
Route::post('user/watch', 'ApiController@userIndex');
Route::post('shop/watch', 'ApiController@shopIndex');
Route::post('user/deposit', 'ApiController@deposit');
Route::post('user/withdraw', 'ApiController@withdraw');
Route::post('user/deposit/watch', 'ApiController@depositRecord');
