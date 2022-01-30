<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
Route::get('/posts', 'PostsController@index');
Route::post('/posts/store', 'PostsController@store');
Route::get('/posts/{id?}', 'PostsController@show');
Route::post('/posts/update/{id?}', 'PostsController@update');
Route::delete('/posts/{id?}', 'PostsController@destroy');

Route::get('/employees', 'EmployeeController@index');
Route::get('/employees/joindate}', 'EmployeeController@joindate');
Route::get('/employees/paidleavereport', 'EmployeeController@showmost');
Route::post('/employees/store', 'EmployeeController@store');
Route::get('/employees/{id?}', 'EmployeeController@show');
Route::post('/employees/update/{id?}', 'EmployeeController@update');
Route::delete('/employees/{id?}', 'EmployeeController@destroy');

Route::get('/paidleaves', 'PaidLeavesController@index');
Route::post('/paidleaves/store', 'PaidLeavesController@store');
Route::get('/paidleaves/{id?}', 'PaidLeavesController@show');
Route::post('/paidleaves/update/{id?}', 'PaidLeavesController@update');
Route::delete('/paidleaves/{id?}', 'PaidLeavesController@destroy');


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [RegisterController::class, 'register']);
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth:api');