<?php
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\CategoryController;
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
Route::redirect('/', 'login');

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', function () {
        return view('backend.pages.dashboard');
    })->name('dashboard');
    Route::post('users/{id}/update/password', [UserController::class , 'updatePassword'])->name('users.update.password');
    Route::resource('users', UserController::class);
    Route::resource('categories', CategoryController::class);
});

require __DIR__.'/auth.php';
