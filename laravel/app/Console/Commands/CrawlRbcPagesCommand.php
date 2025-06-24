<?php

namespace App\Console\Commands;

use App\Domain\Crawler\PageCrawler;
use App\Jobs\CrawlRbcPageJob;
use App\Models\PageLink;
use App\Repository\PageLinkRepository;
use Illuminate\Console\Command;

class CrawlRbcPagesCommand extends Command
{
    protected $signature = 'crawl:rbc:pages {pageId?}';

    protected $description = 'Crawl rbc.ru pages';

    public function __construct(protected PageLinkRepository $links)
    {
        parent::__construct();
    }

    public function handle(): void
    {
        if ($this->argument('pageId')) {
            $this->crawlLink();
        } else {
            $this->crawlUnparsedLinks();
        }
    }

    public function crawlUnparsedLinks(): void
    {
        $links = $this->links->getUnparsed();

        $links->each(function ($url) {
            CrawlRbcPageJob::dispatch($url);
        });

        $this->info("{$links->count()} page crawlers dispatched");
    }

    public function crawlLink(): void
    {
        $link = PageLink::query()->findOrFail($this->argument('pageId'));
        new PageCrawler($link)->run();

        $this->info("Crawled $link->url");
    }
}
