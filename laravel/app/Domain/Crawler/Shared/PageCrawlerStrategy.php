<?php

namespace App\Domain\Crawler\Shared;

use App\Models\PageLink;

abstract class PageCrawlerStrategy
{
    public PageLink $pageLink;

    abstract public function run();
}
