<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\cabang;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class cabangController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $cabang = cabang::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Cabang', $cabang);
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
            'id_cabang'      => 'required',
            'nama_cabang'     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $cabang = cabang::create([
            'id_cabang'      => $request->id_cabang,
            'nama_cabang'     => $request->nama_cabang,
        ]);

        return new GlobalResource(true, 'Data Cabang Berhasil Ditambahkan!', $cabang);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $cabang = cabang::find($id);

        return new GlobalResource(true, 'Detail Data Cabang!', $cabang);
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
        $cabang = cabang::find($id);

        $cabang->update([
            'id_cabang'      => $request->id_cabang,
            'nama_cabang'     => $request->nama_cabang,
        ]);

        return new GlobalResource(true, 'Data Cabang Berhasil Diubah!', $cabang);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $cabang = cabang::find($id);

        $cabang->delete();

        return new GlobalResource(true, 'Data Cabang Berhasil Dihapus!', null);
    }
}
