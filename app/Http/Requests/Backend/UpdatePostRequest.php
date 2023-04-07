<?php

namespace App\Http\Requests\Backend;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePostRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'title_en' => 'required|string|max:100',
            'title_ar' => 'required|string|max:100',
            'title_ku' => 'required|string|max:100',
            'category_id' => 'required|integer|exists:categories,id',
            'content_en' => 'required|string|max:255',
            'content_ar' => 'required|string|max:255',
            'content_ku' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:5120',
        ];
    }
}
