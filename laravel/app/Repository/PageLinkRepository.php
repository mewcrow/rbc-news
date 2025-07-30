<?php

namespace App\Repository;

use App\Domain\WebScraper\Shared\Config;
use App\Models\PageLink;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class PageLinkRepository
{
    public function getUnparsed(int $limit = 25): Collection
    {
        $configuredPatterns = collect(Config::$strategiesMap)
            ->map(fn ($strategy) => implode('|', $strategy['patterns']))
            ->implode('|');
        $configuredPatterns = "($configuredPatterns)";

        return PageLink::query()
            ->where('is_parsed', false)
            ->orderBy('created_at', 'DESC')
            ->where('url', '~', $configuredPatterns)
            ->limit($limit)
            ->get();
    }

    public function storeUrls($urls): int
    {
        return DB::table('page_links')->insertOrIgnore(
            collect($urls)->map(fn($url) => [
                'url' => $url,
                'is_parsed' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ])->toArray()
        );
    }
}
