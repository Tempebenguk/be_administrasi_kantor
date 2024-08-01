<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\tamu;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class tamuController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {
        $cabang = $request->input('cabang?');
        $departement = $request->input('departement?');
    
        $tamu = tamu::when($cabang, function ($query) use ($cabang){
            $query->where('cabang', $cabang);
        })->when($departement, function ($query) use ($departement) {
            $query->where('departement_dikunjungi', $departement);
        })->latest()->paginate(5);

        return new GlobalResource(true, 'List Data Tamu', $tamu);
    }

    public function indexall()
    {
        $tamu = tamu::latest()->get();
        return new GlobalResource(true, 'List Data Tamu', $tamu);
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
            'id_tamu' => 'required',
            'tanggal_kunjungan' => 'required',
            'nama' => 'required',
            'jabatan' => 'required',
            'no_hp' => 'required',
            'departement_dikunjungi' => 'required',
            'org_dikunjungi' => 'required',
            'keperluan' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $tamu = tamu::create([
            'id_tamu' => $request->id_tamu,
            'tanggal_kunjungan' => $request->tanggal_kunjungan,
            'nama' => $request->nama,
            'jabatan' => $request->jabatan,
            'no_hp' => $request->no_hp,
            'departement_dikunjungi' => $request->departement_dikunjungi,
            'org_dikunjungi' => $request->org_dikunjungi,
            'keperluan' => $request->keperluan,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Tamu Berhasil Ditambahkan!', $tamu);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $tamu = tamu::find($id);

        return new GlobalResource(true, 'Detail Data Tamu', $tamu);
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
        $tamu = tamu::find($id);

        $tamu->update([
            'id_tamu' => $request->id_tamu,
            'tanggal_kunjungan' => $request->tanggal_kunjungan,
            'nama' => $request->nama,
            'jabatan' => $request->jabatan,
            'no_hp' => $request->no_hp,
            'departement_dikunjungi' => $request->departement_dikunjungi,
            'org_dikunjungi' => $request->org_dikunjungi,
            'keperluan' => $request->keperluan,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Tamu Berhasil Diubah!', $tamu);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $tamu = tamu::find($id);

        $tamu->delete();

        return new GlobalResource(true, 'Data Tamu Berhasil Dihapus!', null);
    }
}
