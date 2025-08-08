<?php
namespace App\Repository;

use App\Http\Resources\NewsResource;
use App\Models\News;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Facades\DB;

class NewsRepository
{
    public function getIndex(int $perPage = 20): AnonymousResourceCollection
    {
        return NewsResource::collection(
            $this->withShortenedText()->paginate($perPage)
        );
    }

    public function getPublishedAfter(string $publishedAfter): AnonymousResourceCollection
    {
        return NewsResource::collection(
            $this
                ->withShortenedText()
                ->where('created_at', '>', $publishedAfter)
                ->limit(15)
                ->get()
        );
    }

    private function withShortenedText(): Builder
    {
        return News::select(
            'id',
            'slug',
            'title',
            'image_remote',
            'image_local',
            DB::raw('left(text, 200) AS text'),
            'rating',
            'created_at',
        )
        ->latest();
    }
}
