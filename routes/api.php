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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', 'API\PassportController@register');
Route::post('login', 'API\PassportController@login');

Route::group(['middleware' => 'auth:api'], function(){
    Route::post('logout', 'API\PassportController@logout');
	Route::get('nearby-shops', 'API\ShopController@getNearbyShops');
	Route::get('preffered-shops', 'API\ShopController@getprefferedShops');
	Route::post('new-opinion', 'API\OpinionController@store');
	Route::delete('remove-like-{id}', 'API\OpinionController@destroy');
	Route::post('set-location', 'API\LocationController@store');
	Route::put('set-location', 'API\LocationController@update');
});