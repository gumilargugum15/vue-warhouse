<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Products_in;
use App\Models\Products_in_detail;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use PDF;

class Products_inController extends Controller
{
    public function index(){

    }
    public function getRecords(Request $request)
    {

        $products_in = DB::table('products_ins')
        ->select('products_ins.id','products_ins.date_in','products_ins.reference_no','suppliers.name','products_ins.description','products_ins.created_at')
        ->join('suppliers','suppliers.id','=','products_ins.supplier_id')
        ->get();
        return response()->json([
            'products_in' => $products_in
        ]);
    }
    public function store(Request $request)
    {
        // Begin Transaction
        
            $user = auth('api')->user();
        // return response()->json(
        //     ['data'=>$user]
        // );
        // die();
        //set validation
        $validator = Validator::make($request->all(), [
            'reference_no'   => 'required',
            'supplier_id' => 'required',
            'date_in' => 'required',
        ]);
        
        // response error validation
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        DB::beginTransaction();
        try{
        //save to database
        $data = Products_in::create([
            'reference_no'     => $request->reference_no,
            'supplier_id'   => $request->supplier_id,
            'date_in'   => $request->date_in,
            'description'   => $request->description,
            'creator'   =>$user->id
        ]);
        $lastInsertedId= $data->id;
        $datadetail = $request->detail;
        foreach($datadetail as $row){
            Products_in_detail::create([
                'products_in_id'=>$lastInsertedId,
                'products_id'=>$row['id'],
                'code'=>$row['code'],
                'name'=>$row['name'],
                'qty'=>$row['qty'],
                'creator'   =>$user->id
            ]);

            $product = Product::findOrFail($row['id']);
            $stock = $product->stock+$row['qty'];
            if($product) {
                $product->update([
                    'stock'   => $stock
                ]);
            }
            
        }
        DB::commit();
        //success save to database
        if($data) {
            return response()->json([
                'success' => true,
                'message' => 'Products in Created',
                'data'    => $data,
            ], 201);
            
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Product Failed to Save',
            ], 409);
        }
        
        //failed save to database
        
        }catch(\Exception $e){
            DB::rollback();
            // return redirect()->back()
            // ->with('warning','Something Went Wrong!');
            return response()->json([
                'success' => false,
                'message' => 'Product Failed to Save',
            ], 409);

        }
        

    }
    public function show($id)
    {
        //find post by ID
        // $product = Products_in::findOrfail($id);
        $product = Products_in::where('products_ins.id',$id)->join('suppliers','suppliers.id','=','products_ins.supplier_id')
        ->select('*')->first();
        $detail = Products_in_detail::where('products_in_details.products_in_id',$id)->join('products','products.id','=','products_in_details.products_id')
        ->select('*')->get();
        $arr=[];
        foreach($detail as $row){
            array_push($arr,$row->qty);
        }
        $sum = array_sum($arr);
        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Product',
            'data'    => $product,
            'detail' =>$detail,
            'sum'=>$sum
        ], 200);

    }
    public function update(){

    }
    public function destroy(){

    }
    public function cetakPdf($id){
    $detail = Products_in_detail::where('products_in_details.products_in_id',$id)->join('products','products.id','=','products_in_details.products_id')
    ->select('*')->get();
    $arr=[];
        foreach($detail as $row){
            array_push($arr,$row->qty);
        }
        $sum = array_sum($arr);
	$pdf = PDF::loadview('report_in_pdf',['detail'=>$detail,'sum'=>$sum]);
	return $pdf->download('report-in-pdf');
    }
}
