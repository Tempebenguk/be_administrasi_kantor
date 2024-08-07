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
        Schema::create('admin_palingbaru', function (Blueprint $table) {
            $table->string('id_admin')->primary();
            $table->string('nama');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('no_hp');
            $table->string('jenkel')->nullable();
            $table->string('foto')->nullable();
            $table->string('status')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

        DB::statement('
            INSERT INTO admin_palingbaru (id_admin, nama, email, password, no_hp, jenkel, status, created_at, updated_at)
            SELECT id_admin, nama, email, password, no_hp, jenkel, status, created_at, updated_at
            FROM admin
        ');

        Schema::dropIfExists('admin');

        DB::statement('ALTER TABLE admin_palingbaru RENAME TO admin');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin');
    }
};
