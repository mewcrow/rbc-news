<?php

use App\Http\Controllers\Auth\SessionController;
use App\Http\Controllers\Auth\UserController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;

Route::get('secret-data', function () {
    return response()->json(['secret' => 'value']);
})->middleware('auth:sanctum');
