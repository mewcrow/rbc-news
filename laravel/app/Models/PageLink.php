<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PageLink extends Model
{
    use HasFactory;

    protected $fillable = [
        'url',
        'is_parsed',
    ];

    public function news(): BelongsTo
    {
        return $this->belongsTo(News::class);
    }
}
