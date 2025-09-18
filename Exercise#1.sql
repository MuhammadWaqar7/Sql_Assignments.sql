-- Create tables
CREATE TABLE color (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    extra_fee DECIMAL(10, 2) DEFAULT 0
);

CREATE TABLE customer (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    favorite_color_id INT,
    FOREIGN KEY (favorite_color_id) REFERENCES color(id)
);

CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id INT NULL,
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

CREATE TABLE clothing (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    size CHAR(3) CHECK (size IN ('S', 'M', 'L', 'XL', '2XL', '3XL')),
    price DECIMAL(10, 2) NOT NULL,
    color_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE clothing_order (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    clothing_id INT NOT NULL,
    items INT DEFAULT 1 CHECK (items > 0),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (clothing_id) REFERENCES clothing(id)
);

-- Insert colors
INSERT INTO color (id, name, extra_fee) VALUES
(1, 'Red', 0.00),
(2, 'Blue', 0.00),
(3, 'Green', 0.00),
(4, 'Black', 0.00),
(5, 'White', 0.00),
(6, 'Gold', 5.00),
(7, 'Silver', 3.00);

-- Insert customers
INSERT INTO customer (id, first_name, last_name, favorite_color_id) VALUES
(1, 'John', 'Doe', 2),    -- Blue
(2, 'Jane', 'Smith', 1),  -- Red
(3, 'Bob', 'Johnson', 3), -- Green
(4, 'Alice', 'Brown', 2), -- Blue
(5, 'Charlie', 'Wilson', 4), -- Black
(6, 'Emma', 'Davis', 7);  -- Silver (no orders)

-- Insert categories (hierarchical structure)
INSERT INTO category (id, name, parent_id) VALUES
-- Main categories
(1, 'Tops', NULL),
(2, 'Bottoms', NULL),
(3, 'Footwear', NULL),
(4, 'Accessories', NULL),

-- Subcategories of Tops
(5, 'T-Shirts', 1),
(6, 'Sweatshirts', 1),
(7, 'Jackets', 1),

-- Subcategories of Bottoms
(8, 'Pants', 2),
(9, 'Shorts', 2),

-- Subcategories of Footwear
(10, 'Running Shoes', 3),
(11, 'Basketball Shoes', 3),

-- Subcategories of Accessories
(12, 'Hats', 4),
(13, 'Socks', 4);

-- Insert clothing items
INSERT INTO clothing (id, name, size, price, color_id, category_id) VALUES
(1, 'Cotton T-Shirt', 'M', 19.99, 2, 5),    
(2, 'Denim Jeans', 'L', 49.99, 2, 8),       
(3, 'Summer Dress', 'S', 59.99, 1, 5),      
(4, 'Leather Jacket', 'XL', 129.99, 4, 7),  
(5, 'Sports Shorts', 'M', 29.99, 3, 9),     
(6, 'Wool Sweater', 'L', 79.99, 1, 6),      
(7, 'Running Shoes', '42', 89.99, 5, 10),   
(8, 'Baseball Cap', 'L', 24.99, 2, 12);     

-- Insert orders
INSERT INTO clothing_order (id, customer_id, clothing_id, items, order_date) VALUES
(1, 1, 1, 2, '2024-01-15'),  
(2, 1, 2, 1, '2024-01-20'),  
(3, 2, 3, 1, '2024-02-10'),  
(4, 2, 6, 1, '2024-02-12'),  
(7, 4, 8, 2, '2024-02-20'),  
(8, 5, 4, 1, '2024-02-25');  

-- Exercise 1: List clothing items and customers who bought them in their favorite color
SELECT
    c.name AS clothes,
    col.name AS color,
    cust.last_name,
    cust.first_name
FROM clothing c
INNER JOIN clothing_order co ON c.id = co.clothing_id
INNER JOIN customer cust ON co.customer_id = cust.id
INNER JOIN color col ON c.color_id = col.id
WHERE c.color_id = cust.favorite_color_id
ORDER BY col.name ASC, cust.last_name ASC;
