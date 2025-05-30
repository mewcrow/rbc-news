<?php

namespace App\Console\Commands;

use App\Jobs\CrawlRbcPageJob;
use App\Repository\PageLinkRepository;
use Illuminate\Console\Command;

class CrawlRbcPagesCommand extends Command
{
    protected $signature = 'crawl:rbc:pages';

    protected $description = 'Crawl rbc.ru pages';

    public function __construct(protected PageLinkRepository $links)
    {
        parent::__construct();
    }

    public function handle(): void
    {
        $links = $this->links->getUnparsed();

        $links->each(function ($url) {
            CrawlRbcPageJob::dispatch($url);
        });

        $this->info("{$links->count()} page crawlers dispatched");
    }
}
