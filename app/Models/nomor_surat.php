<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nomor_surat extends Model
{
    use HasFactory;
    protected $table = 'nomor_surat';

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'format',
    ];
}
