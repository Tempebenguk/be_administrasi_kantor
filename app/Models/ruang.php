<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

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
        'foto',
    ];

    public function cabang()
    {
        return $this->belongsTo(cabang::class, 'cabang', 'id_cabang');
    }

    protected function foto(): Attribute
    {
        return Attribute::make(
            get: fn ($foto) => url('/storage/ruang/' . $foto),
        );
    }
}
