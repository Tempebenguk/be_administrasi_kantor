<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class reservasi_ruang extends Model
{
    use HasFactory;
    protected $table = 'reservasi_ruang';
    protected $primaryKey = 'id_reservasi';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_reservasi',
        'ruang',
        'tanggal_reservasi',
        'tanggal_selesai',
        'durasi',
        'pegawai',
        'keterangan',
        'cabang',
    ];
}
