<?php

namespace App\Domain\WebScraper;

use App\Domain\WebScraper\Shared\AbstractPageCrawler;
use App\Domain\WebScraper\Shared\NewsImageDownloader;
use App\Domain\WebScraper\Shared\PageCrawlerStrategyResolver;
use App\Models\News;
use App\Models\PageLink;
use Illuminate\Support\Facades\Log;

class PageCrawler
{
    public function __construct(
        public PageLink $link,
        protected ?AbstractPageCrawler $crawler = null,
        protected ?NewsImageDownloader $imageDownloader = null,
    ) {
        $this->crawler = $crawler ?? new PageCrawlerStrategyResolver()->byPageLink($this->link);
        $this->imageDownloader = $imageDownloader ?? new NewsImageDownloader();
    }

    public function run(): void
    {
        $data = $this->crawler->run();
        $data = $data + ['rating' => random_int(1, 10)];
        $created = News::query()->create($data);

        if ($created) {
            $this->link->update(['is_parsed' => true]);
            $this->imageDownloader->handle($created);
        } else {
            Log::error("Failed to parse", $data);
        }
    }
}
