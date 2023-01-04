<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products_in_detail extends Model
{
    use HasFactory;
    protected $fillable = [
        'id','products_in_id', 'products_id','code','name','qty','creator','modifier'
    ];
}
