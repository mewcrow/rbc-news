<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::insert([
            'name' => 'Admin',
            'email' => 'admin@local',
            'password' => Hash::make('qwerty123'),
            'role' => 'admin',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'role' => 'regular',
        ]);
    }
}
