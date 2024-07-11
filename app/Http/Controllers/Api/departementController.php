<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\departement;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class departementController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $departement = departement::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Departement', $departement);
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
            'id_departement'      => 'required',
            'nama_departement'     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $departement = departement::create([
            'id_departement'      => $request->id_departement,
            'nama_departement'     => $request->nama_departement,
        ]);

        return new GlobalResource(true, 'Data Departement Berhasil Ditambahkan!', $departement);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $departement = departement::find($id);

        return new GlobalResource(true, 'Detail Data Departement!', $departement);
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
        $departement = departement::find($id);

        $departement->update([
            'id_departement'      => $request->id_departement,
            'nama_departement'     => $request->nama_departement,
        ]);

        return new GlobalResource(true, 'Data Departement Berhasil Diubah!', $departement);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $departement = departement::find($id);

        $departement->delete();

        return new GlobalResource(true, 'Data Departement Berhasil Dihapus!', null);
    }
}
