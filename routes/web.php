<?php

use App\Http\Controllers\CustomerController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('product-list', [ProductController::class, 'index']);
Route::get('product-add', [ProductController::class, 'add']);
Route::post('product-save', [ProductController::class, 'save']);
Route::get('product-edit/{id}', [ProductController::class, 'edit']);
Route::post('product-update', [ProductController::class, 'update']);
Route::get('product-delete/{id}', [ProductController::class, 'delete']);


Route::get('customer/index', [ProductController::class, 'index']);
Route::get('customer/login', [CustomerController::class, 'login']);

// admin page
Route::get('admin/index', [AdminController::class, 'index']);
Route::get('admin/product-list', [AdminController::class, 'productList']);
Route::get('admin/product-add', [AdminController::class, 'productAdd']);
Route::get('admin/product-delete/{id}', [AdminController::class, 'delete']);
Route::get('admin/product-edit/{id}', [AdminController::class, 'Edit']);
// Route::get('admin/login', [AdminController::class, 'login'])->name('admin.login');
// Route::post('admin/handle-login', [AdminController::class, 'handleLogin'])->name('admin.handle-login');
// Route::get('Login', [ProductController::class, 'Login']);
Route::get('login-admin', [AdminController::class, 'Login']);
Route::post('product-save', [AdminController::class, 'save']);
// Route::get('product-list', [CategoryController::class, 'index']);
// Route::get('product-add', [CategoryController::class, 'add']);
// Route::get('Login-customer', [CustomerController::class, 'Login']);
Route::get('admin/login-admin', [AdminController::class, 'Login']);
Route::get('admin/product-add', [AdminController::class, 'add']);
//login
// Route::get('login-admin', [AdminController::class, 'Login']);
// Route::post('login-admin', [AdminController::class, 'handleLogin']); // Thêm route cho việc xử lý đăng nhập
//login
Route::get('login-admin', [AdminController::class, 'Login']);
Route::post('login-admin', [AdminController::class, 'handleLogin']); // Thêm route cho việc xử lý đăng nhập
Route::get('login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('login', [AuthController::class, 'login'])->name('login.submit');
Route::get('register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('register', [AuthController::class, 'register'])->name('register.submit');
Route::post('logout', [AuthController::class, 'logout'])->name('logout');


Route::get('admin/category-list', [CategoryController::class, 'categoryList']);
