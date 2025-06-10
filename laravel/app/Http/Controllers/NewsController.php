<?php

namespace App\Http\Controllers;

use App\Http\Resources\NewsResource;
use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class NewsController extends Controller
{
    public function index(): AnonymousResourceCollection
    {
        return NewsResource::collection(News::query()->latest()->paginate());
    }

    public function show(string $slug): NewsResource
    {
        return new NewsResource(News::query()->where('slug', $slug)->firstOrFail());
    }

    public function latest(Request $request): AnonymousResourceCollection
    {
        $after = $request->validate(['after' => 'required|date'])['after'];

        return NewsResource::collection(
            News::query()
                ->latest()
                ->where('created_at', '>', $after)
                ->limit(15)
                ->get()
        );
    }
}
