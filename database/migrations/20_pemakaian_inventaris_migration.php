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
        Schema::create('pemakaian_inventaris', function (Blueprint $table) {
            $table->string('id_pinjam')->primary()->unique();
            $table->string('inventaris');
            $table->dateTime('tanggal_pinjam');
            $table->dateTime('tanggal_kembali');
            $table->time('durasi_pinjam');
            $table->string('pegawai');
            $table->string('keterangan');
            $table->string('cabang');
            $table->timestamps();

            $table->foreign('inventaris')->references('id_inventaris')->on('inventaris')->onDelete('cascade');
            $table->foreign('pegawai')->references('id_pegawai')->on('pegawai')->onDelete('cascade');
            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pemakaian_inventaris');
    }
};
