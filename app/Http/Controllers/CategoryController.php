<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
     public function index()
     {
         return view('admin.index');
     }

     public function productList()
     {
        $data = Product::get();
         return view('admin.product-list', compact('data'));
     }


     public function productAdd()
     {
         return view('admin.product-add');
     }

     public function productEdit()
     {
         return view('admin.product-edit');
    }
     public function productUpdate(Request $request)
     {
         $Validate = $this->validate($request, [
             'productID' => 'id',
             'productName'=> 'required|string',
             'productPrice'=> 'required|string',
             'productDetails' => 'required|string',
             'productImage' => 'required',
             'catID' => 'required|id',
         ]);

         $product = Product::create([
             'productID' => $request->product_id,
             'productName'=> $request->product_name,
         ]);
     }
     public function save(Request $request)
     {
         $pro = new Product();
         $pro->productID = $request->id;
         $pro->productName = $request->name;
         $pro->productPrice = $request->price;
         $pro->productImage = $request->image;
         $pro->productDetails = $request->details;
         $pro->catID = $request->category;
         $pro->save();
         return redirect()->back()->with('success', 'Product added successfully!');
     }
     public function edit($id)
     {
         $cat = Category::get();
         $pro = Product::where('productID', '=', $id)->first();
         return view('admin/product-edit', compact('pro', 'cat'));
     }

     public function delete($id)
     {
         Product::where('productID', '=', $id)->delete();
         return redirect()->back()->with('success', 'Product deleted successfully!');
     }

}
