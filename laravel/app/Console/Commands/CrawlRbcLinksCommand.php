<?php

namespace App\Console\Commands;

use App\Domain\WebScraper\RbcRu\LinksCrawler;
use Illuminate\Console\Command;

class CrawlRbcLinksCommand extends Command
{
    protected $signature = 'crawl:rbc:links';

    protected $description = 'Crawl rbc.ru news links';

    public function handle(): void
    {
        $parsedQty = new LinksCrawler()->run();

        $this->info("$parsedQty links crawled");
    }
}
