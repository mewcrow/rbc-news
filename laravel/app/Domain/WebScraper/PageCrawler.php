<?php

namespace App\Domain\WebScraper;

use App\Domain\WebScraper\Shared\PageCrawlerStrategy;
use App\Domain\WebScraper\Shared\PageCrawlerStrategyResolver;
use App\Models\News;
use App\Models\PageLink;
use Illuminate\Support\Facades\Log;

class PageCrawler
{
    protected PageCrawlerStrategy $parser;

    public function __construct(
        public PageLink $link,
        ?PageCrawlerStrategy $parser = null,
    ) {
        $this->parser = $parser ?? new PageCrawlerStrategyResolver()->byPageLink($this->link);
    }

    public function run(): void
    {
        $data = $this->parser->run();
        $data = array_merge($data, ['rating' => random_int(1, 10)]);
        $created = new News($data)->save();

        if ($created) {
            $this->link->update(['is_parsed' => true]);
        } else {
            Log::error("Failed to parse", $data);
        }
    }
}
