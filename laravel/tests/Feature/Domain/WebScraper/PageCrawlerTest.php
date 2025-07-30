<?php

namespace Tests\Feature\Domain\WebScraper;

use App\Domain\WebScraper\PageCrawler;
use App\Domain\WebScraper\Shared\PageCrawlerStrategy;
use App\Models\PageLink;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class PageCrawlerTest extends TestCase
{
    use DatabaseTransactions;

    public function test_page_is_crawled(): void
    {
        $link = PageLink::factory()->create(['url' => 'https://rbc.ru/politics/123123']);

        $mockStrategy = $this->createMock(PageCrawlerStrategy::class);
        $mockStrategy->expects($this->once())
            ->method('run')
            ->willReturn([
                'page_link_id' => $link->id,
                'title' => 'Mocked Title',
                'image' => fake()->url,
                'text' => fake()->text,
            ]);

        $pageCrawler = new PageCrawler($link, $mockStrategy);
        $pageCrawler->run();

        $this->assertDatabaseHas('news', ['title' => 'Mocked Title']);
        $this->assertTrue($link->fresh()->is_parsed);
    }
}
