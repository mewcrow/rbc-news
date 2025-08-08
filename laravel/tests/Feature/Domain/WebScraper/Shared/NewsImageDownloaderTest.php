<?php

namespace Tests\Feature\Domain\WebScraper\Shared;

use App\Domain\WebScraper\Shared\NewsImageDownloader;
use App\Models\News;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

class NewsImageDownloaderTest extends TestCase
{
    use DatabaseTransactions;

    public function test_it_downloads_and_saves_image()
    {
        Storage::fake('public');
        $news = News::factory()->create(['image_remote' => 'https://example.com/test.jpg',]);
        Http::fake(['example.com/*' => Http::response('fake_image_binary_content', 200)]);

        new NewsImageDownloader()->handle($news);

        /** @var \Illuminate\Filesystem\FilesystemAdapter|\Illuminate\Filesystem\FilesystemManager $disk */
        $disk = Storage::disk('public');
        $disk->assertExists("news-images/{$news->id}.jpg");

        $news->refresh();
        $this->assertStringContainsString("storage/news-images/{$news->id}.jpg", $news->image_local);
    }
}
