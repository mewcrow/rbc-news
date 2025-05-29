<?php

namespace App\Console\Commands;

use App\Domain\News\Crawlers\LinksCrawler;
use Illuminate\Console\Command;

class CrawlNewsCommand extends Command
{
    protected $signature = 'crawl:links';

    protected $description = 'Crawl rbc.ru news links';

    public function handle(): void
    {
        $parsedQty = new LinksCrawler()->run();

        $this->info("$parsedQty links parsed");
    }
}
