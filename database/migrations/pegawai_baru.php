<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement('ALTER TABLE pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_pegawai_foreign');
        DB::statement('ALTER TABLE reservasi_ruang DROP CONSTRAINT reservasi_ruang_pegawai_foreign');

        Schema::rename('pegawai', 'pegawai_old');

        Schema::create('pegawai', function (Blueprint $table) {
            $table->string('id_pegawai')->primary()->unique();
            $table->string('nip')->unique();
            $table->string('nama');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('departement');
            $table->string('alamat');
            $table->string('no_hp');
            $table->string('cabang');
            $table->string('jenkel')->nullable();
            $table->string('foto')->nullable();
            $table->string('status')->nullable();
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('departement')->references('id_departement')->on('departement')->onDelete('cascade');
            $table->foreign('cabang')->references('id_cabang')->on('cabang')->onDelete('cascade');
        });

        DB::statement('
            INSERT INTO pegawai_baru (id_pegawai, nip, nama, email, password, departement, alamat, no_hp, cabang, created_at, updated_at)
            SELECT id_pegawai, nip, nama, email, password, departement, alamat, no_hp, cabang, created_at, updated_at
            FROM pegawai_old
        ');

        Schema::dropIfExists('pegawai_old');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pegawai');
    }
};

