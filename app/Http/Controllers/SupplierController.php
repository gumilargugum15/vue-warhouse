<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Supplier;
use App\Models\Products_in;

class SupplierController extends Controller
{
    public function index()
    {
        $supplier = Supplier::latest()->get();
        return view('supplier', compact('supplier'));
    }
    public function getproductin()
    {
        $productsin = Products_in::latest()->get();
    
        //passing posts to view
        // return view('productsin', compact('productsin'));
    }
}
