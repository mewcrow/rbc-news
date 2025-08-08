<?php

namespace Tests\Feature\Domain\WebScraper\RbcRu\PageCrawler;

use App\Domain\WebScraper\RbcRu\PageCrawler\RbcRegularCrawler;
use App\Models\PageLink;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Symfony\Component\DomCrawler\Crawler;
use Tests\TestCase;

class RbcRegularCrawlerTest extends TestCase
{
    use DatabaseTransactions;

    public function test_successfully_crawled_politics_page(): void
    {
        $html = file_get_contents(__DIR__.'/../../../../../Fixtures/News/rbc_politics_page.html');

        $mock = $this->getMockBuilder(RbcRegularCrawler::class)
            ->onlyMethods(['setPage'])
            ->setConstructorArgs([new PageLink(['url' => 'https://example.com'])])
            ->getMock();

        $mock->expects($this->once())
            ->method('setPage')
            ->willReturn(new Crawler($html));
        $mock->pageLink = PageLink::factory()->create();

        $result = $mock->run();
        $this->assertIsArray($result);
        $this->assertIsInt($result['page_link_id']);
        $this->assertIsString($result['image_remote']);
        $this->assertIsString($result['text']);
    }
}
