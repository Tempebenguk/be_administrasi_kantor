<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\surat_masuk;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

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
        $keyword = $request->input('keyword');

        $smQuery = surat_masuk::query();

        if ($cabang) {
            $smQuery->where('cabang', $cabang);
        }

        if ($keyword) {
            $smQuery->where(function ($query) use ($keyword) {
                $query->where('id_surat_masuk', 'ILIKE', "%$keyword%")
                    ->orWhere('nomor_surat', 'ILIKE', "%$keyword%")
                    ->orWhere('tanggal_terima', 'ILIKE', "%$keyword%")
                    ->orWhere('asal_surat', 'ILIKE', "%$keyword%")
                    ->orWhere('perihal', 'ILIKE', "%$keyword%");
            });
        }
        
        $sm = $smQuery->latest()->paginate(5);

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
            'tanggal_terima' => 'required',
            'asal_surat' => 'required',
            'perihal' => 'required',
            'cabang' => 'required',
            'foto' => 'image|mimes:jpeg,png,jpg',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $image = $request->file('foto');
        $image->storeAs('public/sm', $image->hashName());

        $sm = surat_masuk::create([
            'id_surat_masuk' => $request->id_surat_masuk,
            'nomor_surat' => $request->nomor_surat,
            'tanggal_terima' => $request->tanggal_terima,
            'asal_surat' => $request->asal_surat,
            'perihal' => $request->perihal,
            'cabang' => $request->cabang,
            'foto' => $image->hashName(),
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
            'tanggal_terima' => $request->tanggal_terima,
            'asal_surat' => $request->asal_surat,
            'perihal' => $request->perihal,
            'cabang' => $request->cabang,
        ]);

        if ($request->hasFile('foto')) {

            $image = $request->file('foto');
            $image->storeAs('public/sm', $image->hashName());
            Storage::delete('public/sm/' . basename($sm->foto));
            $sm->foto = $image->hashName();

            $sm->save();
        }

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
        Storage::delete('public/sm/' . basename($sm->foto));
        $sm->delete();

        return new GlobalResource(true, 'Data Surat Masuk Berhasil Dihapus!', null);
    }
}
