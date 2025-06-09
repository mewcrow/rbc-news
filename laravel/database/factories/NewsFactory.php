<?php

namespace Database\Factories;

use App\Models\PageLink;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\PageLink>
 */
class NewsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'page_link_id' => PageLink::factory(),
            'title' => fake()->sentence(),
            'image' => fake()->url(),
            'text' => fake()->paragraph(),
        ];
    }
}
