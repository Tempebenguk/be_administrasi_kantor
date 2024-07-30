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
    Route::get('/jadwalall', [App\Http\Controllers\Api\jadwalController::class, 'indexall']);
    Route::get('/showtgl/{tanggal}', [App\Http\Controllers\Api\jadwalController::class, 'showtgl']);

    // Inventaris
    Route::get('/inventaris', [App\Http\Controllers\Api\inventarisController::class, 'index']);
    Route::get('/inventaris/{id}', [App\Http\Controllers\Api\inventarisController::class, 'show']);
    Route::post('/inventaris', [App\Http\Controllers\Api\inventarisController::class, 'store']);
    Route::put('/inventaris/{id}', [App\Http\Controllers\Api\inventarisController::class, 'update']);
    Route::delete('/inventaris/{id}', [App\Http\Controllers\Api\inventarisController::class, 'destroy']);
    Route::get('/inventarisall', [App\Http\Controllers\Api\inventarisController::class, 'indexall']);

    // Ruang
    Route::get('/ruang', [App\Http\Controllers\Api\ruangController::class, 'index']);
    Route::get('/ruang/{id}', [App\Http\Controllers\Api\ruangController::class, 'show']);
    Route::post('/ruang', [App\Http\Controllers\Api\ruangController::class, 'store']);
    Route::put('/ruang/{id}', [App\Http\Controllers\Api\ruangController::class, 'update']);
    Route::delete('/ruang/{id}', [App\Http\Controllers\Api\ruangController::class, 'destroy']);
    Route::get('/ruangall', [App\Http\Controllers\Api\ruangController::class, 'indexall']);

    // Admin
    Route::get('/admin', [App\Http\Controllers\Api\adminController::class, 'index']);
    Route::get('/admin/{id}', [App\Http\Controllers\Api\adminController::class, 'show']);
    Route::post('/admin', [App\Http\Controllers\Api\adminController::class, 'store']);
    Route::put('/admin/{id}', [App\Http\Controllers\Api\adminController::class, 'update']);
    Route::delete('/admin/{id}', [App\Http\Controllers\Api\adminController::class, 'destroy']);
    Route::get('/adminall', [App\Http\Controllers\Api\adminController::class, 'indexall']);

    // Cabang
    Route::get('/cabang', [App\Http\Controllers\Api\cabangController::class, 'index']);
    Route::get('/cabang/{id}', [App\Http\Controllers\Api\cabangController::class, 'show']);
    Route::post('/cabang', [App\Http\Controllers\Api\cabangController::class, 'store']);
    Route::put('/cabang/{id}', [App\Http\Controllers\Api\cabangController::class, 'update']);
    Route::delete('/cabang/{id}', [App\Http\Controllers\Api\cabangController::class, 'destroy']);
    Route::get('/cabangall', [App\Http\Controllers\Api\cabangController::class, 'indexall']);

    // Departement
    Route::get('/departement', [App\Http\Controllers\Api\departementController::class, 'index']);
    Route::get('/departement/{id}', [App\Http\Controllers\Api\departementController::class, 'show']);
    Route::post('/departement', [App\Http\Controllers\Api\departementController::class, 'store']);
    Route::put('/departement/{id}', [App\Http\Controllers\Api\departementController::class, 'update']);
    Route::delete('/departement/{id}', [App\Http\Controllers\Api\departementController::class, 'destroy']);
    Route::get('/departementall', [App\Http\Controllers\Api\departementController::class, 'indexall']);

    // Pegawai
    Route::get('/pegawai', [App\Http\Controllers\Api\pegawaiController::class, 'index']);
    Route::get('/pegawai/{id}', [App\Http\Controllers\Api\pegawaiController::class, 'show']);
    Route::post('/pegawai', [App\Http\Controllers\Api\pegawaiController::class, 'store']);
    Route::put('/pegawai/{id}', [App\Http\Controllers\Api\pegawaiController::class, 'update']);
    Route::delete('/pegawai/{id}', [App\Http\Controllers\Api\pegawaiController::class, 'destroy']);
    Route::get('/pegawaiall', [App\Http\Controllers\Api\pegawaiController::class, 'indexall']);

    // Pemakaian Inventaris
    Route::get('/pi', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'index']);
    Route::get('/pi/{id}', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'show']);
    Route::post('/pi', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'store']);
    Route::put('/pi/{id}', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'update']);
    Route::delete('/pi/{id}', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'destroy']);
    Route::get('/piall', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'indexall']);

    // Reservasi Ruang
    Route::get('/rr', [App\Http\Controllers\Api\reservasi_ruangController::class, 'index']);
    Route::get('/rr/{id}', [App\Http\Controllers\Api\reservasi_ruangController::class, 'show']);
    Route::post('/rr', [App\Http\Controllers\Api\reservasi_ruangController::class, 'store']);
    Route::put('/rr/{id}', [App\Http\Controllers\Api\reservasi_ruangController::class, 'update']);
    Route::delete('/rr/{id}', [App\Http\Controllers\Api\reservasi_ruangController::class, 'destroy']);
    Route::get('/rrall', [App\Http\Controllers\Api\reservasi_ruangController::class, 'indexall']);

    // Surat Keluar
    Route::get('/sk', [App\Http\Controllers\Api\surat_keluarController::class, 'index']);
    Route::get('/sk/{id}', [App\Http\Controllers\Api\surat_keluarController::class, 'show']);
    Route::post('/sk', [App\Http\Controllers\Api\surat_keluarController::class, 'store']);
    Route::put('/sk/{id}', [App\Http\Controllers\Api\surat_keluarController::class, 'update']);
    Route::delete('/sk/{id}', [App\Http\Controllers\Api\surat_keluarController::class, 'destroy']);
    Route::get('/skall', [App\Http\Controllers\Api\surat_keluarController::class, 'indexall']);

    // Surat Masuk
    Route::get('/sm', [App\Http\Controllers\Api\surat_masukController::class, 'index']);
    Route::get('/sm/{id}', [App\Http\Controllers\Api\surat_masukController::class, 'show']);
    Route::post('/sm', [App\Http\Controllers\Api\surat_masukController::class, 'store']);
    Route::put('/sm/{id}', [App\Http\Controllers\Api\surat_masukController::class, 'update']);
    Route::delete('/sm/{id}', [App\Http\Controllers\Api\surat_masukController::class, 'destroy']);
    Route::get('/small', [App\Http\Controllers\Api\surat_masukController::class, 'indexall']);

    // Surat
    Route::get('/surat', [App\Http\Controllers\Api\suratController::class, 'index']);
    Route::get('/surat/{id}', [App\Http\Controllers\Api\suratController::class, 'show']);
    Route::post('/surat', [App\Http\Controllers\Api\suratController::class, 'store']);
    Route::put('/surat/{id}', [App\Http\Controllers\Api\suratController::class, 'update']);
    Route::delete('/surat/{id}', [App\Http\Controllers\Api\suratController::class, 'destroy']);
    Route::get('/suratall', [App\Http\Controllers\Api\suratController::class, 'indexall']);

    // Tamu
    Route::get('/tamu', [App\Http\Controllers\Api\tamuController::class, 'index']);
    Route::get('/tamu/{id}', [App\Http\Controllers\Api\tamuController::class, 'show']);
    Route::post('/tamu', [App\Http\Controllers\Api\tamuController::class, 'store']);
    Route::put('/tamu/{id}', [App\Http\Controllers\Api\tamuController::class, 'update']);
    Route::delete('/tamu/{id}', [App\Http\Controllers\Api\tamuController::class, 'destroy']);
    Route::get('/tamuall', [App\Http\Controllers\Api\tamuController::class, 'indexall']);
});


Route::group(['middleware' => ['auth:api-pegawai']], function () {
    // Get
    Route::get('/jp', [App\Http\Controllers\Api\jadwalController::class, 'indexpegawai']); // Jadwal
    Route::get('/ip', [App\Http\Controllers\Api\inventarisController::class, 'indexpegawai']); // Inventaris
    Route::get('/rp', [App\Http\Controllers\Api\ruangController::class, 'indexpegawai']); // Ruang
    Route::get('/cp', [App\Http\Controllers\Api\cabangController::class, 'index']); // Cabang
    Route::get('/rall', [App\Http\Controllers\Api\ruangController::class, 'indexall']); // ruang
    Route::get('/piallp', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'indexall']); // Pemakaian Inventaris
    Route::get('/rrallp', [App\Http\Controllers\Api\reservasi_ruangController::class, 'indexall']); // Reservasi Ruang
    Route::get('/dp', [App\Http\Controllers\Api\departementController::class, 'index']); // Departement

    // Show
    Route::get('/jp/{id}', [App\Http\Controllers\Api\jadwalController::class, 'show']); // Jadwal
    Route::get('/ip/{id}', [App\Http\Controllers\Api\inventarisController::class, 'indexpegawaidtl']); // Inventaris
    Route::get('/rp/{id}', [App\Http\Controllers\Api\ruangController::class, 'indexpegawaidtl']); // Ruang
    Route::get('/tglp/{tanggal}', [App\Http\Controllers\Api\jadwalController::class, 'showtglp']); // Jadwal parameter tgl

    // Create
    Route::post('/pip', [App\Http\Controllers\Api\pemakaian_inventarisController::class, 'store']); // Pemakaian Inventaris
    Route::get('/rrallp', [App\Http\Controllers\Api\reservasi_ruangController::class, 'indexall']); // Reservasi Ruang
});






