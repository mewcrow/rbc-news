<?php

namespace Tests\Feature\Repository;

use App\Models\PageLink;
use App\Repository\PageLinkRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class PageLinkRepositoryTest extends TestCase
{
    use DatabaseTransactions;

    public function setUp(): void
    {
        parent::setUp();

        DB::table('page_links')->truncate();
    }

    public function test_get_unparsed_returns_only_parseable_links(): void
    {
        PageLink::factory()->createMany([
            ['url' => 'https://www.rbc.ru/politics/123'],
            ['url' => 'https://www.rbc.ru/society/123'],
            ['url' => 'https://www.unparseable.ru/unparseable/123'],
        ]);

        $result = new PageLinkRepository()->getUnparsed();

        $this->assertCount(2, $result);
    }

    public function test_store_url_method(): void
    {
        new PageLinkRepository()->storeUrls([
            'https://rbc.ru/politics/123',
            'https://rbc.ru/society/123',
            'https://rbc.ru/unparseable/123',
        ]);

        $this->assertDatabaseCount('page_links', 3);
    }
}
