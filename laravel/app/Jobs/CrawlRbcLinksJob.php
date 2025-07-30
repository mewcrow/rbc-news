<?php

namespace App\Jobs;

use App\Domain\WebScraper\RbcRu\LinksCrawler;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\Log;

class CrawlRbcLinksJob implements ShouldQueue
{
    use Queueable;

    public function handle(): void
    {
        try {
            $parsedQty = new LinksCrawler()->run();
            Log::info("$parsedQty links parsed");
        } catch (\Throwable $e) {
            Log::error('Failed to crawl rbc.ru links');
        }
    }
}
