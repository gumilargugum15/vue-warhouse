<?php

namespace App\Http\Controllers;

use LaravelVueGoodTable\InteractsWithVueGoodTable;
use LaravelVueGoodTable\Columns\Column;
use LaravelVueGoodTable\Columns\Number;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    use InteractsWithVueGoodTable;
    public function index()
    {
        // return response()->json(Product::get());
        $product = Product::latest()->get();
        
        //make response JSON
        return response()->json([
            'success' => true,
            'message' => '',
            'data'    => $product  
        ], 200);
    }
    protected function getQuery(Request $request)
    {
        return Product::query();
    }

    protected function getColumns(): array
    {
        return [
            Number::make('id')
                ->sortable(),
            // Text::make('name')
            // ->searchable(),   
            Number::make('price')
                ->searchable()
        ];
    }
    public function getRecords(Request $request)
    {

        $search_query = $request->searchTerm;
        $products = Product::latest()->get();//Product::where('name', 'LIKE', '%' . $search_query . '%')->latest()
           // ->get();
        // if ($search_query) {
        //     $products['searchTerm'] = $search_query ?: '';
        // } else {
        //     $products['searchTerm'] = $search_query ? null : '';
        // }

        return response()->json([
            'products' => $products
        ]);
    }
    public function store(Request $request)
    {
        //set validation
        $validator = Validator::make($request->all(), [
            'code'   => 'required',
            'name' => 'required',
            'price' => 'required',
            'stock' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);
        
        // response error validation
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $name='';
        if($request->file('image')){
            $name = time()."-".$request->file('image')->getClientOriginalName();
            $request->file('image')->move(public_path('images'), $name);
        }
        
        //save to database
        $data = Product::create([
            'code'     => $request->code,
            'name'   => $request->name,
            'price'   => $request->price,
            'content'   => $request->content,
            'stock'   => $request->stock,
            'image' => $name
        ]);

        //success save to database
        if($data) {

            return response()->json([
                'success' => true,
                'message' => 'Product Created',
                'data'    => $data  
            ], 201);

        } 

        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Product Failed to Save',
        ], 409);

    }
    public function show($id)
    {
        //find post by ID
        $product = Product::findOrfail($id);

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Product',
            'data'    => $product 
        ], 200);

    }
    public function update(Request $request, Product $product)
    {
        //set validation
        $validator = Validator::make($request->all(), [
            'code'   => 'required',
            'name' => 'required',
            'price' => 'required',
            'stock' => 'required',
        ]);
        
        //response error validation
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        //find post by ID
        $product = Product::findOrFail($product->id);

        if($product) {

            //update post
            $product->update([
                'code'     => $request->code,
                'name'   => $request->name,
                'price'   => $request->price,
                'content'   => $request->content,
                'stock'   => $request->stock
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Product Updated',
                'data'    => $product  
            ], 200);

        }

        //data post not found
        return response()->json([
            'success' => false,
            'message' => 'Product Not Found',
        ], 404);

    }
    public function destroy($id)
    {
        //find post by ID
        $product = Product::findOrfail($id);

        if($product) {

            //delete post
            $product->delete();

            return response()->json([
                'success' => true,
                'message' => 'Product Deleted',
            ], 200);

        }

        //data post not found
        return response()->json([
            'success' => false,
            'message' => 'Product Not Found',
        ], 404);
    }
}
