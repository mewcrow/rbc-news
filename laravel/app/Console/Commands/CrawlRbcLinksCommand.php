<?php

namespace App\Console\Commands;

use App\Jobs\CrawlRbcLinksJob;
use Illuminate\Console\Command;

class CrawlRbcLinksCommand extends Command
{
    protected $signature = 'crawl:rbc:links';

    protected $description = 'Crawl rbc.ru news links';

    public function handle(): void
    {
        CrawlRbcLinksJob::dispatch();

        $this->info('CrawlRbcLinksJob dispatched');
    }
}
