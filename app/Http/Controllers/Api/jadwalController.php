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
    public function index(Request $request)
    {   
        $cabang = $request->input('cabang?');
        $status = $request->input('status?');
        $tahun = $request->input('tahun?');
        $bulan = $request->input('bulan?');
        $tanggal = $request->input('tanggal?');
        $keyword = $request->input('keyword');

        $jadwalQuery = jadwal::query();
        
        if ($cabang) {
            $jadwalQuery->where('cabang', $cabang);
        }

        if ($status) {
            $jadwalQuery->where('status', $status);
        }

        if ($tahun) {
            $jadwalQuery->whereYear('tanggal', $tahun);
        }

        if ($bulan) {
            $jadwalQuery->whereMonth('tanggal', $bulan);
        }

        if ($tanggal) {
            $jadwalQuery->whereDay('tanggal', $tanggal);
        }
        
        if ($keyword) {
            $jadwalQuery->where(function ($query) use ($keyword) {
                $query->where('agenda', 'ILIKE', "%$keyword%");
            });
        }

        $jadwal = $jadwalQuery->latest()->paginate(5);

        return new GlobalResource(true, 'List Data Jadwal', $jadwal);
    }

    public function indexall()
    {
        $jadwal = jadwal::latest()->get();
        return new GlobalResource(true, 'List Data Jadwal', $jadwal);
    }

    public function indexpegawai(Request $request)
    
    {
        $user = auth('api-pegawai')->user();
        
        $userCabang = $user->cabang;
        $userDepartement = $user->departement;
        $tahun = $request->input('tahun?');
        $bulan = $request->input('bulan?');

        $jadwalQuery = jadwal::where('cabang', $userCabang);

        if ($tahun) {
            $jadwalQuery->whereYear('tanggal', $tahun);
        }

        if ($bulan) {
            $jadwalQuery->whereMonth('tanggal', $bulan);
        }

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

    public function showtgl($tanggal)
    {   
        $tanggal = date('Y-m-d', strtotime($tanggal));
        $jadwal = jadwal::whereDate('tanggal', $tanggal)->get();

        return new GlobalResource(true, 'Detail Data Jadwal!', $jadwal);
    }

    public function showtglp($tanggal) {
        
        $user = auth('api-pegawai')->user(); 

        $userCabang = $user->cabang; 
        $userDepartement = $user->departement;

        $tanggal = date('Y-m-d', strtotime($tanggal)); 
    
        $jadwalQuery = jadwal::where('cabang', $userCabang)
                             ->whereDate('tanggal', $tanggal);
    
        if (!is_null($userDepartement)) {
            $jadwalQuery->where(function($query) use ($userDepartement) {
                $query->where('status', $userDepartement)
                      ->orWhereNull('status');
            });
        }
    
        $jadwal = $jadwalQuery->latest()->get();
    
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
