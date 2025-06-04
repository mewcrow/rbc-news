<?php

namespace App\Domain\Crawler\Shared;

use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcRegularCrawler;
use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcWineCrawler;

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
