<?php

use App\Http\Controllers\NewsController;
use Illuminate\Support\Facades\Route;

Route::get('news', [NewsController::class, 'index'])->name('news.index');;
Route::get('news/{slug}', [NewsController::class, 'show'])->name('news.show');
