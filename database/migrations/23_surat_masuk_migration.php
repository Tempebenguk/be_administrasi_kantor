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
        Schema::create('surat_masuk', function (Blueprint $table) {
            $table->string('id_surat_masuk')->primary()->unique();
            $table->string('nomor_surat');
            $table->date('tanggal_terima');
            $table->string('asal_surat');
            $table->string('perihal');
            $table->string('cabang');
            $table->string('foto')->nullable();
            $table->timestamps();

            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('surat_masuk');
    }
};
