<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\surat;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class suratController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {   
        $keyword = $request->input('keyword');

        $suratQuery = surat::query();

        if ($keyword) {
            $suratQuery->where(function ($query) use ($keyword) {
                $query->where('kode_surat', 'ILIKE', "%$keyword%")
                    ->orWhere('jenis_surat', 'ILIKE', "%$keyword%");
            });
        }
        
        $surat = $suratQuery->latest()->paginate(5);

        return new GlobalResource(true, 'List Data Surat', $surat);
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
            'kode_surat' => 'required',
            'jenis_surat' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $surat = surat::create([
            'kode_surat' => $request->kode_surat,
            'jenis_surat' => $request->jenis_surat,
        ]);

        return new GlobalResource(true, 'Data Surat Berhasil Ditambahkan!', $surat);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $surat = surat::find($id);

        return new GlobalResource(true, 'Detail Data Surat!', $surat);
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
        $surat = surat::find($id);

        $surat->update([
            'kode_surat' => $request->kode_surat,
            'jenis_surat' => $request->jenis_surat,
        ]);

        return new GlobalResource(true, 'Data Surat Berhasil Diubah!', $surat);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $surat = surat::find($id);

        $surat->delete();

        return new GlobalResource(true, 'Data Surat Berhasil Dihapus!', null);
    }
}
