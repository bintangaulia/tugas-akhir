<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Author;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AuthorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
   
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $Author = Author::all();

        return response()->json([
            'status'=> true,
            'message'=>'Data berhasil ditemukan',
            'data'=> $Author

        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'author_category_id' => 'required',
            'title' => 'required',
            'slug' => 'required',
            'thumbnail' => 'required',
            'content' => 'required'
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>false,
                'message'=>'Validasi Error',
                'errors'=>$validator->errors()
            ],422);
        }

        $author = Author::create($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil dimasukkan',
            'data' => $author
        ],201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $author = Author::findOrFail($id);
        return response()->json([
            'status'=>'true',
            'message'=>'Data berhasil ditemukan',
            'data'=> $author
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'author_category_id' => 'required',
            'title' => 'required',
            'slug' => 'required',
            'thumbnail' => 'required',
            'content' => 'required'
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>false,
                'message'=>'Validasi Error',
                'errors'=>$validator->errors()
            ],422);
        }

        $author = Author::findOrFail($id);
        $author::update($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil diperbaiki',
            'data' => $author
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $author = Author::findOrFail($id);
        $author->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus'
        ],204);
    }
}
