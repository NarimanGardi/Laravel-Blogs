@extends('backend.app')
@section('title', __('Create Category'))
@section('content')
<!-- Content wrapper -->
<div class="page-content">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Create New Category</span></h4>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">

                    <div class="card-body">
                        <x-auth-validation-errors class="mb-4" :errors="$errors" />
                        <form method="POST" action="{{ route('categories.store') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="mb-3 col-md-8">
                                    <label class="form-label">Title Ku</label>
                                    <input class="form-control" type="text" name="title_ku" autofocus
                                        value="{{ old('title_ku') }}" />
                                </div>

                                <div class="mb-3 col-md-8">
                                    <label class="form-label">Title Ar</label>
                                    <input class="form-control" type="text" name="title_ar" autofocus
                                        value="{{ old('title_ar') }}" />
                                </div>

                                <div class="mb-3 col-md-8">
                                    <label class="form-label">Title En</label>
                                    <input class="form-control" type="text"  name="title_en"
                                        value="{{ old('title_en') }}">
                                </div>

                                <div class="mb-3 col-md-8">
                                    <label class="form-label">Image</label>
                                    <input class="form-control" type="file" name="image">
                                </div>
                            </div>
                            <div class="mt-2">
                                <button type="submit" class="btn btn-primary me-2">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / Content -->


    <div class="content-backdrop fade"></div>
</div>
<!-- Content wrapper -->
@endsection
