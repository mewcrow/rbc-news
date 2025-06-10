<?php

use App\Http\Controllers\NewsController;
use Illuminate\Support\Facades\Route;

Route::get('news', [NewsController::class, 'index'])->name('news.index');;
Route::get('news/latest', [NewsController::class, 'latest'])->name('news.latest');
Route::get('news/{slug}', [NewsController::class, 'show'])->name('news.show');
