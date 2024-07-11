<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InventarisResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request)
    {
        return [
            'id_inventaris' => $this->id_inventaris,
            'nama' => $this->nama,
            'merek' => $this->merek,
            'kategori' => $this->kategori,
            'tahun' => $this->tahun,
            'pajak' => $this->pajak,
            'masa_pajak' => $this->masa_pajak,
            'harga_beli' => $this->harga_beli,
            'tanggal_beli' => $this->tanggal_beli,
            'cabang' => $this->cabang,
            'pemakaian' => PemakaianInventarisResource::collection($this->pemakaianInventaris),
        ];
    }
}
