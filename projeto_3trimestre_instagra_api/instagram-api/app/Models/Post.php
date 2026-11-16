<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Post extends Model
{

    protected $fillable = ['title', 'text', 'liked'];

    protected $attributes = [
     'liked' => false,
    ];

    protected function casts(): array
    {
        return [
            'liked' => 'boolean',
        ];
    }
}