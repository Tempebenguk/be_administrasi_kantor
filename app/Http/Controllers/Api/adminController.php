<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\admin;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class adminController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $admin = admin::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Admin', $admin);
    }

    public function indexall()
    {
        $admin = admin::latest()->get();
        return new GlobalResource(true, 'List Data Admin', $admin);
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
            'id_admin' => 'required',
            'nama' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8',
            'no_hp' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $admin = admin::create([
            'id_admin' => $request->id_admin,
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'no_hp' => $request->no_hp,
        ]);

        return new GlobalResource(true, 'Data Admin Berhasil Ditambahkan!', $admin);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $admin = admin::find($id);

        return new GlobalResource(true, 'Detail Data Admin!', $admin);
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
        $admin = admin::find($id);

        $admin->update([
            'id_admin' => $request->id_admin,
            'nama' => $request->nama,
            'email' => $request->email,
            'no_hp' => $request->no_hp,
        ]);

        if ($request->filled('password')) {
            $encryptedPassword = bcrypt($request->password);
            $admin->password = $encryptedPassword;
        }

        return new GlobalResource(true, 'Data Admin Berhasil Diubah!', $admin);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $admin = admin::find($id);

        $admin->delete();

        return new GlobalResource(true, 'Data Admin Berhasil Dihapus!', null);
    }
}
