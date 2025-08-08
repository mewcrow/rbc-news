<?php

namespace App\Domain\WebScraper\Shared;

use App\Models\PageLink;

abstract class AbstractPageCrawler
{
    public function __construct(
        public PageLink $pageLink
    ) {}

    /** @return array{page_link_id: int, title: string, image_remote: string, text: string} */
    abstract public function run(): array;
}
