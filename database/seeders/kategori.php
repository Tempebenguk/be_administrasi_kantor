<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class kategori extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
{
    DB::table('kategori')->insert([
        ['id_kategori' => 'KAT001', 'nama_kategori' => 'Mobil'],
        ['id_kategori' => 'KAT002', 'nama_kategori' => 'Motor']
    ]);
} 
}
