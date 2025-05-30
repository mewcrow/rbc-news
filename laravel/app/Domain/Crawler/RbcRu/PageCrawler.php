<?php

namespace App\Domain\Crawler\RbcRu;

use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\PageCrawlerStrategy;
use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\PageCrawlerStrategyResolver;
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
        $created = News::query()->create($data);

        if ($created) {
            $this->link->update(['is_parsed' => true]);
        } else {
            Log::error("Failed to parse", $data);
        }
    }
}
