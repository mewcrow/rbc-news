<?php

namespace App\Domain\WebScraper\Shared;

use App\Domain\WebScraper\Shared\AbstractPageCrawler;
use App\Domain\WebScraper\Shared\Config;
use InvalidArgumentException;

class PageCrawlerStrategyResolver
{
    public function byPageLink($link): AbstractPageCrawler
    {
        $strategyMap = collect(Config::$strategiesMap)
            ->first(function ($config) use ($link) {
                $allConfigPatternsRegex = "/(".implode('|', $config['patterns']).")/";
                return preg_match($allConfigPatternsRegex, $link->url);
            });

        if (!$strategyMap) {
            throw new InvalidArgumentException("No strategy found for URL: {$link->url}");
        }

        /** @var AbstractPageCrawler $strategy */
        $crawler = new $strategyMap['strategy']($link);

        return $crawler;
    }
}
