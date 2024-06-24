
@extends('error')

@section('title', __('Forbidden'))
@section('code', '403')
@section('message', __($exception->getMessage() ?: 'Forbidden'))
@section('description', __('Sorry, you are not authorized to access this page.'))