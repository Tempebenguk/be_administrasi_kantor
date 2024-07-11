<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\jadwal;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class jadwalController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $jadwal = jadwal::latest()->paginate(10);
        return new GlobalResource(true, 'List Data Jadwal', $jadwal);
    }

    public function indexpegawai(Request $request)
    {
        $user = auth('api-pegawai')->user();
        
        $userCabang = $user->cabang;
        $userDepartement = $user->departement;

        $jadwalQuery = jadwal::where('cabang', $userCabang);

        if (!is_null($userDepartement)) {
            $jadwalQuery->where(function($query) use ($userDepartement) {
                $query->where('status', $userDepartement)
                      ->orWhereNull('status');
            });
        }

        $jadwal = $jadwalQuery->latest()->get();

        return new GlobalResource(true, 'List Data Jadwal', $jadwal);
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
            'id_jadwal' => 'required',
            'tanggal' => 'required',
            'agenda' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $jadwal = jadwal::create([
            'id_jadwal' => $request->id_jadwal,
            'tanggal' => $request->tanggal,
            'status' => $request->status,
            'agenda' => $request->agenda,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Jadwal Berhasil Ditambahkan!', $jadwal);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $jadwal = jadwal::find($id);

        return new GlobalResource(true, 'Detail Data Jadwal!', $jadwal);
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
        $jadwal = jadwal::find($id);

        $jadwal->update([
            'id_jadwal' => $request->id_jadwal,
            'tanggal' => $request->tanggal,
            'status' => $request->status,
            'agenda' => $request->agenda,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Jadwal Berhasil Diubah!', $jadwal);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $jadwal = jadwal::find($id);

        $jadwal->delete();

        return new GlobalResource(true, 'Data Jadwal Berhasil Dihapus!', null);
    }
}
