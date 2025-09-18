-- Exercise 2: I this exercise suppose to data of exercise#1
SELECT
    cust.last_name,
    cust.first_name,
    col.name AS favorite_color
FROM customer cust
LEFT JOIN clothing_order co ON cust.id = co.customer_id
INNER JOIN color col ON cust.favorite_color_id = col.id
WHERE co.customer_id IS NULL
ORDER BY cust.last_name ASC, cust.first_name ASC;
