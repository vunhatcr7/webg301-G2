CREATE DATABASE gcs11011;
USE gcs11011;

CREATE TABLE categories (
    catID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    catName VARCHAR(100) NOT NULL UNIQUE,
    catDescriptions VARCHAR(200) NULL
);

INSERT INTO categories (catName, catDescriptions) VALUES
('SUV', 'Sport Utility Vehicle'),
('Sedan', 'Passenger car in a three-box configuration'),
('Truck', 'Motor vehicle designed to transport cargo'),
('Coupe', 'Two-door car with a fixed-roof body style'),
('Convertible', 'Car with a roof structure that can be opened or removed');

CREATE TABLE products (
    productID VARCHAR(10) NOT NULL PRIMARY KEY,
    productName VARCHAR(50) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productDetails VARCHAR(500) NULL,
    productImage VARCHAR(30) NULL,
    catID INT NOT NULL,
    CONSTRAINT fk_catID FOREIGN KEY (catID) 
    REFERENCES categories(catID)
);


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
    
    CREATE TABLE admins (
    adminID VARCHAR(15) NOT NULL PRIMARY KEY,
    adminPass VARCHAR(255) NOT NULL,
    adminPhoto VARCHAR(50) NULL,
    adminFullname VARCHAR(50) NOT NULL,
    adminAddress VARCHAR(50) NULL
);

INSERT INTO admins (adminID, adminPass, adminPhoto, adminFullname, adminAddress) VALUES 
('Yudk3', '123456', 'ngoctrinh.jpg', 'Ngoc Trinh', 'No address'),
('admin02', '123456', 'thuytien.jpg', 'Thuy Tien', 'No address'),
('admin03', '123456', 'messi.jpg', 'Leo Messi', 'No address');


CREATE TABLE customers (
    customerEmail VARCHAR(30) NOT NULL PRIMARY KEY,
    customerPass VARCHAR(255) NOT NULL,
    customerName VARCHAR(50) NOT NULL,
    customerAddress VARCHAR(50) NULL,
    customerPhone VARCHAR(12) NULL,
    customerPhoto VARCHAR(30) NULL
);

INSERT INTO customers (customerEmail, customerPass, customerName, customerAddress, customerPhone, customerPhoto) VALUES
('tampm1@example.com', '123456', 'TamPM', '123 Main St', '1234567890', 'photo.jpg');

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

-- Migrate data from admins to users
INSERT INTO users (email, password, name, address, photo, role)
SELECT adminID, adminPass, adminFullname, adminAddress, adminPhoto, 'admin' FROM admins;

-- Migrate data from customers to users
INSERT INTO users (email, password, name, address, phone, photo, role)
SELECT customerEmail, customerPass, customerName, customerAddress, customerPhone, customerPhoto, 'customer' FROM customers;

-- Drop old tables
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS customers;

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    car_id VARCHAR(10),
    user_id INT,
    sale_date DATE,
    price DECIMAL(10, 2),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);

SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM users;
SELECT * FROM sales;
SELECT * FROM admins;