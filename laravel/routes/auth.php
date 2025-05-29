<?php

use App\Http\Controllers\Auth\SessionController;
use App\Http\Controllers\Auth\UserController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;

Route::get('user', [UserController::class, 'show'])->name('user');
Route::post('login', [SessionController::class, 'store'])->name('login');;
Route::post('logout', [SessionController::class, 'destroy'])->name('logout');;
Route::post('register', [RegisterController::class, 'store'])->name('register');;
