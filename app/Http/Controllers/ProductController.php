<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\Admin;
class ProductController extends Controller
{
    public function index()
    {
        $data = Product::get();
        return view('product-list', compact('data'));
    }

    public function add()
    {
        $cat = Category::get();
        return view('product-add', compact('cat'));
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
        return view('product-edit', compact('pro', 'cat'));
    }

    public function update(Request $request)
    {
        $img = $request->new_image == "" ? $request->old_image : $request->new_image;
        Product::where('productID', '=', $request->id)->update([
            'productName'=> $request->name,
            'productPrice'=> $request->price,
            'productImage'=> $img,
            'productDetails'=> $request->details,
            'catID'=> $request->category
        ]);
        return redirect()->back()->with('success', 'Product updated successfully!');
    }

    public function delete($id)
    {
        Product::where('productID', '=', $id)->delete();
        return redirect()->back()->with('success', 'Product deleted successfully!');
    }
    // public function Login(Request $request)
    // {
    //     return view('Login');
    // }
}
