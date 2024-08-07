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
        Schema::create('ruang', function (Blueprint $table) {
            $table->string('id_ruang')->primary()->unique();
            $table->string('nama_ruang');
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
        Schema::dropIfExists('ruang');
    }
};
