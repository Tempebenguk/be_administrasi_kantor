<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/login', App\Http\Controllers\Api\LoginController::class)->name('login');
Route::post('/logout', App\Http\Controllers\Api\LogoutController::class)->name('logout');


/**
 * admin
 * @method "GET"
 */
Route::middleware('auth:api-admin')->get('/useradmin', function (Request $request) {
    return $request->user();
});

/**
 * pegawai
 * @method "GET"
 */
Route::middleware('auth:api-pegawai')->get('/userpegawai', function (Request $request) {
    return $request->user();
});


Route::group(['middleware' => ['auth:api-admin']], function () {
    // Jadwal
    Route::get('/jadwal', [App\Http\Controllers\Api\jadwalController::class, 'index']);
    Route::get('/jadwal/{id}', [App\Http\Controllers\Api\jadwalController::class, 'show']);
    Route::post('/jadwal', [App\Http\Controllers\Api\jadwalController::class, 'store']);
    Route::put('/jadwal/{id}', [App\Http\Controllers\Api\jadwalController::class, 'update']);
    Route::delete('/jadwal/{id}', [App\Http\Controllers\Api\jadwalController::class, 'destroy']);

    // Inventaris
    Route::get('/inventaris', [App\Http\Controllers\Api\inventarisController::class, 'index']);
    Route::get('/inventaris/{id}', [App\Http\Controllers\Api\inventarisController::class, 'show']);
    Route::post('/inventaris', [App\Http\Controllers\Api\inventarisController::class, 'store']);
    Route::put('/inventaris/{id}', [App\Http\Controllers\Api\inventarisController::class, 'update']);
    Route::delete('/inventaris/{id}', [App\Http\Controllers\Api\inventarisController::class, 'destroy']);

    // Ruang
    Route::get('/ruang', [App\Http\Controllers\Api\ruangController::class, 'index']);
    Route::get('/ruang/{id}', [App\Http\Controllers\Api\ruangController::class, 'show']);
    Route::post('/ruang', [App\Http\Controllers\Api\ruangController::class, 'store']);
    Route::put('/ruang/{id}', [App\Http\Controllers\Api\ruangController::class, 'update']);
    Route::delete('/ruang/{id}', [App\Http\Controllers\Api\ruangController::class, 'destroy']);

    // Master
    Route::apiResource('/admin', App\Http\Controllers\Api\adminController::class);
    Route::apiResource('/cabang', App\Http\Controllers\Api\cabangController::class);
    Route::apiResource('/departement', App\Http\Controllers\Api\departementController::class);
    Route::apiResource('/pi', App\Http\Controllers\Api\pemakaian_inventarisController::class);
    Route::apiResource('/pegawai', App\Http\Controllers\Api\pegawaiController::class);
    Route::apiResource('/rr', App\Http\Controllers\Api\reservasi_ruangController::class);
    Route::apiResource('/sk', App\Http\Controllers\Api\surat_keluarController::class);
    Route::apiResource('/sm', App\Http\Controllers\Api\surat_masukController::class);
    Route::apiResource('/surat', App\Http\Controllers\Api\suratController::class);
    Route::apiResource('/tamu', App\Http\Controllers\Api\tamuController::class);
});


Route::group(['middleware' => ['auth:api-pegawai']], function () {
    // Get
    Route::get('/jp', [App\Http\Controllers\Api\jadwalController::class, 'indexpegawai']);
    Route::get('/ip', [App\Http\Controllers\Api\inventarisController::class, 'indexpegawai']);
    Route::get('/rp', [App\Http\Controllers\Api\ruangController::class, 'indexpegawai']);

    // Show
    Route::get('/jp/{id}', [App\Http\Controllers\Api\jadwalController::class, 'show']);
    Route::get('/ip/{id}', [App\Http\Controllers\Api\inventarisController::class, 'show']);
    Route::get('/p/{id}', [App\Http\Controllers\Api\ruangController::class, 'show']);
});






