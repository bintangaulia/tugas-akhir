<?php

namespace Database\Seeders;

use App\Models\Content;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ContentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Content::create([
            'title' => 'Edukasi Kesehatan Jantung',
            'description' => 'Pencegahan penyakit jantung',
            'type' => 'article',
            'target_role' => 'mahasiswa',
            'target_prodi' => 'Keperawatan',
            'url' => 'https://contoh.com/jantung'
        ]);
    }
}
