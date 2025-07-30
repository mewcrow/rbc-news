<?php

namespace App\Domain\WebScraper\Shared;

use App\Domain\WebScraper\RbcRu\PageCrawler\RbcRegularCrawler;
use App\Domain\WebScraper\RbcRu\PageCrawler\RbcWineCrawler;

class Config
{
    public static array $strategiesMap = [
        [
            'strategy' => RbcRegularCrawler::class,
            'patterns' => ['https:\/\/www\.rbc\.ru\/(?!wine)']
        ],
        [
            'strategy' => RbcWineCrawler::class,
            'patterns' => ['https:\/\/www\.rbc\.ru\/wine']
        ],
    ];
}
