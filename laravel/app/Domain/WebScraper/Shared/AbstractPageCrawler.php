<?php

namespace App\Domain\WebScraper\Shared;

use App\Models\PageLink;

abstract class AbstractPageCrawler
{
    public function __construct(
        public PageLink $pageLink
    ) {}

    abstract public function run(): array;
}
