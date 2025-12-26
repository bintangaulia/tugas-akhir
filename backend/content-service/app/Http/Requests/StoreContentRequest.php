<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreContentRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // nanti diganti JWT
    }

    public function rules(): array
    {
        return [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'type' => 'required|in:article,video,link',
            'target_role' => 'required|in:mahasiswa,dosen',
            'target_prodi' => 'required|string|max:100',
            'url' => 'nullable|url'
        ];
    }
}
