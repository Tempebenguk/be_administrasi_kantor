<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\pegawai;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

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
        $keyword = $request->input('keyword');

        $pegawaiQuery = pegawai::query();
    
        if ($cabang) {
            $pegawaiQuery->where('cabang', $cabang);
        }

        if ($departement) {
            $pegawaiQuery->where('departement', $departement);
        }

        if ($keyword) {
            $pegawaiQuery->where(function ($query) use ($keyword) {
                $query->where('id_pegawai', 'ILIKE', "%$keyword%")
                    ->orWhere('nip', 'ILIKE', "%$keyword%")
                    ->orWhere('nama', 'ILIKE', "%$keyword%");
            });
        }
        
        $pegawai = $pegawaiQuery->latest()->paginate(5);

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
            'foto' => 'image|mimes:jpeg,png,jpg',
            'jenkel' => 'required',
            'status' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $image = $request->file('foto');
        $image->storeAs('public/pegawai', $image->hashName());

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
            'foto' => $image->hashName(),
            'jenkel' => $request->jenkel,
            'status' => $request->status,
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
            'jenkel' => $request->jenkel,
            'status' => $request->status,
        ]);

        if ($request->filled('password')) {
            $encryptedPassword = bcrypt($request->password);
            $pegawai->password = $encryptedPassword;

            $pegawai->save();
        }

        if ($request->hasFile('foto')) {

            $image = $request->file('foto');
            $image->storeAs('public/pegawai', $image->hashName());
            Storage::delete('public/pegawai/' . basename($pegawai->foto));
            $pegawai->foto = $image->hashName();

            $pegawai->save();
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
        Storage::delete('public/pegawai/' . basename($pegawai->foto));
        $pegawai->delete();

        return new GlobalResource(true, 'Data Pegawai Berhasil Dihapus!', null);
    }
}
