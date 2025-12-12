<?php

use App\Http\Controllers\Api\AuthorController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\NewsCategoryController;
use App\Http\Controllers\Api\NewsController;
use App\Http\Controllers\Api\PersonController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::resource('/author', AuthorController::class);

Route::resource('/category', NewsCategoryController::class);

Route::resource('/news', NewsController::class);

Route::resource('/banner', BannerController::class);

