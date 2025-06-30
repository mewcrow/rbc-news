<?php

namespace Tests\Feature\Http\Controllers;

use App\Models\News;
use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Collection;
use Illuminate\Testing\Fluent\AssertableJson;
use Tests\TestCase;

class NewsControllerTest extends TestCase
{
    use DatabaseTransactions;

    private Collection $news;
    private User $admin;
    private User $regularUser;

    public function setUp(): void
    {
        parent::setUp();

        $this->news = News::factory()->count(5)->create();
        $this->admin = User::firstWhere('role', 'admin');
        $this->regularUser = User::firstWhere('role', 'regular');
    }

    public function test_index_endpoint(): void
    {
        $this
            ->getJson(route('news.index'))
            ->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'slug', 'title', 'image', 'text', 'created_at'
                    ]
                ]
            ]);
    }

    public function test_index_per_page_query_param_is_working(): void
    {
        $this
            ->getJson(route('news.index', ['per-page' => 2]))
            ->assertStatus(200)
            ->assertJsonCount(2, 'data');
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

    public function test_latest_endpoint(): void
    {
        $this
            ->getJson(route('news.latest', ['after' => now()->subHour()->toIso8601String()]))
            ->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'slug', 'title', 'image', 'text', 'created_at'
                    ]
                ]
            ]);
    }

    public function test_latest_endpoint_accepts_only_valid_date(): void
    {
        $this
            ->getJson(route('news.latest', ['after' => 'invalid_date']))
            ->assertInvalid([
                'after' => __('validation.date', ['attribute' => 'after']),
            ]);
    }

    public function test_update_endpoint__admin_can_update_news(): void
    {
        $this
            ->actingAs($this->admin)
            ->patchJson(
                route('news.update', ['news' => $this->news[0]['id']]),
                ['rating' => 8]
            )
            ->assertOk();

        $this->assertDatabaseHas('news', ['id' => $this->news[0]['id'], 'rating' => 8]);
    }

    public function test_update_endpoint_regular_users_cannot_update_news(): void
    {
        $this
            ->actingAs($this->regularUser)
            ->patchJson(
                route('news.update', ['news' => $this->news[0]['id']]),
                ['rating' => 8]
            )
            ->assertForbidden();

    }

    public function test_update_endpoint_news_rating_validation(): void
    {
        $this
            ->actingAs($this->admin)
            ->patchJson(
                route('news.update', ['news' => $this->news[0]['id']]),
                ['rating' => 11]
            )
            ->assertInvalid('rating');
    }

    public function test_delete_endpoint_admin_can_delete_news(): void
    {
        $this
            ->actingAs($this->admin)
            ->deleteJson(
                route('news.destroy', ['news' => $this->news[0]['id']]),
            )
            ->assertOk();

        $this->assertSoftDeleted($this->news[0]);
    }

    public function test_delete_endpoint_only_admin_can_delete_news(): void
    {
        $this
            ->actingAs($this->regularUser)
            ->deleteJson(
                route('news.destroy', ['news' => $this->news[0]['id']]),
            )
            ->assertForbidden();
    }
}
