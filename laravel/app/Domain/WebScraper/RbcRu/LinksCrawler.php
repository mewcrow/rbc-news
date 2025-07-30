<?php

namespace App\Domain\WebScraper\RbcRu;

use App\Repository\PageLinkRepository;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
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
        return new PageLinkRepository()->storeUrls($links);
    }

    private function extractUrls(string $page): array
    {
        $crawler = new Crawler($page)->filter('.main__inner .main__feed > a');

        $links = [];
        $crawler->each(function (Crawler $node) use (&$links) {
            $links[] = Str::before($node->attr('href'), '?') ;
        });

        return $links;
    }

    protected function getPage(): string
    {
        return Http::get('https://rbc.ru/')->body();
    }
}
