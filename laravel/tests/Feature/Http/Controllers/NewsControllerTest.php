<?php

namespace Tests\Feature\Http\Controllers;

use App\Models\News;
use App\Models\PageLink;
use Illuminate\Foundation\Http\Middleware\ValidateCsrfToken;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Collection;
use Illuminate\Testing\Fluent\AssertableJson;
use Tests\TestCase;
use App\Models\User;

class NewsControllerTest extends TestCase
{
    use DatabaseTransactions;

    private Collection $news;

    public function setUp(): void
    {
        parent::setUp();

        $this->news = News::factory()->count(5)->create();
    }

    public function test_index_endpoint(): void
    {
        $this
            ->getJson(route('news.index'))
            ->assertStatus(200)
            ->assertJsonIsArray('data');
    }

    public function test_show_endpoint(): void
    {
        $this
            ->getJson(route('news.show', ['slug' => $this->news[0]->slug]))
            ->assertStatus(200)
            ->assertJson(fn (AssertableJson $json) =>
                $json->where('data.slug', $this->news->first()->slug)
                    ->where('data.title', $this->news->first()->title)
                    ->where('data.image', $this->news->first()->image)
                    ->where('data.text', $this->news->first()->text)
                    ->etc()
            );
    }
}
