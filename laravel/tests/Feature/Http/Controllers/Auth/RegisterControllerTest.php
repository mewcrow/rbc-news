<?php

namespace Tests\Feature\Http\Controllers\Auth;

use Illuminate\Foundation\Http\Middleware\ValidateCsrfToken;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\User;

class RegisterControllerTest extends TestCase
{
    use DatabaseTransactions;

    private static array $validPayload;

    public static function setUpBeforeClass(): void
    {
        self::$validPayload = [
            'name' => 'user',
            'email' => '1231231user@local',
            'password' => 'password',
            'password_confirmation' => 'password',
        ];
    }

    public function test_user_can_register(): void
    {
        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.register'), self::$validPayload)
            ->assertOk();

        $this->assertDatabaseHas('users', ['email' => self::$validPayload['email']]);
    }

    public function test_user_name_validation(): void
    {
        $noNamePayload = self::$validPayload;
        unset($noNamePayload['name']);

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.register'), $noNamePayload)
            ->assertInvalid(['name']);
    }

    public function test_email_validation(): void
    {
        $invalidEmailPayload = self::$validPayload;
        $invalidEmailPayload['email'] = '1';

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.register'), $invalidEmailPayload)
            ->assertInvalid(['email']);
    }

    public function test_password_validation(): void
    {
        $invalidPayload = self::$validPayload;
        unset($invalidPayload['password']);

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.register'), $invalidPayload)
            ->assertInvalid(['password']);
    }

    public function test_password_confirmation_validation(): void
    {
        $invalidPayload = self::$validPayload;
        $invalidPayload['password_confirmation'] = 'password1';

        $this
            ->withoutMiddleware(ValidateCsrfToken::class)
            ->postJson(route('auth.register'), $invalidPayload)
            ->assertInvalid(['password' => __('validation.confirmed', ['attribute' => 'password'])]);
    }
}
