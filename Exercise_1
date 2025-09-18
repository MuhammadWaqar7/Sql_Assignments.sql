CREATE DATABASE clothing_store;
USE clothing_store;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    favorite_color VARCHAR(30) NOT NULL,
    email VARCHAR(100)
);

-- Create clothing_items table
CREATE TABLE clothing_items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    color VARCHAR(30) NOT NULL,
    price DECIMAL(10, 2),
    category VARCHAR(50)
);
-- Create sales table (junction table)
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    item_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (item_id) REFERENCES clothing_items(item_id)
);
-- Insert customers
INSERT INTO customers (customer_id, first_name, last_name, favorite_color, email) VALUES
(1, 'John', 'Doe', 'Blue', 'john.doe@email.com'),
(2, 'Jane', 'Smith', 'Red', 'jane.smith@email.com'),
(3, 'Bob', 'Johnson', 'Green', 'bob.johnson@email.com'),
(4, 'Alice', 'Brown', 'Blue', 'alice.brown@email.com'),
(5, 'Charlie', 'Wilson', 'Black', 'charlie.wilson@email.com');

-- Insert clothing items
INSERT INTO clothing_items (item_id, item_name, color, price, category) VALUES
(101, 'Cotton T-Shirt', 'Blue', 19.99, 'Tops'),
(102, 'Denim Jeans', 'Blue', 49.99, 'Bottoms'),
(103, 'Summer Dress', 'Red', 59.99, 'Dresses'),
(104, 'Leather Jacket', 'Black', 129.99, 'Outerwear'),
(105, 'Sports Shorts', 'Green', 29.99, 'Sportswear'),
(106, 'Wool Sweater', 'Red', 79.99, 'Tops'),
(107, 'Silk Scarf', 'Blue', 24.99, 'Accessories');

-- Insert sales records
INSERT INTO sales (sale_id, customer_id, item_id, sale_date, quantity) VALUES
(1001, 1, 101, '2024-01-15', 2),
(1002, 1, 102, '2024-01-20', 1),
(1003, 2, 103, '2024-02-10', 1),
(1004, 2, 106, '2024-02-12', 1),
(1005, 3, 105, '2024-02-15', 1),
(1006, 4, 101, '2024-02-18', 1),
(1007, 4, 107, '2024-02-20', 1),
(1008, 5, 104, '2024-02-25', 1);

SELECT
    ci.item_name AS clothes,
    ci.color AS color,
    c.last_name,
    c.first_name
FROM clothing_items ci
INNER JOIN sales s ON ci.item_id = s.item_id
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE ci.color = c.favorite_color
ORDER BY color ASC, c.last_name ASC;
