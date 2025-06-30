<?php

use App\Http\Controllers\NewsController;
use Illuminate\Support\Facades\Route;

Route::controller(NewsController::class)->prefix('news')->name('news.')->group(function() {
    Route::get('', 'index')->name('index');;
    Route::get('latest', 'latest')->name('latest');
    Route::get('{slug}', 'show')->name('show');
    Route::patch('{news}', 'update')->name('update')->middleware('auth:sanctum');
    Route::delete('{news}', 'destroy')->name('destroy')->middleware('auth:sanctum');
});
