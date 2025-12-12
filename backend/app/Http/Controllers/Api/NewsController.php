<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $News = News::all();

        return response()->json([
            'status'=> true,
            'message'=>'Data berhasil ditemukan',
            'data'=> $News

        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'news_category_id' => 'required',
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

        $news = News::create($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil dimasukkan',
            'data' => $news
        ],201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $news = News::findOrFail($id);
        return response()->json([
            'status'=>'true',
            'message'=>'Data berhasil ditemukan',
            'data'=> $news
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'news_category_id' => 'required',
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

        $news = News::findOrFail($id);
        $news::update($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil diperbaiki',
            'data' => $news
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $news = News::findOrFail($id);
        $news->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus'
        ],204);
    }
}
