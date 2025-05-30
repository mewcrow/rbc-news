<?php

namespace App\Domain\Crawler\RbcRu\PageCrawlerStrategy;

use App\Models\PageLink;

abstract class PageCrawlerStrategy
{
    public PageLink $pageLink;

    abstract public function run();
}
