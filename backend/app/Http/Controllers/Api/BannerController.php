<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $Banner = Banner::all();

        return response()->json([
            'status'=> true,
            'message'=>'Data berhasil ditemukan',
            'data'=> $Banner

        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'banner_category_id' => 'required',
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

        $banner = Banner::create($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil dimasukkan',
            'data' => $banner
        ],201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $banner = Banner::findOrFail($id);
        return response()->json([
            'status'=>'true',
            'message'=>'Data berhasil ditemukan',
            'data'=> $banner
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'banner_category_id' => 'required',
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

        $banner = Banner::findOrFail($id);
        $banner::update($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil diperbaiki',
            'data' => $banner
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $banner = Banner::findOrFail($id);
        $banner->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus'
        ],204);
    }
}
