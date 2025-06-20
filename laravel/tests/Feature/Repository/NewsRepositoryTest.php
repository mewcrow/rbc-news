<?php

namespace Tests\Feature\Repository;

use App\Models\News;
use App\Repository\NewsRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class NewsRepositoryTest extends TestCase
{
    use DatabaseTransactions;

    private $news;

    public function setUp(): void
    {
        parent::setUp();
        $this->news = News::factory()->count(5)->create();
    }

    public function test_get_index_returns_index_page_collection(): void
    {
        $news = new NewsRepository()->getIndex();

        $this->assertInstanceOf(AnonymousResourceCollection::class, $news);
        $this->assertGreaterThan(0, $news->count());
    }

    public function test_get_published_after_returns_news_published_after_datetime(): void
    {
        $news = new NewsRepository()->getPublishedAfter(now()->subHour()->toIso8601String());

        $this->assertInstanceOf(AnonymousResourceCollection::class, $news);
        $this->assertGreaterThan(0, $news->count());
    }
}
