<?php

namespace App\Domain\WebScraper\Shared;

use App\Domain\WebScraper\Shared\AbstractPageCrawler;
use App\Domain\WebScraper\Shared\Config;
use App\Models\PageLink;
use InvalidArgumentException;

class PageCrawlerStrategyResolver
{
    public function byPageLink(PageLink $link): AbstractPageCrawler
    {
        $siteConfig = $this->getConfigByUrlPattern($link);
        $crawler = new $siteConfig['parser']($link);

        return $crawler;
    }

    private function getConfigByUrlPattern(PageLink $link): array
    {
        $siteConfig = collect(Config::$sites)
            ->first(function ($config) use ($link) {
                $sitePattern = "/(".implode('|', $config['urlPatterns']).")/";
                return preg_match($sitePattern, $link->url);
            });

        if (!$siteConfig) {
            throw new InvalidArgumentException("No strategy found for URL: {$link->url}");
        }

        return $siteConfig;
    }
}
