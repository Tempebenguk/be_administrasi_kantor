<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\admin;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class adminController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {
        $keyword = $request->input('keyword');

        $admin = admin::when($keyword, function ($query) use ($keyword) {
            $query->where('id_admin', 'ILIKE', "%$keyword%")
                ->orWhere('nama', 'ILIKE', "%$keyword%");
        })->latest()->paginate(5);

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
            'foto' => 'mimes:jpeg,png,jpg',
            'jenkel' => 'required',
            'status' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $image = $request->file('foto');
        $image->storeAs('public/admin', $image->hashName());

        $admin = admin::create([
            'id_admin' => $request->id_admin,
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'no_hp' => $request->no_hp,
            'foto' => $image->hashName(),
            'jenkel' => $request->jenkel,
            'status' => $request->status,
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
            'jenkel' => $request->jenkel,
            'status' => $request->status,
        ]);

        if ($request->hasFile('foto')) {

            $image = $request->file('foto');
            $image->storeAs('public/admin', $image->hashName());
            Storage::delete('public/admin/' . basename($admin->foto));
            $admin->foto = $image->hashName();

            $admin->save();
        }

        if ($request->filled('password')) {
            $encryptedPassword = bcrypt($request->password);
            $admin->password = $encryptedPassword;

            // $admin->save();
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
        Storage::delete('public/admin/'. basename($admin->foto));

        $admin->delete();

        return new GlobalResource(true, 'Data Admin Berhasil Dihapus!', null);
    }
}
