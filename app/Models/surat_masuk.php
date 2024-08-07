<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class surat_masuk extends Model
{
    use HasFactory;
    protected $table ='surat_masuk';
    protected $primaryKey = 'id_surat_masuk';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_surat_masuk',
        'nomor_surat',
        'tanggal_surat',
        'tanggal_terima',
        'asal_surat',
        'perihal',
        'cabang',
        'foto',
    ];

    protected function foto(): Attribute
    {
        return Attribute::make(
            get: fn ($foto) => url('/storage/sm/' . $foto),
        );
    }
}
