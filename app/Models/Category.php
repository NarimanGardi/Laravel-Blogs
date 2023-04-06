<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\SoftDeletes;
class Category extends Model implements HasMedia
{
    use  HasFactory, InteractsWithMedia , SoftDeletes;

    protected $guarded = [];

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb-200')
              ->width(400)
              ->height(200);

        $this->addMediaConversion('thumb-38')
              ->width(38)
              ->height(38);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('category')
            ->singleFile();
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }
}
