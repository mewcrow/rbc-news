<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class PageLink extends Model
{
    use HasFactory;

    protected $fillable = [
        'url',
        'is_parsed',
    ];

    public function news(): HasOne
    {
        return $this->hasOne(News::class);
    }
}
