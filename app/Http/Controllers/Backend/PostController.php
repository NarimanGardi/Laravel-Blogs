<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\StorePostRequest;
use App\Http\Requests\Backend\UpdatePostRequest;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(auth()->user()->hasRole('Admin')){
            $posts = Post::with('category','author')->latest()->paginate(10);
        }
        else{
            $posts = Post::with('category','author')->where('author_id', auth()->user()->id)->latest()->paginate(10);
        }
        return view('backend.pages.posts.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all('id','title_en');
        return view('backend.pages.posts.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePostRequest $request)
    {
        $request->merge(['author_id' => auth()->user()->id]);
        $post = Post::create($request->only('title_en', 'title_ar', 'title_ku', 
        'category_id', 'content_en', 'content_ar', 'content_ku', 'author_id'));
        $post->addMedia($request->image)->toMediaCollection('post');
        toast()->success('Successed','Post Added Successfully');
        return redirect()->route('posts.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        $categories = Category::all('id','title_en');
        return view('backend.pages.posts.edit', compact('post','categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePostRequest $request, Post $post)
    {
        $post->update($request->only('title_en', 'title_ar', 'title_ku', 
        'category_id', 'content_en', 'content_ar', 'content_ku'));
        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $post->clearMediaCollection('post');
            $post->addMedia($request->image)->toMediaCollection('post');
        }
        toast()->success('Successed','Post Updated Successfully');
        return redirect()->route('posts.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        $post->delete();
        toast()->success('Successed','Post Deleted Successfully');
        return redirect()->route('posts.index');
    }
}
