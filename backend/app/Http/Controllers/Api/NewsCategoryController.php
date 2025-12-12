<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\newcategoryCategory;
use App\Models\NewsCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NewsCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
   
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $newcategory = NewsCategory::all();

        return response()->json([
            'status'=> true,
            'message'=>'Data berhasil ditemukan',
            'data'=> $newcategory

        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'author_id' => 'required',
            'newcategory_category_id' => 'required',
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

        $newcategory = NewsCategory::create($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil dimasukkan',
            'data' => $newcategory
        ],201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $newcategory = NewsCategory::findOrFail($id);
        return response()->json([
            'status'=>'true',
            'message'=>'Data berhasil ditemukan',
            'data'=> $newcategory
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'title' => 'required',
            'slug' => 'required',

        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>false,
                'message'=>'Validasi Error',
                'errors'=>$validator->errors()
            ],422);
        }

        $newcategory = NewsCategory::findOrFail($id);
        $newcategory::update($request->all());
        return response()->json([
            'status'=>true,
            'message'=>'data berhasil diperbaiki',
            'data' => $newcategory
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $newcategory = NewsCategory::findOrFail($id);
        $newcategory->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus'
        ],204);
    }
}
