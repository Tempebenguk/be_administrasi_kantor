<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class pegawai extends Model
{
    use HasFactory;
    protected $table = 'pegawai';
    protected $primaryKey = 'id_pegawai';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_pegawai',
        'nip',
        'nama',
        'email',
        'password',
        'departement',
        'alamat',
        'no_hp',
        'cabang',
        'foto',
        'jenkel',
        'status',
    ];

    protected function foto(): Attribute
    {
        return Attribute::make(
            get: fn ($foto) => url('/storage/pegawai/' . $foto),
        );
    }
}
