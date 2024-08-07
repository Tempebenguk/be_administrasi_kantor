<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
}
