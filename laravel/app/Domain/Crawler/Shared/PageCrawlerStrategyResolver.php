<?php

namespace App\Domain\Crawler\Shared;

use App\Domain\Crawler\Shared\PageCrawlerStrategy;
use App\Domain\Crawler\Shared\Config;
use InvalidArgumentException;

class PageCrawlerStrategyResolver
{
    public function byPageLink($link): PageCrawlerStrategy
    {
        $strategyMap = collect(Config::$strategiesMap)
            ->first(function ($config) use ($link) {
                $allConfigPatternsRegex = "/(".implode('|', $config['patterns']).")/";
                return preg_match($allConfigPatternsRegex, $link->url);
            });

        if (!$strategyMap) {
            throw new InvalidArgumentException("No strategy found for URL: {$link->url}");
        }

        /** @var PageCrawlerStrategy $strategy */
        $strategy = new $strategyMap['strategy'];
        $strategy->pageLink = $link;

        return $strategy;
    }
}
