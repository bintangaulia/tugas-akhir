<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Content;
use Illuminate\Http\Request;

class ContentController extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => true,
            'data' => Content::all()
        ]);
    }

    public function show($id)
    {
        return response()->json([
            'status' => true,
            'data' => Content::findOrFail($id)
        ]);
    }

    public function personalized()
    {
        // Dummy user (karena belum terintegrasi)
        $user = [
            'role' => 'mahasiswa',
            'prodi' => 'Keperawatan'
        ];

        $data = Content::where('target_role', $user['role'])
            ->where('target_prodi', $user['prodi'])
            ->get();

        return response()->json([
            'status' => true,
            'data' => $data
        ]);
    }

    public function store(Request $request)
    {
        $content = Content::create($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Content created',
            'data' => $content
        ], 201);
    }
}
