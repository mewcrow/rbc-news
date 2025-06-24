<?php

namespace Tests\Feature\Domain\Crawler\Shared;

use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcRegularCrawler;
use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcWineCrawler;
use App\Domain\Crawler\Shared\PageCrawlerStrategyResolver;
use App\Models\PageLink;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class PageCrawlerStrategyResolverTest extends TestCase
{
    use DatabaseTransactions;

    public function test_resolves_correct_strategy_for_rbc_politics(): void
    {
        $strategy = new PageCrawlerStrategyResolver()->byPageLink(
            PageLink::factory()->make(['url' => 'https://www.rbc.ru/politics/123/123'])
        );

        $this->assertInstanceOf(RbcRegularCrawler::class, $strategy);
    }

    public function test_resolves_correct_strategy_for_rbc_society(): void
    {
        $strategy = new PageCrawlerStrategyResolver()->byPageLink(
            PageLink::factory()->make(['url' => 'https://www.rbc.ru/society/123/123'])
        );

        $this->assertInstanceOf(RbcRegularCrawler::class, $strategy);
    }

    public function test_resolves_correct_strategy_for_rbc_wine(): void
    {
        $strategy = new PageCrawlerStrategyResolver()->byPageLink(
            PageLink::factory()->make(['url' => 'https://www.rbc.ru/wine/123/123'])
        );

        $this->assertInstanceOf(RbcWineCrawler::class, $strategy);
    }

    public function test_throws_error_for_unknown_url_pattern(): void
    {
        $this->assertThrows(function() {
            new PageCrawlerStrategyResolver()->byPageLink(
                PageLink::factory()->make(['url' => 'https://rbc.ru/foobaarr/123/123'])
            );
        }, \InvalidArgumentException::class);
    }
}
