<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class CategoryFactory extends Factory
{
    
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'title_en' => $this->faker->word,
            'title_ar' => $this->faker->word,
            'title_ku' => $this->faker->word,
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function ($category) {
            $imageUrl = 'https://source.unsplash.com/random/400x200';
            $category->addMediaFromUrl($imageUrl)->toMediaCollection('category');
        });
    }
}
