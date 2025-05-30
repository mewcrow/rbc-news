<?php

namespace App\Jobs;

use App\Domain\Crawler\RbcRu\LinksCrawler;
use App\Domain\Crawler\RbcRu\PageCrawler;
use App\Models\PageLink;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\Log;

class CrawlRbcPageJob implements ShouldQueue
{
    use Queueable;

    public function __construct(public PageLink $link)
    {
    }

    public function handle(): void
    {
        try {
            new PageCrawler($this->link)->run();

            Log::info("Page {$this->link->url} parsed");
        } catch (\Throwable $e) {
            Log::error("Failed to crawl {$this->link->url} page");
        }
    }
}
