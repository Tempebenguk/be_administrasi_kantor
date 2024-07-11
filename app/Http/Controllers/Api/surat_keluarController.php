<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\surat_keluar;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class surat_keluarController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $sk = surat_keluar::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Surat Keluar', $sk);
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
            'id_surat_keluar' => 'required',
            'nomor_surat' => 'required',
            'tanggal_surat' => 'required',
            'tanggal_kirim' => 'required',
            'tujuan_surat' => 'required',
            'perihal' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $sk = surat_keluar::create([
            'id_surat_keluar' => $request->id_surat_keluar,
            'nomor_surat' => $request->nomor_surat,
            'tanggal_surat' => $request->tanggal_surat,
            'tanggal_kirim' => $request->tanggal_kirim,
            'tujuan_surat' => $request->tujuan_surat,
            'perihal' => $request->perihal,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Surat Keluar Berhasil Ditambahkan!', $sk);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $sk = surat_keluar::find($id);

        return new GlobalResource(true, 'Detail Data Surat Keluar!', $sk);
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
        $sk = surat_keluar::find($id);

        $sk->update([
            'id_surat_keluar' => $request->id_surat_keluar,
            'nomor_surat' => $request->nomor_surat,
            'tanggal_surat' => $request->tanggal_surat,
            'tanggal_kirim' => $request->tanggal_kirim,
            'tujuan_surat' => $request->tujuan_surat,
            'perihal' => $request->perihal,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Surat Keluar Berhasil Diubah!', $sk);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $sk = surat_keluar::find($id);

        $sk->delete();

        return new GlobalResource(true, 'Data Surat Keluar Berhasil Dihapus!', null);
    }
}
