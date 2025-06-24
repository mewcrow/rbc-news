<?php

namespace App\Domain\Crawler;

use App\Domain\Crawler\Shared\PageCrawlerStrategy;
use App\Domain\Crawler\Shared\PageCrawlerStrategyResolver;
use App\Models\News;
use App\Models\PageLink;
use Illuminate\Support\Facades\Log;

class PageCrawler
{
    protected PageCrawlerStrategy $strategy;

    public function __construct(
        public PageLink $link,
        ?PageCrawlerStrategy $strategy = null,
    ) {
        $this->strategy = $strategy ?? new PageCrawlerStrategyResolver()->byPageLink($this->link);
    }

    public function run(): void
    {
        $data = $this->strategy->run();
        $data = array_merge($data, ['rating' => random_int(1, 10)]);
        $created = new News($data)->save();

        if ($created) {
            $this->link->update(['is_parsed' => true]);
        } else {
            Log::error("Failed to parse", $data);
        }
    }
}
