<?php

namespace Tests\Feature\Domain\WebScraper;

use App\Domain\WebScraper\PageCrawler;
use App\Domain\WebScraper\Shared\AbstractPageCrawler;
use App\Models\PageLink;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Domain\WebScraper\Shared\NewsImageDownloader;
use App\Models\News;
use Mockery;

class PageCrawlerTest extends TestCase
{
    use DatabaseTransactions;

    public function test_page_is_crawled(): void
    {
        $link = PageLink::factory()->create(['url' => 'https://rbc.ru/politics/123123']);

        $crawlerMock = $this->createMock(AbstractPageCrawler::class);
        $crawlerMock->expects($this->once())
            ->method('run')
            ->willReturn([
                'page_link_id' => $link->id,
                'title' => 'Mocked Title',
                'image_remote' => fake()->url,
                'text' => fake()->text,
            ]);
        $imageDownloaderMock = $this->createMock(NewsImageDownloader::class);
        $imageDownloaderMock->expects($this->once())
            ->method('handle')
            ->with($this->isInstanceOf(News::class));

        $pageCrawler = new PageCrawler($link, $crawlerMock, $imageDownloaderMock);
        $pageCrawler->run();

        $this->assertDatabaseHas('news', ['title' => 'Mocked Title']);
        $this->assertTrue($link->fresh()->is_parsed);
    }
}
