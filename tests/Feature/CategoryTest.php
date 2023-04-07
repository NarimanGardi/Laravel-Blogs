<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Tests\TestCase;

class CategoryTest extends TestCase
{
    use  WithFaker;
    public function createAdmin(){
        $admin = User::factory()->create([
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'password' => bcrypt('password'),
        ]);
        $admin->assignRole('Admin');
        return $admin;
    }

    public function createAuthor(){
        $author = User::factory()->create([
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'password' => bcrypt('password'),
        ]);
        $author->assignRole('Author');
        return $author;
    }

    public function createCategory(){
        $category = Category::create(
            [
                'title_en' => $this->faker->name,
                'title_ku' => $this->faker->name,
                'title_ar' => $this->faker->name,
                'deleted_at' => null,
                'created_at' => null,
                'updated_at' => null,
            ]
        );
        return $category;
    }

    public function test_admin_can_see_categories()
    {
        $admin = $this->createAdmin();
        $this->actingAs($admin);
        $response = $this->get(route('categories.index'));
        $response->assertStatus(200);
    }

    public function test_author_cant_see_categories()
    {
        $author = $this->createAuthor();
        $this->actingAs($author);
        $response = $this->get(route('categories.index'));
        $response->assertStatus(404);
    }

    public function test_admin_can_create_category()
    {
        $admin = $this->createAdmin();
        $this->actingAs($admin);
        $category = $this->createCategory();
        $response = $this->post(route('categories.store'), [
            'title_en' => $category->title_en,
            'title_ku' => $category->title_ku,
            'title_ar' => $category->title_ar,
        ]);
        $response->assertStatus(302);
        $this->assertDatabaseHas('categories', $category->toArray());
    }

    public function test_admin_can_update_category()
    {
        $admin = $this->createAdmin();
        $this->actingAs($admin);
        $category = $this->createCategory();
        $response = $this->put(route('categories.update', $category->id), $category->toArray());
        $response->assertStatus(302);
        $this->assertDatabaseHas('categories', $category->toArray());
    }

    public function test_admin_can_delete_category(){
        $admin = $this->createAdmin();
        $this->actingAs($admin);
        $category = $this->createCategory();
        $response = $this->delete(route('categories.destroy', $category->id));
        $this->assertDatabaseMissing('categories', $category->toArray());
    }

    public function test_author_cant_delete_category(){
        $author = $this->createAuthor();
        $this->actingAs($author);
        $category = $this->createCategory();
        $response = $this->delete(route('categories.destroy', $category->id));
        $response->assertStatus(404);
        $this->assertDatabaseHas('categories', $category->toArray());
    }
}
