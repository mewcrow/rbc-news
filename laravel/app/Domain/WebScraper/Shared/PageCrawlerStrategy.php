<?php

namespace App\Domain\WebScraper\Shared;

use App\Models\PageLink;

abstract class PageCrawlerStrategy
{
    public PageLink $pageLink;

    abstract public function run();
}
