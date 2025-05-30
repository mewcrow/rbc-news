<?php

namespace Tests\Feature\Domain\Crawler\RbcRu;

use App\Domain\Crawler\RbcRu\LinksCrawler;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class LinksCrawlerTest extends TestCase
{
    use DatabaseTransactions;

    public function test_links_are_extracted_from_rbc_ru_main_page(): void
    {
        $html = file_get_contents(__DIR__.'/../../../../Fixtures/News/rbc_index.html');

        $mock = $this->getMockBuilder(LinksCrawler::class)
            ->onlyMethods(['getPage', 'saveLinks'])
            ->getMock();

        $mock->expects($this->once())
            ->method('getPage')
            ->willReturn($html);

        $mock->expects($this->once())
            ->method('saveLinks')
            ->with($this->callback(function ($links) {
                return is_array($links) && count($links) === 15;
            }))
            ->willReturn(15);

        $result = $mock->run();

        $this->assertEquals(15, $result);
    }
}
