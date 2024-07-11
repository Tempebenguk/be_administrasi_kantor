<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\reservasi_ruang;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class reservasi_ruangController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $rr = reservasi_ruang::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Reservasi Ruang', $rr);
    }

    /**
     * store
     *
     * @param  mixed $request
     * @return void
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_reservasi' => 'required',
            'ruang' => 'required',
            'tanggal_reservasi' => 'required',
            'tanggal_selesai' => 'required',
            'durasi' => 'required',
            'pegawai' => 'required',
            'keterangan' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $rr = reservasi_ruang::create([
            'id_reservasi' => $request->id_reservasi,
            'ruang' => $request->ruang,
            'tanggal_reservasi' => $request->tanggal_reservasi,
            'tanggal_selesai' => $request->tanggal_selesai,
            'durasi' => $request->durasi,
            'pegawai' => $request->pegawai,
            'keterangan' => $request->keterangan,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Reservasi Ruang Berhasil Ditambahkan!', $rr);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $rr = reservasi_ruang::find($id);

        return new GlobalResource(true, 'Detail Data Reservasi Ruang!', $rr);
    }

    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $id
     * @return void
     */
    public function update(Request $request, $id)
    {
        $rr = reservasi_ruang::find($id);

        $rr->update([
            'id_reservasi' => $request->id_reservasi,
            'ruang' => $request->ruang,
            'tanggal_reservasi' => $request->tanggal_reservasi,
            'tanggal_selesai' => $request->tanggal_selesai,
            'durasi' => $request->durasi,
            'pegawai' => $request->pegawai,
            'keterangan' => $request->keterangan,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Reservasi Ruang Berhasil Diubah!', $rr);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $rr = reservasi_ruang::find($id);

        $rr->delete();

        return new GlobalResource(true, 'Data Reservasi Ruang Berhasil Dihapus!', null);
    }
}
