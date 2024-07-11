<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PemakaianInventarisResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request)
    {
        return [
            'id_pinjam' => $this->id_pinjam,
            'tanggal_pinjam' => $this->tanggal_pinjam,
            'tanggal_kembali' => $this->tanggal_kembali,
            'durasi_pinjam' => $this->durasi_pinjam,
            'pegawai' => $this->pegawai,
            'keterangan' => $this->keterangan,
            'cabang' => $this->cabang,
        ];
    }
}
