<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ContentController;

Route::prefix('contents')->group(function () {
    Route::get('/', [ContentController::class, 'index']);
    Route::get('/personalized', [ContentController::class, 'personalized']);
    Route::get('/{id}', [ContentController::class, 'show']);
    Route::post('/', [ContentController::class, 'store']);
});

Route::get('/contents', [ContentController::class, 'index']);
