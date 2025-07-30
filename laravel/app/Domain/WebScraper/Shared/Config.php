<?php

namespace App\Domain\WebScraper\Shared;

use App\Domain\WebScraper\RbcRu\PageCrawler\RbcRegularCrawler;
use App\Domain\WebScraper\RbcRu\PageCrawler\RbcWineCrawler;
use App\Domain\WebScraper\Shared\AbstractPageCrawler;

class Config
{
    /**
     * @var array<
     *   array{ title: string, parser: AbstractPageCrawler, urlPatterns: string[] }
     * >
     */
    public static array $sites = [
        [
            'title' => 'rbc.ru',
            'parser' => RbcRegularCrawler::class,
            'urlPatterns' => ['https:\/\/www\.rbc\.ru\/(?!wine)']
        ],
        [
            'title' => 'rbc.ru/wine',
            'parser' => RbcWineCrawler::class,
            'urlPatterns' => ['https:\/\/www\.rbc\.ru\/wine']
        ],
    ];
}
