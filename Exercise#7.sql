-- Clean up any existing tables
IF OBJECT_ID('order_items', 'U') IS NOT NULL DROP TABLE order_items;
IF OBJECT_ID('orders', 'U') IS NOT NULL DROP TABLE orders;
IF OBJECT_ID('products', 'U') IS NOT NULL DROP TABLE products;
IF OBJECT_ID('categories', 'U') IS NOT NULL DROP TABLE categories;
IF OBJECT_ID('customers', 'U') IS NOT NULL DROP TABLE customers;
IF OBJECT_ID('channels', 'U') IS NOT NULL DROP TABLE channels;

-- Create channels table
CREATE TABLE channels (
    id INT PRIMARY KEY,
    channel_name VARCHAR(100)
);

-- Create customers table with ALL 15 columns
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100),
    full_name VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(100),
    region VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(50),
    registration_date DATE,
    channel_id INT,
    first_order_id INT,
    first_order_date DATE,
    last_order_id INT,
    last_order_date DATE,
    FOREIGN KEY (channel_id) REFERENCES channels(id)
);

-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100),
    description VARCHAR(MAX)
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    unit_price DECIMAL(10,2),
    discontinued BIT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create orders table with ALL columns
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    ship_name VARCHAR(100),
    ship_address VARCHAR(200),
    ship_city VARCHAR(100),
    ship_region VARCHAR(100),
    ship_postalcode VARCHAR(20),
    ship_country VARCHAR(100),
    shipped_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    unit_price DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert channels
INSERT INTO channels (id, channel_name) VALUES
(1, 'Google Ads'), (2, 'Facebook'), (3, 'Instagram'), (4, 'Email Newsletter'), (5, 'Referral');

-- Insert customers with all 15 columns
INSERT INTO customers (customer_id, email, full_name, address, city, region, postal_code, country, phone, registration_date, channel_id) VALUES
(1, 'maria.anders@email.com', 'Maria Anders', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '2023-01-15', 1),
(2, 'ana.trujillo@email.com', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '2023-02-20', 2),
(3, 'antonio.moreno@email.com', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', '2023-03-10', 3),
(4, 'thomas.hardy@email.com', 'Thomas Hardy', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '2023-01-25', 4),
(5, 'christina.berglund@email.com', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '2023-04-05', 5);

-- Insert categories
INSERT INTO categories (category_id, category_name, description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
(6, 'Meat/Poultry', 'Prepared meats'),
(7, 'Produce', 'Dried fruit and bean curd'),
(8, 'Seafood', 'Seaweed and fish');

-- Insert products
INSERT INTO products (product_id, product_name, category_id, unit_price, discontinued) VALUES
(1, 'Chai', 1, 18.00, 0),
(2, 'Chang', 1, 19.00, 0),
(3, 'Aniseed Syrup', 2, 10.00, 0),
(4, 'Chef Anton''s Cajun Seasoning', 2, 22.00, 0),
(5, 'Grandma''s Boysenberry Spread', 2, 25.00, 0),
(6, 'Uncle Bob''s Organic Dried Pears', 7, 30.00, 0),
(7, 'Northwoods Cranberry Sauce', 2, 40.00, 0),
(8, 'Mishi Kobe Niku', 6, 97.00, 0),
(9, 'Ikura', 8, 31.00, 0),
(10, 'Queso Cabrales', 4, 21.00, 0);

-- Insert orders with all columns
INSERT INTO orders (order_id, customer_id, order_date, total_amount, ship_name, ship_address, ship_city, ship_region, ship_postalcode, ship_country, shipped_date) VALUES
(101, 1, '2024-01-10', 150.00, 'Maria Anders', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '2024-01-12'),
(102, 1, '2024-02-15', 225.50, 'Maria Anders', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '2024-02-17'),
(103, 1, '2024-03-20', 180.75, 'Maria Anders', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '2024-03-22'),
(104, 2, '2024-01-12', 95.00, 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '2024-01-14'),
(105, 2, '2024-02-18', 310.25, 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '2024-02-20'),
(106, 3, '2024-01-20', 75.50, 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico', '2024-01-22'),
(107, 4, '2024-01-05', 420.00, 'Thomas Hardy', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '2024-01-07'),
(108, 4, '2024-02-10', 185.75, 'Thomas Hardy', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '2024-02-12'),
(109, 4, '2024-03-15', 275.30, 'Thomas Hardy', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '2024-03-17'),
(110, 5, '2024-04-01', 150.00, 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden', '2024-04-03');

-- Insert order_items
INSERT INTO order_items (order_id, product_id, unit_price, quantity, discount) VALUES
(101, 1, 18.00, 5, 0.00),
(101, 3, 10.00, 3, 0.10),
(102, 2, 19.00, 8, 0.15),
(102, 4, 22.00, 4, 0.00),
(103, 1, 18.00, 6, 0.00),
(103, 5, 25.00, 3, 0.20),
(104, 3, 10.00, 5, 0.00),
(104, 7, 40.00, 1, 0.10),
(105, 8, 97.00, 2, 0.25),
(105, 2, 19.00, 4, 0.00),
(106, 1, 18.00, 3, 0.00),
(106, 10, 21.00, 1, 0.00),
(107, 8, 97.00, 3, 0.30),
(107, 9, 31.00, 4, 0.00),
(108, 4, 22.00, 5, 0.10),
(108, 5, 25.00, 3, 0.00),
(109, 2, 19.00, 8, 0.20),
(109, 7, 40.00, 2, 0.00),
(110, 1, 18.00, 6, 0.00),
(110, 3, 10.00, 3, 0.00);

-- Update customer first/last order information
UPDATE customers 
SET first_order_id = first_orders.first_order_id,
    first_order_date = first_orders.first_order_date,
    last_order_id = last_orders.last_order_id,
    last_order_date = last_orders.last_order_date
FROM (
    SELECT customer_id, MIN(order_id) as first_order_id, MIN(order_date) as first_order_date
    FROM orders GROUP BY customer_id
) first_orders,
(
    SELECT customer_id, MAX(order_id) as last_order_id, MAX(order_date) as last_order_date
    FROM orders GROUP BY customer_id
) last_orders
WHERE customers.customer_id = first_orders.customer_id 
AND customers.customer_id = last_orders.customer_id;



--Exercise#7

SELECT TOP 3
    order_id,
    total_amount,
    order_date
FROM orders
ORDER BY total_amount DESC, order_date ASC;
