<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\nomor_surat;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class nomorController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {   
        $keyword = $request->input('keyword');

        $nsQuery = nomor_surat::query();

        if ($keyword) {
            $nsQuery->where(function ($query) use ($keyword) {
                $query->where('format', 'ILIKE', "%$keyword%");
            });
        }
        
        $nomor_surat = $nsQuery->latest()->paginate(5);

        return new GlobalResource(true, 'List Data Nomor Surat', $nomor_surat);
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
            'format' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $nomor_surat = nomor_surat::create([
            'format' => $request->format,
        ]);

        return new GlobalResource(true, 'Data Nomor Surat Berhasil Ditambahkan!', $nomor_surat);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $nomor_surat = nomor_surat::find($id);

        return new GlobalResource(true, 'Detail Data Nomor Surat!', $nomor_surat);
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
        $nomor_surat = nomor_surat::find($id);

        $nomor_surat->update([
            'format' => $request->format,
        ]);

        return new GlobalResource(true, 'Data Nomor Surat Berhasil Diubah!', $nomor_surat);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $nomor_surat = nomor_surat::find($id);

        $nomor_surat->delete();

        return new GlobalResource(true, 'Data Nomor Surat Berhasil Dihapus!', null);
    }
}
