<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class News extends Model
{
    use CrudTrait;
    use Sluggable, HasFactory, SoftDeletes;

    protected $fillable = [
        'page_link_id',
        'slug',
        'title',
        'image_remote',
        'image_local',
        'text',
        'rating',
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
