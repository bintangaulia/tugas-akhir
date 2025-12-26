<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Content;
use Illuminate\Http\Request;

class ContentController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user;

        $query = Content::query();

        if ($user['role']) {
            $query->where(function ($q) use ($user) {
                $q->whereNull('target_role')
                    ->orWhere('target_role', $user['role']);
            });
        }

        if ($user['prodi']) {
            $query->where(function ($q) use ($user) {
                $q->whereNull('target_prodi')
                    ->orWhere('target_prodi', $user['prodi']);
            });
        }

        return response()->json($query->get());
    }

    public function show($id)
    {
        return response()->json([
            'status' => true,
            'data' => Content::findOrFail($id)
        ]);
    }

    public function update(Request $request, $id)
    {
        if ($request->user['role'] !== 'admin') {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        $content = Content::findOrFail($id);

        $content->update($request->only([
            'title',
            'description',
            'type',
            'target_role',
            'target_prodi',
            'url'
        ]));

        return response()->json($content);
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
        if ($request->user['role'] !== 'admin') {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        $validated = $request->validate([
            'title' => 'required|string',
            'description' => 'required|string',
            'type' => 'required|in:article,video,link',
            'target_role' => 'required|in:mahasiswa,dosen',
            'target_prodi' => 'required|string',
            'url' => 'nullable|string',
        ]);

        $content = Content::create($validated);

        return response()->json($content, 201);
    }

    public function destroy(Request $request, $id)
    {
        if ($request->user['role'] !== 'admin') {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        Content::findOrFail($id)->delete();

        return response()->json(['message' => 'Deleted']);
    }
}
