@extends('backend.app')
@section('title', __('Edit Post'))
@section('content')
<div class="page-content">
    <h4 class="fw-bold py-3 mb-4">Update Post</h4>
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <!-- Account -->
                <div class="card-body">
                    <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img src="{{ 
                            $post->getFirstMediaUrl('post','thumb-300')
                            }}" alt="category-image" class="d-block rounded"
                            height="150" width="300" id="uploadedAvatar" />
                    </div>
                </div>
                <hr class="my-0" />
                <div class="card-body">
                    <x-auth-validation-errors class="mb-4" :errors="$errors" />
                    <form method="POST" action="{{ route('posts.update',$post->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="mb-3 col-md-6">
                                <label class="form-label">Category</label>
                                <select class="form-control" name="category_id" >
                                    <option value="">Select Category</option>
                                    @foreach ($categories as $category)
                                    <option {{ $post->category_id == $category->id ? 'selected' : '' }} value="{{ $category->id }}">{{ $category->title_en }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="mb-3 col-md-6">
                                <label class="form-label">Image</label>
                                <input class="form-control" type="file" name="image">
                            </div>
                        </div>
                        <div class="row">

                            <div class="mb-3 col-md-4">
                                <label class="form-label">Title Ku</label>
                                <input class="form-control" type="text" name="title_ku" autofocus
                                    value="{{ $post->title_ku }}" />
                            </div>

                            <div class="mb-3 col-md-4">
                                <label class="form-label">Title Ar</label>
                                <input class="form-control" type="text" name="title_ar" autofocus
                                    value="{{ $post->title_ar }}" />
                            </div>

                            <div class="mb-3 col-md-4">
                                <label class="form-label">Title En</label>
                                <input class="form-control" type="text"  name="title_en"
                                    value="{{ $post->title_en }}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-md-4">
                                <label class="form-label">Content Ku</label>
                                <textarea class="form-control" name="content_ku" cols="30"
                                    rows="10">{{ $post->content_ku }}</textarea>
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label">Content Ar</label>
                                <textarea class="form-control" name="content_ar" cols="30"
                                    rows="10">{{ $post->content_ar }}</textarea>
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label">Content En</label>
                                <textarea class="form-control" name="content_en" cols="30"
                                    rows="10">{{ $post->content_en }}</textarea>
                            </div>
                        </div>
                        <div class="mt-2">
                            <button type="submit" class="btn btn-primary me-2">Save changes</button>
                        </div>
                    </form>
                </div>
                <!-- /Account -->
            </div>
        </div>
    </div>
</div>
<!-- / Content -->


<div class="content-backdrop fade"></div>
@endsection
