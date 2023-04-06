@extends('backend.app')
@section('title', __('Edit Category'))
@section('content')
<div class="page-content">
    <h4 class="fw-bold py-3 mb-4">Update Category</h4>
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <!-- Account -->
                <div class="card-body">
                    <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img src="{{ 
                            $category->getFirstMediaUrl('category', 'thumb-200')
                            }}" alt="category-image" class="d-block rounded"
                            height="100" width="100" id="uploadedAvatar" />
                    </div>
                </div>
                <hr class="my-0" />
                <div class="card-body">
                    <x-auth-validation-errors class="mb-4" :errors="$errors" />
                    <form method="POST" action="{{ route('categories.update',$category->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="mb-3 col-md-8">
                                <label class="form-label">Title Ku</label>
                                <input class="form-control" type="text" name="title_ku" autofocus
                                    value="{{ $category->title_ku }}" />
                            </div>

                            <div class="mb-3 col-md-8">
                                <label class="form-label">Title Ar</label>
                                <input class="form-control" type="text" name="title_ar" autofocus
                                    value="{{ $category->title_ar}}" />
                            </div>

                            <div class="mb-3 col-md-8">
                                <label class="form-label">Title En</label>
                                <input class="form-control" type="text"  name="title_en"
                                    value="{{ $category->title_en }}">
                            </div>

                            <div class="mb-3 col-md-8">
                                <label class="form-label">Image</label>
                                <input class="form-control" type="file" name="image">
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
