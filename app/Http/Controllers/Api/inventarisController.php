<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\inventaris;
use App\Http\Resources\GlobalResource;
use App\Http\Resources\InventarisResource;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class inventarisController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $inventaris = inventaris::latest()->paginate(5);
        return new GlobalResource(true, 'List Data Inventaris', $inventaris);
    }

    public function indexall()
    {
        $inventaris = inventaris::latest()->get();
        return new GlobalResource(true, 'List Data Inventaris', $inventaris);
    }

    public function indexpegawai()
    {
        $user = auth('api-pegawai')->user();
        $userCabang = $user->cabang;

        $inventarisjoin = inventaris::leftJoin('pemakaian_inventaris', 'inventaris.id_inventaris', '=', 'pemakaian_inventaris.inventaris')
                    ->where('inventaris.cabang', $userCabang)
                    ->select(
                        'inventaris.id_inventaris',
                        'inventaris.nopol',
                        'inventaris.merek',
                        'inventaris.kategori',
                        'inventaris.tahun',
                        'inventaris.pajak',
                        'inventaris.masa_pajak',
                        'inventaris.harga_beli',
                        'inventaris.tanggal_beli',
                        'inventaris.cabang',
                        'pemakaian_inventaris.id_pinjam',
                        'pemakaian_inventaris.inventaris as pem_inventaris',
                        'pemakaian_inventaris.tanggal_pinjam',
                        'pemakaian_inventaris.tanggal_kembali',
                        'pemakaian_inventaris.durasi_pinjam',
                        'pemakaian_inventaris.pegawai',
                        'pemakaian_inventaris.keterangan'
                    )
                    ->get();
                    
        $inventaris = $inventarisjoin->groupBy('id_inventaris')->map(function ($group) {
            $firstItem = $group->first();
            $firstItem->pemakaian_inventaris = $group->map(function ($item) {
                return [
                    'id_pinjam' => $item->id_pinjam,
                    'inventaris' => $item->pem_inventaris,
                    'tanggal_pinjam' => $item->tanggal_pinjam,
                    'tanggal_kembali' => $item->tanggal_kembali,
                    'durasi_pinjam' => $item->durasi_pinjam,
                    'pegawai' => $item->pegawai,
                    'keterangan' => $item->keterangan
                ];
            })->toArray();
            return [
                'id_inventaris' => $firstItem->id_inventaris,
                'nopol' => $firstItem->nopol,
                'merek' => $firstItem->merek,
                'kategori' => $firstItem->kategori,
                'tahun' => $firstItem->tahun,
                'pajak' => $firstItem->pajak,
                'masa_pajak' => $firstItem->masa_pajak,
                'harga_beli' => $firstItem->harga_beli,
                'tanggal_beli' => $firstItem->tanggal_beli,
                'cabang' => $firstItem->cabang,
                'pemakaian_inventaris' => $firstItem->pemakaian_inventaris,
            ];
        })->values();

        return new GlobalResource(true, 'List Data Inventaris', $inventaris);
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
            'id_inventaris' => 'required',
            'nopol' => 'required',
            'merek' => 'required',
            'kategori' => 'required',
            'tahun' => 'required',
            'pajak' => 'required',
            'masa_pajak' => 'required',
            'harga_beli' => 'required',
            'tanggal_beli' => 'required',
            'cabang' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        };

        $inventaris = inventaris::create([
            'id_inventaris' => $request->id_inventaris,
            'nopol' => $request->nopol,
            'merek' => $request->merek,
            'kategori' => $request->kategori,
            'tahun' => $request->tahun,
            'pajak' => $request->pajak,
            'masa_pajak' => $request->masa_pajak,
            'harga_beli' => $request->harga_beli,
            'tanggal_beli' => $request->tanggal_beli,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Inventaris Berhasil Ditambahkan!', $inventaris);
    }

    /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        $inventaris = inventaris::find($id);

        return new GlobalResource(true, 'Detail Data Inventaris!', $inventaris);
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
        $inventaris = inventaris::find($id);

        $inventaris->update([
            'id_inventaris' => $request->id_inventaris,
            'nopol' => $request->nopol,
            'merek' => $request->merek,
            'kategori' => $request->kategori,
            'tahun' => $request->tahun,
            'pajak' => $request->pajak,
            'masa_pajak' => $request->masa_pajak,
            'harga_beli' => $request->harga_beli,
            'tanggal_beli' => $request->tanggal_beli,
            'cabang' => $request->cabang,
        ]);

        return new GlobalResource(true, 'Data Inventaris Berhasil Diubah!', $inventaris);
    }

    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        $inventaris = inventaris::find($id);

        $inventaris->delete();

        return new GlobalResource(true, 'Data Inventaris Berhasil Dihapus!', null);
    }
}
