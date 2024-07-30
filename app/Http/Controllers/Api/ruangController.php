<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ruang;
use App\Http\Resources\GlobalResource;
use Illuminate\Support\Facades\Validator;

class ruangController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $ruang = ruang::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Ruang', $ruang);
    }

    public function indexall()
    {
        $ruang = ruang::latest()->get();
        return new GlobalResource(true, 'List Data Ruang', $ruang);
    }

    public function indexpegawai()
    {
        $user = auth('api-pegawai')->user();
        $userCabang = $user->cabang;

        $ruangJoin = ruang::leftJoin('reservasi_ruang', 'ruang.id_ruang', '=', 'reservasi_ruang.ruang')
                    ->where('ruang.cabang', $userCabang)
                    ->select(
                        'ruang.id_ruang',
                        'ruang.nama_ruang',
                        'ruang.cabang',
                        'reservasi_ruang.id_reservasi',
                        'reservasi_ruang.ruang as reservasi_ruang_id',
                        'reservasi_ruang.tanggal_reservasi',
                        'reservasi_ruang.tanggal_selesai',
                        'reservasi_ruang.durasi',
                        'reservasi_ruang.pegawai',
                        'reservasi_ruang.keterangan'
                    )
                    ->get();

        $ruang = $ruangJoin->groupBy('id_ruang')->map(function ($group) {
            $firstItem = $group->first();
            $firstItem->reservasi_ruang = $group->map(function ($item) {
                return [
                    'id_reservasi' => $item->id_reservasi,
                    'ruang' => $item->reservasi_ruang_id,
                    'tanggal_reservasi' => $item->tanggal_reservasi,
                    'tanggal_selesai' => $item->tanggal_selesai,
                    'durasi' => $item->durasi,
                    'pegawai' => $item->pegawai,
                    'keterangan' => $item->keterangan
                ];
            })->toArray();
            return [
                'id_ruang' => $firstItem->id_ruang,
                'nama_ruang' => $firstItem->nama_ruang,
                'cabang' => $firstItem->cabang,
                'reservasi_ruang' => $firstItem->reservasi_ruang,
            ];
        })->values();

        return new GlobalResource(true, 'List Data Ruang', $ruang);
    }

    public function indexpegawaidtl($id)
    {
        $user = auth('api-pegawai')->user();
        $userCabang = $user->cabang;

        $ruangJoin = ruang::leftJoin('reservasi_ruang', 'ruang.id_ruang', '=', 'reservasi_ruang.ruang')
                    ->where('ruang.id_ruang', $id)
                    ->where('ruang.cabang', $userCabang)
                    ->select(
                        'ruang.id_ruang',
                        'ruang.nama_ruang',
                        'ruang.cabang',
                        'reservasi_ruang.id_reservasi',
                        'reservasi_ruang.ruang as reservasi_ruang_id',
                        'reservasi_ruang.tanggal_reservasi',
                        'reservasi_ruang.tanggal_selesai',
                        'reservasi_ruang.durasi',
                        'reservasi_ruang.pegawai',
                        'reservasi_ruang.keterangan'
                    )
                    ->get();

        $ruang = $ruangJoin->groupBy('id_ruang')->map(function ($group) {
            $firstItem = $group->first();
            $firstItem->reservasi_ruang = $group->map(function ($item) {
                return [
                    'id_reservasi' => $item->id_reservasi,
                    'ruang' => $item->reservasi_ruang_id,
                    'tanggal_reservasi' => $item->tanggal_reservasi,
                    'tanggal_selesai' => $item->tanggal_selesai,
                    'durasi' => $item->durasi,
                    'pegawai' => $item->pegawai,
                    'keterangan' => $item->keterangan
                ];
            })->toArray();
            return [
                'id_ruang' => $firstItem->id_ruang,
                'nama_ruang' => $firstItem->nama_ruang,
                'cabang' => $firstItem->cabang,
                'reservasi_ruang' => $firstItem->reservasi_ruang,
            ];
        })->values();

        return new GlobalResource(true, 'List Data Ruang', $ruang);
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
            'id_ruang' => 'required',
            'nama_ruang' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $ruang = ruang::create([
            'id_ruang' => $request->id_ruang,
            'nama_ruang' => $request->nama_ruang,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Ruang Berhasil Ditambahkan!', $ruang);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $ruang = ruang::find($id);

        return new GlobalResource(true, 'Detail Data Ruang!', $ruang);
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
        $ruang = ruang::find($id);

        $ruang->update([
            'id_ruang' => $request->id_ruang,
            'nama_ruang' => $request->nama_ruang,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Ruang Berhasil Diubah!', $ruang);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $ruang = ruang::find($id);

        $ruang->delete();

        return new GlobalResource(true, 'Data Ruang Berhasil Dihapus!', null);
    }
}
