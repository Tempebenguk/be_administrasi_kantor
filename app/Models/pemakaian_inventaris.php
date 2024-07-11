<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class pemakaian_inventaris extends Model
{
    use HasFactory;
    protected $table = 'pemakaian_inventaris';
    protected $primaryKey = 'id_pinjam';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_pinjam',
        'inventaris',
        'tanggal_pinjam',
        'tanggal_kembali',
        'durasi_pinjam',
        'pegawai',
        'keterangan',
        'cabang',
    ];

    public function inventaris()
    {
        return $this->belongsTo(inventaris::class, 'inventaris', 'id_inventaris');
    }
}
