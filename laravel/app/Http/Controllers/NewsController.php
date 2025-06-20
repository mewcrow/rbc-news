<?php

namespace App\Http\Controllers;

use App\Http\Resources\NewsResource;
use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use App\Repository\NewsRepository;

class NewsController extends Controller
{
    public function index(Request $request): AnonymousResourceCollection
    {
        $queryParams = $request->validate(['per-page' => 'sometimes|integer']);
        $perPage = array_key_exists('per-page', $queryParams) ? $queryParams['per-page'] : 20;

        return new NewsRepository()->getIndex($perPage);
    }

    public function show(string $slug): NewsResource
    {
        return new NewsResource(
            News::query()->where('slug', $slug)->firstOrFail()
        );
    }

    public function latest(Request $request): AnonymousResourceCollection
    {
        $queryParams = $request->validate(['after' => 'required|date']);
        $after = $queryParams['after'];

        return new NewsRepository()->getPublishedAfter($after);
    }
}
