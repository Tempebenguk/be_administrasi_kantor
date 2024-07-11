<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class inventaris extends Model
{
    use HasFactory;
    protected $table = 'inventaris';
    protected $primaryKey = 'id_inventaris';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_inventaris',
        'nopol',
        'merek',
        'kategori',
        'tahun',
        'pajak',
        'masa_pajak',
        'harga_beli',
        'tanggal_beli',
        'cabang',
    ];

    public function pemakaian_inventaris()
    {
        return $this->hasMany(pemakaian_inventaris::class, 'inventaris', 'id_inventaris');
    }
}
