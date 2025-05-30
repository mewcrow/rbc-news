<?php

namespace App\Domain\Crawler\Shared;

use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcPoliticsCrawler;

class Config
{
    public static array $strategiesMap = [
        [
            'strategy' => RbcPoliticsCrawler::class,
            'patterns' => ['rbc\.ru\/politics', 'rbc\.ru\/society']
        ],
    ];
}
