    CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    parent_id INT NULL,
    FOREIGN KEY (parent_id) REFERENCES categories(category_id)
);

DELETE FROM categories;
INSERT INTO categories (category_id, category_name, parent_id) VALUES
-- Main categories (parent_id IS NULL)
(1, 'Clothing', NULL),
(2, 'Electronics', NULL),
(3, 'Home & Garden', NULL),
-- Subcategories of Clothing
(4, 'T-Shirts', 1),
(5, 'Jeans', 1),
(6, 'Dresses', 1),
-- Subcategories of Electronics
(7, 'Smartphones', 2),
(8, 'Laptops', 2),
(9, 'Headphones', 2),
-- Subcategories of Home & Garden
(10, 'Furniture', 3),
(11, 'Kitchenware', 3),
-- Some categories with no subcategories (to test the LEFT JOIN)
(12, 'Books', NULL),
(13, 'Sports', NULL);

---Solutions
SELECT
    parent.category_name AS category,
    child.category_name AS subcategory
FROM 
    categories parent
-- Left join to include main categories even if they have no subcategories
LEFT JOIN categories child 
    ON parent.category_id = child.parent_id
-- Filter for main categories only (parent_id IS NULL)
WHERE parent.parent_id IS NULL
-- Sort by main category, then by subcategory for clear organization
ORDER BY 
    parent.category_name ASC,
    child.category_name ASC;
