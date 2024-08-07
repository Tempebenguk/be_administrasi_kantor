<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

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
        'foto',
    ];

    public function pemakaian_inventaris()
    {
        return $this->hasMany(pemakaian_inventaris::class, 'inventaris', 'id_inventaris');
    }

    protected function foto(): Attribute
    {
        return Attribute::make(
            get: fn ($foto) => url('/storage/inventaris/' . $foto),
        );
    }
}
