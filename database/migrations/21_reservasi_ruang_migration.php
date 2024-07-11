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
        Schema::create('reservasi_ruang', function (Blueprint $table) {
            $table->string('id_reservasi')->primary()->unique();
            $table->string('ruang');
            $table->dateTime('tanggal_reservasi');
            $table->dateTime('tanggal_selesai');
            $table->time('durasi');
            $table->string('pegawai');
            $table->string('keterangan');
            $table->string('cabang');
            $table->timestamps();

            $table->foreign('ruang')->references('id_ruang')->on('ruang')->onDelete('cascade');
            $table->foreign('pegawai')->references('id_pegawai')->on('pegawai')->onDelete('cascade');
            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservasi_ruang');
    }
};
