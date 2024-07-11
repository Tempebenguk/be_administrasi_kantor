<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tamu extends Model
{
    use HasFactory;
    protected $table = 'tamu';
    protected $primaryKey = 'id_tamu';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_tamu',
        'tanggal_kunjungan',
        'nama',
        'jabatan',
        'no_hp',
        'departement_dikunjungi',
        'org_dikunjungi',
        'keperluan',
        'cabang',
    ];
}
