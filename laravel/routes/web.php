<?php

use Illuminate\Support\Facades\Route;
use Docs\OpenApiJsonBuilder;


Route::get('/', function () {
    return view('welcome');
});

Route::prefix('swagger')->group(function() {
    Route::get('/', fn() => view('swagger'));
    Route::get('openapi.json', fn(OpenApiJsonBuilder $openApi) => $openApi->build());
});
