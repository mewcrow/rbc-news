<?php

namespace App\Domain\WebScraper;

use App\Domain\WebScraper\Shared\AbstractPageCrawler;
use App\Domain\WebScraper\Shared\PageCrawlerStrategyResolver;
use App\Models\News;
use App\Models\PageLink;
use Illuminate\Support\Facades\Log;

class PageCrawler
{
    public function __construct(
        public PageLink $link,
        protected ?AbstractPageCrawler $crawler = null,
    ) {
        $this->crawler = $crawler ?? new PageCrawlerStrategyResolver()->byPageLink($this->link);
    }

    public function run(): void
    {
        $data = $this->crawler->run();
        $data = array_merge($data, ['rating' => random_int(1, 10)]);
        $created = new News($data)->save();

        if ($created) {
            $this->link->update(['is_parsed' => true]);
        } else {
            Log::error("Failed to parse", $data);
        }
    }
}
