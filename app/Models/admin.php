<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
    ];
}
