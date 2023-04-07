@extends('backend.app')
@section('title', __('Manage Categories'))
@section('content')
<div class="page-content">
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0">Manage Categories</h4>
        </div>
        @can('create-category')
        <div class="d-flex align-items-center flex-wrap text-nowrap">
            <a href="{{ route('categories.create') }}" class="btn btn-primary btn-icon-text mb-2 mb-md-0">
                <i class="btn-icon-prepend" data-feather="grid"></i>
                Create New Category
            </a>
        </div>
        @endcan
    </div>
    <div class="row g-4">
        <div class="col-12">
            <div class="card">
                <div class="table-responsive text-nowrap">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Title Ku</th>
                                <th>Title Ar</th>
                                <th>Title En</th>
                                <th>Photo</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                            @forelse ($categories as $category)
                            <tr>
                                <td>{{$category->title_ku}}</td>
                                <td>{{$category->title_ar}}</td>
                                <td>{{$category->title_en}}</td>
                                <td>
                                    <div
                                    data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top"
                                    class="avatar avatar-xs pull-up" title="" data-bs-original-title="{{ $category->title_en }}">
                                        <img src="{{ $category->getFirstMediaUrl('category', 'thumb-38') ?? asset('backend/assets/images/user.png') }}" alt="category" class="rounded-circle" />
                                    </div>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 " data-bs-toggle="dropdown"><i
                                                class="bx bx-dots-vertical-rounded"></i></button>
                                        <div class="dropdown-menu">
                                           @can('edit-category')
                                                <a class="dropdown-item" href="{{ route('categories.edit',$category->id) }}"><i
                                                    class="bx bx-edit-alt me-1"></i> Edit</a>
                                           @endcan
                                           @can('delete-category')
                                                <form action="{{ route('categories.destroy',$category->id) }}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="dropdown-item show_confirm"><i
                                                            class="bx bx-trash me-1"></i> Delete</button>
                                                </form> 
                                           @endcan
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="5" class="text-center">No Categories Found</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="m-3">
                    {{ $categories->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
