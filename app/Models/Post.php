<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\SoftDeletes;
class Post extends Model implements HasMedia
{
    use  HasFactory, InteractsWithMedia , SoftDeletes;

    protected $guarded = [];

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb-300')
              ->width(300)
              ->height(150);

        $this->addMediaConversion('thumb-38')
              ->width(38)
              ->height(38);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('post')
            ->singleFile();
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }
}
