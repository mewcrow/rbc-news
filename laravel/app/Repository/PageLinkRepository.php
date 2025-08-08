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
        $configuredPatterns = collect(Config::$sites)
            ->map(fn ($site) => implode('|', $site['urlPatterns']))
            ->implode('|');

        return PageLink::query()
            ->whereDoesntHave('news')
            ->where('is_parsed', false)
            ->where('url', '~', "($configuredPatterns)")
            ->orderBy('created_at', 'DESC')
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
