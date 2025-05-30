<?php

use App\Console\Commands\CrawlRbcPagesCommand;
use App\Jobs\CrawlRbcLinksJob;
use Illuminate\Support\Facades\Schedule;

Schedule::job(new CrawlRbcLinksJob)->everyTenMinutes();
Schedule::command(CrawlRbcPagesCommand::class)->everyFiveMinutes();

