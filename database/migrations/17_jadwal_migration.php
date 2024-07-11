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
        Schema::create('jadwal', function (Blueprint $table) {
            $table->string('id_jadwal')->primary()->unique();
            $table->dateTime('tanggal');
            $table->string('status')->nullable();
            $table->string('agenda');
            $table->string('cabang');
            $table->timestamps();

            $table->foreign('status')->references('id_departement')->on('departement')->onDelete('cascade');
            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jadwal');
    }
};
