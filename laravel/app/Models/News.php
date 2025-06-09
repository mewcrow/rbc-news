<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class News extends Model
{
    use Sluggable, HasFactory;

    protected $fillable = [
        'page_link_id',
        'slug',
        'title',
        'image',
        'text',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function pageLink(): BelongsTo
    {
        return $this->belongsTo(PageLink::class);
    }
}
