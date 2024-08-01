<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\surat_masuk;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class surat_masukController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {
        $cabang = $request->input('cabang?');

        $sm = surat_masuk::when($cabang, function ($query) use ($cabang) {
            $query->where('cabang', $cabang);
        })->latest()->paginate(5);
        
        return new GlobalResource(true, 'List Data Surat Masuk', $sm);
    }

    public function indexall()
    {
        $sm = surat_masuk::latest()->get();
        return new GlobalResource(true, 'List Data Surat Masuk', $sm);
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
            'id_surat_masuk' => 'required',
            'nomor_surat' => 'required',
            'tanggal_surat' => 'required',
            'tanggal_terima' => 'required',
            'asal_surat' => 'required',
            'perihal' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $sm = surat_masuk::create([
            'id_surat_masuk' => $request->id_surat_masuk,
            'nomor_surat' => $request->nomor_surat,
            'tanggal_surat' => $request->tanggal_surat,
            'tanggal_terima' => $request->tanggal_terima,
            'asal_surat' => $request->asal_surat,
            'perihal' => $request->perihal,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Surat Masuk Berhasil Ditambahkan!', $sm);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $sm = surat_masuk::find($id);

        return new GlobalResource(true, 'Detail Data Surat Masuk!', $sm);
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
        $sm = surat_masuk::find($id);

        $sm->update([
            'id_surat_masuk' => $request->id_surat_masuk,
            'nomor_surat' => $request->nomor_surat,
            'tanggal_surat' => $request->tanggal_surat,
            'tanggal_terima' => $request->tanggal_terima,
            'asal_surat' => $request->asal_surat,
            'perihal' => $request->perihal,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Surat Masuk Berhasil Diubah!', $sm);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $sm = surat_masuk::find($id);

        $sm->delete();

        return new GlobalResource(true, 'Data Surat Masuk Berhasil Dihapus!', null);
    }
}
