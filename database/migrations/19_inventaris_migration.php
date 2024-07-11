<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('inventaris', function (Blueprint $table) {
            $table->string('id_inventaris')->primary()->unique();
            $table->string('nopol');
            $table->string('merek');
            $table->string('kategori');
            $table->year('tahun');
            $table->integer('pajak');
            $table->date('masa_pajak');
            $table->integer('harga_beli');
            $table->date('tanggal_beli');
            $table->string('cabang');
            $table->timestamps();

            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inventaris');
    }
};
