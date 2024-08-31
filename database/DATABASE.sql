create database gcs1101;

use gcs1101;

create table categories
(
	catID int auto_increment not null primary key,
    catName varchar(100) not null unique,
    catDescriptions varchar(200) null
);
INSERT INTO categories (catDescriptions) VALUES
('Sport Utility Vehicle'),
('Passenger car in a three-box configuration'),
('Motor vehicle designed to transport cargo'),
('Two-door car with a fixed-roof body style'),
( 'Car with a roof structure that can be opened or removed');
-- insert data
insert into categories (catName) 
values ('SUV'), ('Sedan'), ('Truck'), 
       ('Coupe'), ('Convertible');

insert into categories values
('1','SUV','Sport Utility Vehicle'),
('2','Sedan','Passenger car in a three-box configuration'),
('3','Truck','Motor vehicle designed to transport cargo'),
('4','Coupe','Two-door car with a fixed-roof body style'),
('5','Convertible','Car with a roof structure that can be opened or removed');


create table products
(
	productID varchar(10) not null primary key,
    productName varchar(50) not null,
    productPrice decimal(10,2)  not null,
    productDetails varchar(500) null,
    productImage varchar(30) null,
    catID int not null,
    constraint fk_catID foreign key (catID) 
                        references categories(catID)    
);


INSERT INTO sales  VALUES
( 'tampm@example.com', '2023-06-15', 34000.00);





select * from categories;

	insert into products values 
	('PC001', 'Toyota Highlander', 35000.00, 'A reliable and spacious SUV.', 'highlander.jpg',3),
	('PC002', 'Honda Accord', 25000.00, 'A popular mid-sized sedan.', 'accord.jpg',3),
	('PC003', 'Ford F-150', 30000.00, 'A powerful and durable truck.', 'f150.jpg', 3),
	('PC004', 'Chevrolet Camaro', 27000.00, 'A stylish and fast coupe.', 'camaro.jpg',4),
	('PC005', 'Mazda MX-5 Miata', 28000.00, 'A fun and agile convertible.', 'miata.jpg',4),
	('PC006', 'Honda CR-V', 32000.00, 'A compact SUV with great fuel efficiency.', 'crv.jpg',4),
	('PC007', 'Toyota Camry', 24000.00, 'A dependable and comfortable sedan.', 'camry.jpg',4),
	('PC008', 'Ram 1500', 35000.00, 'A versatile and capable truck.', 'ram1500.jpg',2),
	('PC009', 'Ford Mustang', 28000.00, 'A legendary American sports car.', 'mustang.jpg',2),
	('PC0010', 'BMW Z4', 50000.00, 'A luxury convertible with high performance.', 'z4.jpg',2),
	('PC0011', 'Jeep Wrangler', 40000.00, 'An off-road SUV with rugged capabilities.', 'wrangler.jpg',2),
	('PC0012', 'Nissan Altima', 23000.00, 'A stylish and efficient sedan.', 'altima.jpg',1),
	('PC0013', 'Chevrolet Silverado', 33000.00, 'A reliable and powerful truck.', 'silverado.jpg',1),
	('PC0014', 'Audi TT', 45000.00, 'A sleek and sporty coupe.', 'tt.jpg',1),
	('PC0015', 'Mercedes-Benz SLC', 60000.00, 'A luxurious convertible with a retractable hardtop.', 'slc.jpg',1),
	('PC0016', 'Subaru Outback', 34000.00, 'A versatile and durable SUV.', 'outback.jpg',3),
	('PC0017', 'Hyundai Sonata', 22000.00, 'An affordable and feature-packed sedan.', 'sonata.jpg',3),
	('PC0018', 'GMC Sierra', 36000.00, 'A robust truck with excellent towing capacity.', 'sierra.jpg',3),
	('PC0019', 'Lexus RC', 42000.00, 'A luxury coupe with impressive performance.', 'rc.jpg',3),
	('PC0020', 'Porsche 911', 90000.00, 'An iconic sports car with top-notch engineering.', '911.jpg',3);



select * from products;

create table `admins`
(
	adminID varchar(15) not null primary key,
    adminPass varchar(20) not null,
    adminPhoto varchar(50) null,
    adminFullname varchar(50) not null,
    adminAddress varchar(50) null
);

insert into admins values 
('Yudk3', '123456', 'ngoctrinh.jpg', 'Ngoc Trinh', 'No address'),
('admin02', '123456', 'thuytien.jpg', 'Thuy Tien', 'No address'), 
('admin03', '123456', 'messi.jpg', 'Leo Messi', 'No address');

select * from admins;

create table customers
(
	customerEmail varchar(30) not null primary key,
    customerPass varchar(200) not null,
    customerName varchar(50) not null,
    customerAddress varchar(50) null,
    customerPhone varchar(12) null,
    customerPhoto varchar(30) null
);
INSERT INTO customers (customerEmail, customerPass, customerName, customerAddress, customerPhone, customerPhoto)
VALUES ('tampm1@example.com', 'password123', 'TamPM', '123 Main St', '1234567890', 'photo.jpg');
-- ALTER TABLE admins MODIFY adminPass VARCHAR(255) NOT NULL;

-- Tạo bảng users với các trường cần thiết
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NULL,
    phone VARCHAR(15) NULL,
    photo VARCHAR(50) NULL,
    role ENUM('admin', 'customer') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- -- Mã hóa mật khẩu trước khi lưu vào database
UPDATE admins SET adminPass = '123456' WHERE adminID = 'Yudk3';
 UPDATE admins SET adminPass = '123456' WHERE adminID = 'admin02';
UPDATE admins SET adminPass = '123456' WHERE adminID = 'admin03';
ALTER TABLE customers MODIFY customerPass VARCHAR(255) NOT NULL;

-- -- Mã hóa mật khẩu trước khi lưu vào database
 UPDATE customers SET customerPass = '123456' WHERE customerEmail = 'tampm@example.com';



SELECT * FROM categories;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM sales;
SELECT * FROM admins;

Duy Lê
use gcs11011;
-- Tạo bảng users với các trường cần thiết
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NULL,
    phone VARCHAR(15) NULL,
    photo VARCHAR(50) NULL,
    role ENUM('admin', 'customer') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Chuyển dữ liệu từ bảng admins sang bảng users
INSERT INTO users (email, password, name, address, photo, role)
SELECT adminID, adminPass, adminFullname, adminAddress, adminPhoto, 'admin' FROM admins;

-- Chuyển dữ liệu từ bảng customers sang bảng users
INSERT INTO users (email, password, name, address, phone, photo, role)
SELECT customerEmail, customerPass, customerName, customerAddress, customerPhone, customerPhoto, 'customer' FROM customers;

-- Xóa bảng admins và customers nếu không cần thiết
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS customers;

-- Tạo lại bảng sales để tham chiếu đến bảng users
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    user_id INT,
    sale_date DATE,
    price DECIMAL(10, 2),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id) REFERENCES users(id)
)