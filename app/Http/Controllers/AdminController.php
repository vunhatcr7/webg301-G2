<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class AdminController extends Controller
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
    public function edit($id)
    {
        $cat = Category::get();
        $pro = Product::where('productID', '=', $id)->first();
        return view('product-edit', compact('pro', 'cat'));
    }
    public function delete($id)
    {
        Product::where('productID', '=', $id)->delete();
        return redirect()->back()->with('success', 'Product deleted successfully!');
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
    public function add()
    {
        $cat = Category::get();
        return view('product-add', compact('cat'));
    }
public function Login(Request $request)
{
    return view('admin.login-admin');
}
public function handleLogin(Request $request)
{
    $username = $request->input('username');
    $password = $request->input('password');

    // Kiểm tra username và password
    if ($username === 'admin' && $password === 'admin123') {
        // Đăng nhập thành công
        return redirect('admin/index')->with('success', 'Logged in successfully!');
    } else {
        // Đăng nhập thất bại
        return redirect()->back()->with('error', 'Invalid username or password!');
    }
}

}
