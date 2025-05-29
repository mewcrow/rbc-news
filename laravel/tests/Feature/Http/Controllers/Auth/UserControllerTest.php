<?php

namespace Tests\Feature\Http\Controllers\Auth;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;
use App\Models\User;

class UserControllerTest extends TestCase
{
    use RefreshDatabase;

    private $user;

    public function setUp(): void
    {
        parent::setUp();

        $this->user = User::factory()->make();
    }

    public function test_get_user_endpoint(): void
    {
        Sanctum::actingAs($this->user);

        $this
            ->getJson(route('auth.user'))
            ->assertJsonFragment([
                'name' => $this->user->name,
            ]);
    }

    public function test_get_user_endpoint_returns_null_if_unauthorized(): void
    {
        $this->getJson(route('auth.user'))->assertExactJson([]);
    }
}
