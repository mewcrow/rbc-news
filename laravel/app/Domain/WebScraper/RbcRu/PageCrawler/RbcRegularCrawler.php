<?php

namespace App\Domain\WebScraper\RbcRu\PageCrawler;

use App\Domain\WebScraper\Shared\AbstractPageCrawler;
use Illuminate\Support\Facades\Http;
use Symfony\Component\DomCrawler\Crawler;

class RbcRegularCrawler extends AbstractPageCrawler
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
        $image_remote = '';
        try {
            $image_remote = $this->page->filter('.article__main-image__wrap .smart-image__img')->attr('src');
        } catch (\Throwable) {}

        $paragraphs = [];
        $this->page
            ->filter('.article__text__overview span, .article__text_free p')
            ->each(function ($node) use (&$paragraphs) {
                return $paragraphs[] = $node->text();
            });
        $text = array_reduce($paragraphs, function ($carry, $item) {
            return $carry . "$item\n";
        }, '');

        return compact('page_link_id', 'title', 'image_remote', 'text');
    }

    protected function setPage(): Crawler
    {
        return new Crawler(Http::get($this->pageLink->url));
    }
}
