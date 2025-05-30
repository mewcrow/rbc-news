<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $fillable = [
        'page_link_id',
        'title',
        'image',
        'text',
    ];
}
