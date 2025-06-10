<?php

namespace App\Http\Controllers;

use App\Http\Resources\NewsResource;
use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class NewsController extends Controller
{
    public function index(Request $request): AnonymousResourceCollection
    {
        $queryParams = $request->validate(['per-page' => 'sometimes|integer']);
        $perPage = array_key_exists('per-page', $queryParams) ? $queryParams['per-page'] : 20;

        return NewsResource::collection(News::query()->latest()->paginate($perPage));
    }

    public function show(string $slug): NewsResource
    {
        return new NewsResource(News::query()->where('slug', $slug)->firstOrFail());
    }

    public function latest(Request $request): AnonymousResourceCollection
    {
        $queryParams = $request->validate(['after' => 'required|date']);
        $after = $queryParams['after'];

        return NewsResource::collection(
            News::query()
                ->latest()
                ->where('created_at', '>', $after)
                ->limit(15)
                ->get()
        );
    }
}
