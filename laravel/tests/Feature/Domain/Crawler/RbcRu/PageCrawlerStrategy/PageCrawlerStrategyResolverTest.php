<?php

namespace Tests\Feature\Domain\Crawler\RbcRu\PageCrawlerStrategy;

use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\PageCrawlerStrategyResolver;
use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcPoliticsCrawler;
use App\Models\PageLink;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class PageCrawlerStrategyResolverTest extends TestCase
{
    use DatabaseTransactions;

    public function test_resolves_correct_strategy_for_rbc_politics(): void
    {
        $strategy = new PageCrawlerStrategyResolver()->byPageLink(
            PageLink::factory()->make(['url' => 'https://rbc.ru/politics/123/123'])
        );

        $this->assertInstanceOf(RbcPoliticsCrawler::class, $strategy);
    }

    public function test_resolves_correct_strategy_for_rbc_society(): void
    {
        $strategy = new PageCrawlerStrategyResolver()->byPageLink(
            PageLink::factory()->make(['url' => 'https://rbc.ru/society/123/123'])
        );

        $this->assertInstanceOf(RbcPoliticsCrawler::class, $strategy);
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
