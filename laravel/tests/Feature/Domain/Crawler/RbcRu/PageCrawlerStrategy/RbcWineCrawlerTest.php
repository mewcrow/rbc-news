<?php

namespace Feature\Domain\Crawler\RbcRu\PageCrawlerStrategy;

use App\Domain\Crawler\RbcRu\PageCrawlerStrategy\RbcWineCrawler;
use App\Models\PageLink;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Symfony\Component\DomCrawler\Crawler;
use Tests\TestCase;

class RbcWineCrawlerTest extends TestCase
{
    use DatabaseTransactions;

    public function test_successfully_crawled_rbc_wine_page(): void
    {
        $html = file_get_contents(__DIR__.'/../../../../../Fixtures/News/rbc_wine_page.html');

        $mock = $this->getMockBuilder(RbcWineCrawler::class)
            ->onlyMethods(['setPage'])
            ->getMock();

        $mock->expects($this->once())
            ->method('setPage')
            ->willReturn(new Crawler($html));
        $mock->pageLink = PageLink::factory()->create();

        $result = $mock->run();
        $this->assertIsArray($result);
        $this->assertIsInt($result['page_link_id']);
        $this->assertIsString($result['image']);
        $this->assertIsString($result['text']);
    }
}
