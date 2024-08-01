<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\pemakaian_inventaris;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class pemakaian_inventarisController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {
        $cabang = $request->input('cabang?');

        $pi = pemakaian_inventaris::when($cabang, function ($query) use ($cabang) {
            $query->where('cabang', $cabang);
        })->latest()->paginate(5);

        return new GlobalResource(true, 'List Data Pemakaian Inventaris', $pi);
    }

    public function indexall()
    {
        $pi = pemakaian_inventaris::latest()->get();
        return new GlobalResource(true, 'List Data Pemakaian Inventaris', $pi);
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
            'id_pinjam' => 'required',
            'inventaris' => 'required',
            'tanggal_pinjam' => 'required',
            'tanggal_kembali' => 'required',
            'durasi_pinjam' => 'required',
            'pegawai' => 'required',
            'keterangan' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $pi = pemakaian_inventaris::create([
            'id_pinjam' => $request->id_pinjam,
            'inventaris' => $request->inventaris,
            'tanggal_pinjam' => $request->tanggal_pinjam,
            'tanggal_kembali' => $request->tanggal_kembali,
            'durasi_pinjam' => $request->durasi_pinjam,
            'pegawai' => $request->pegawai,
            'keterangan' => $request->keterangan,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Pemakaian Inventaris Berhasil Ditambahkan!', $pi);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $pi = pemakaian_inventaris::find($id);

        return new GlobalResource(true, 'Detail Data Pemakaian Inventaris!', $pi);
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
        $pi = pemakaian_inventaris::find($id);

        $pi->update([
            'id_pinjam' => $request->id_pinjam,
            'inventaris' => $request->inventaris,
            'tanggal_pinjam' => $request->tanggal_pinjam,
            'tanggal_kembali' => $request->tanggal_kembali,
            'durasi_pinjam' => $request->durasi_pinjam,
            'pegawai' => $request->pegawai,
            'keterangan' => $request->keterangan,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Pemakaian Inventaris Berhasil Diubah!', $pi);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $pi = pemakaian_inventaris::find($id);

        $pi->delete();

        return new GlobalResource(true, 'Data Pemakaian Inventaris Berhasil Dihapus!', null);
    }
}
