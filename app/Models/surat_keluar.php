<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class surat_keluar extends Model
{
    use HasFactory;
    protected $table = 'surat_keluar';
    protected $primaryKey = 'id_surat_keluar';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_surat_keluar',
        'nomor_surat',
        'tanggal_surat',
        'tanggal_kirim',
        'tujuan_surat',
        'perihal',
        'cabang',
    ];

}
