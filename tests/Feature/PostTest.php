<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class PostTest extends TestCase
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

    public function createPost($user_id,$category_id){
        $post = Post::create(
            [
                'title_en' => $this->faker->name,
                'title_ku' => $this->faker->name,
                'title_ar' => $this->faker->name,
                'content_en' => $this->faker->text,
                'content_ku' => $this->faker->text,
                'content_ar' => $this->faker->text,
                'deleted_at' => null,
                'created_at' => null,
                'updated_at' => null,
                'author_id' => $user_id,
                'category_id' => $category_id,
            ]
        );
        return $post;
    }

    public function test_admin_can_see_all_posts()
    {
        $author = $this->createAuthor();
        $admin = $this->createAdmin();
        $category = $this->createCategory();
        $this->actingAs($admin);
        $post = $this->createPost($author->id,$category->id);
        $response = $this->get(route('posts.index'));
        $response->assertStatus(200);
    }

    public function test_author_can_see_only_his_posts()
    {
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $this->actingAs($author);
        $post = $this->createPost($author->id,$category->id);
        $response = $this->get(route('posts.index'));
        $response->assertStatus(200);
        $response->assertSee($post->title_en);
    }

    public function test_author_cant_see_others_posts()
    {
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $this->actingAs($author);
        $post = $this->createPost($author->id,$category->id);
        $author2 = $this->createAuthor();
        $this->actingAs($author2);
        $response = $this->get(route('posts.index'));
        $response->assertStatus(200);
        $response->assertDontSeeText($post->title_en);
    }

    public function test_admin_can_create_post(){
        $admin = $this->createAdmin();
        $this->actingAs($admin);
        $category = $this->createCategory();
        $post = $this->createPost($admin->id,$category->id);
        $response = $this->post(route('posts.store'),$post->toArray());
        $response->assertStatus(302);
    }

    public function test_author_can_create_post(){
        $author = $this->createAuthor();
        $this->actingAs($author);
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $response = $this->post(route('posts.store'),$post->toArray());
        $response->assertStatus(302);
    }

    public function test_admin_can_update_any_post(){
        $admin = $this->createAdmin();
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $this->actingAs($admin);
        $response = $this->put(route('posts.update',$post->id),$post->toArray());
        $response->assertStatus(302);
    }

    public function test_author_can_update_his_post(){
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $this->actingAs($author);
        $response = $this->put(route('posts.update',$post->id),$post->toArray());
        $response->assertStatus(302);
    }

    public function test_author_cant_update_others_post(){
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $author2 = $this->createAuthor();
        $this->actingAs($author2);
        $response = $this->put(route('posts.update',$post->id),$post->toArray());
        $response->assertStatus(404);
    }

    public function test_admin_can_delete_any_post(){
        $admin = $this->createAdmin();
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $this->actingAs($admin);
        $response = $this->delete(route('posts.destroy',$post->id));
        $response->assertStatus(302);
    }

    public function test_author_can_delete_his_post(){
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $this->actingAs($author);
        $response = $this->delete(route('posts.destroy',$post->id));
        $response->assertStatus(302);
    }

    public function test_author_cant_delete_others_post(){
        $author = $this->createAuthor();
        $category = $this->createCategory();
        $post = $this->createPost($author->id,$category->id);
        $author2 = $this->createAuthor();
        $this->actingAs($author2);
        $response = $this->delete(route('posts.destroy',$post->id));
        $response->assertStatus(404);
    }
}
