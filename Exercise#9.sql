-- Base on Data from Exercise#7
-- Exercise#9
SELECT 
    o.customer_id,
    c.full_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    SUM(o.total_amount) OVER (
        PARTITION BY o.customer_id 
        ORDER BY o.order_date
    ) as running_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.customer_id, o.order_date;
