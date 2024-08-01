<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\pegawai;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;


class pegawaiController extends Controller
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

        $pegawai = pegawai::when($cabang, function ($query) use ($cabang){
            $query->where('cabang', $cabang);
        })->when($departement, function ($query) use ($departement) {
            $query->where('departement', $departement);
        })->latest()->paginate(5);

        return new GlobalResource(true, 'List Data Pegawai', $pegawai);
    }

    public function indexall()
    {
        $pegawai = pegawai::latest()->get();
        return new GlobalResource(true, 'List Data Pegawai', $pegawai);
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
            'id_pegawai' => 'required',
            'nip' => 'required',
            'nama' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8',
            'departement' => 'required',
            'alamat' => 'required',
            'no_hp' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $pegawai = pegawai::create([
            'id_pegawai' => $request->id_pegawai,
            'nip' => $request->nip,
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'departement' => $request->departement,
            'alamat' => $request->alamat,
            'no_hp' => $request->no_hp,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Pegawai Berhasil Ditambahkan!', $pegawai);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $pegawai = pegawai::find($id);

        return new GlobalResource(true, 'Detail Data Pegawai!', $pegawai);
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
        $pegawai = pegawai::find($id);

        $pegawai->update([
           'id_pegawai' => $request->id_pegawai,
            'nip' => $request->nip,
            'nama' => $request->nama,
            'email' => $request->email,
            'departement' => $request->departement,
            'alamat' => $request->alamat,
            'no_hp' => $request->no_hp,
            'cabang' => $request->cabang,
        ]);

        if ($request->filled('password')) {
            $encryptedPassword = bcrypt($request->password);
            $pegawai->password = $encryptedPassword;
        }

        return new GlobalResource(true, 'Data Pegawai Berhasil Diubah!', $pegawai);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $pegawai = pegawai::find($id);

        $pegawai->delete();

        return new GlobalResource(true, 'Data Pegawai Berhasil Dihapus!', null);
    }
}
