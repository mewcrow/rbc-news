<?php

namespace App\Domain\Crawler\RbcRu\PageCrawlerStrategy;

use Illuminate\Support\Facades\Http;
use Symfony\Component\DomCrawler\Crawler;
use App\Domain\Crawler\Shared\PageCrawlerStrategy;

class RbcWineCrawler extends PageCrawlerStrategy
{
    protected Crawler $page;

    public function run(): array
    {
        $this->page = $this->setPage();

        return $this->extractData();
    }

    protected function extractData(): array
    {
        $page_link_id = $this->pageLink->id;
        $title = $this->page->filter('h1.article-entry-title')->text();
        $image = $this->page->filter('.picture.article-image-img img')->attr('src');
        $text = '';
        $this->page->filter('.article-item.main-content p')->each(function($node) use (&$text) {
            $text .= $node->text();
        });

        return compact('page_link_id', 'title', 'image', 'text');
    }

    protected function setPage(): Crawler
    {
        return new Crawler(Http::get($this->pageLink->url));
    }
}
