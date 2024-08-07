<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class admin extends Model
{
    use HasFactory;
    protected $table = 'admin';
    protected $primaryKey = 'id_admin';
    public $incrementing = false;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'id_admin',
        'nama',
        'email',
        'password',
        'no_hp',
        'foto',
        'jenkel',
        'status',
    ];

    /**
     * image
     *
     * @return Attribute
     */
    protected function foto(): Attribute
    {
        return Attribute::make(
            get: fn ($foto) => url('/storage/admin/' . $foto),
        );
    }
}
