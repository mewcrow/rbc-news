<?php

namespace App\Domain\News\Crawlers;

use App\Models\NewsLink;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Symfony\Component\DomCrawler\Crawler;

class LinksCrawler
{
    public function run(): int
    {
        $links = $this->extractUrls($this->getPage());

        return $this->saveLinks($links);
    }

    protected function saveLinks(array $links): int
    {
        return DB::table('news_links')->insertOrIgnore(
            collect($links)->map(fn($url) => [
                'url' => $url,
                'is_parsed' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ])->toArray()
        );
    }

    private function extractUrls(string $page): array
    {
        $crawler = new Crawler($page)->filter('.main__inner .main__feed > a');

        $links = [];
        $crawler->each(function (Crawler $node) use (&$links) {
            $links[] = $node->attr('href');
        });

        return $links;
    }

    protected function getPage(): string
    {
        return Http::get('https://rbc.ru/')->body();
    }
}
