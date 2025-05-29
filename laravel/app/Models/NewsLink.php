<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsLink extends Model
{
    protected $fillable = [
        'url',
        'is_parsed',
    ];
}
