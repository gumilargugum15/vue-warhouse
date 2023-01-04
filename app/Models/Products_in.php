<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products_in extends Model
{
    use HasFactory;
    protected $fillable = [
        'id','reference_no', 'supplier_id','date_in','qty','description','creator','modifier'
    ];
    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
