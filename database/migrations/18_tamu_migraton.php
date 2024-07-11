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
        Schema::create('tamu', function (Blueprint $table) {
            $table->string('id_tamu')->primary()->unique();
            $table->dateTime('tanggal_kunjungan');
            $table->string('nama');
            $table->string('jabatan');
            $table->string('no_hp');
            $table->string('departement_dikunjungi');
            $table->string('keperluan');
            $table->string('cabang');
            $table->string('org_dikunjungi');
            $table->timestamps();

            $table->foreign('departement_dikunjungi')->references('id_departement')->on('departement')->onDelete('cascade');
            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tamu');
    }
};
