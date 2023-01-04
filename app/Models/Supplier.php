<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;
    protected $fillable = [
        'id','code', 'name','address','phone','creator','modifier'
    ];

    public function productins()
    {
        return $this->hasMany(Products_in::class);
    }
}
