<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'title_en' => $this->faker->sentence(3),
            'title_ar' => $this->faker->sentence(3),
            'title_ku' => $this->faker->sentence(3),
            'content_en' => $this->faker->sentence(10),
            'content_ar' => $this->faker->sentence(10),
            'content_ku' => $this->faker->sentence(10),
            'category_id' => Category::inRandomOrder()->first()->id,
            'author_id' => User::inRandomOrder()->first()->id,
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function ($post) {
            $imageUrl = 'https://source.unsplash.com/random/1200x630';
            $post->addMediaFromUrl($imageUrl)->toMediaCollection('post');
        });
    }
}
