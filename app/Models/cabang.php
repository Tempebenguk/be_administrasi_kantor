<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cabang extends Model
{
    use HasFactory;
    protected $table = 'cabang';
    protected $primaryKey = 'id_cabang';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_cabang',
        'nama_cabang',
    ];
}
