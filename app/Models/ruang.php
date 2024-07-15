<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ruang extends Model
{
    use HasFactory;
    protected $table = 'ruang';
    protected $primaryKey = 'id_ruang';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_ruang',
        'nama_ruang',
        'cabang',
    ];

    public function cabang()
    {
        return $this->belongsTo(cabang::class, 'cabang', 'id_cabang');
    }
}
