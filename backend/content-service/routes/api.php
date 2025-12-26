<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ContentController;

Route::middleware('mock.auth')->group(function () {
    Route::get('/contents', [ContentController::class, 'index']);
    Route::post('/contents', [ContentController::class, 'store']);
    Route::put('/contents/{id}', [ContentController::class, 'update']);
    Route::delete('/contents/{id}', [ContentController::class, 'destroy']);
});

