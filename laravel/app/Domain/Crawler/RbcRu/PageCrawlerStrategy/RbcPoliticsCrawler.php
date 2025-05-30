<?php

namespace App\Domain\Crawler\RbcRu\PageCrawlerStrategy;

use Illuminate\Support\Facades\Http;
use Symfony\Component\DomCrawler\Crawler;

class RbcPoliticsCrawler extends PageCrawlerStrategy
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
        $title = $this->page->filter('.article__header__title > h1')->text();
        $image = $this->page->filter('.smart-image__img')->attr('src');
        $text = $this->page->filter('.article__text.article__text_free')->text();

        return compact('page_link_id', 'title', 'image', 'text');
    }

    protected function setPage(): Crawler
    {
        return new Crawler(Http::get($this->pageLink->url));
    }
}
