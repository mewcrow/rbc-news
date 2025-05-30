<?php

namespace Tests\Feature\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Foundation\Http\Middleware\ValidateCsrfToken;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class SessionControllerTest extends TestCase
{
    use DatabaseTransactions;

    private User $user;

    public function setUp(): void
    {
        parent::setUp();

        $this->user = User::factory()->create();
    }

    public function test_user_can_log_in(): void
    {
        $payload = ['email' => $this->user->email, 'password' => 'password'];

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.login'), $payload)
            ->assertOk();

        $this->assertAuthenticated();
    }

    public function test_user_cannot_log_in_with_wrong_credentials(): void
    {
        $payload = ['email' => $this->user->email, 'password' => 'password1'];

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.login'), $payload)
            ->assertInvalid(['email']);

        $this->assertGuest();
    }

    public function test_user_can_log_out(): void
    {
        $this->actingAs($this->user);

        $this->assertAuthenticated('web');

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.logout'))
            ->assertOk();

        $this->assertGuest('web');
    }
}
