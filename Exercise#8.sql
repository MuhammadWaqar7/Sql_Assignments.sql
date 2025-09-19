-- Base on data from Exercise#7
--Exercise#8
WITH OrderSequence AS (
    SELECT 
        order_id,
        customer_id,
        order_date,
        total_amount,
        LAG(total_amount) OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) as previous_value
    FROM orders
)
SELECT 
    order_id,
    customer_id,
    total_amount,
    previous_value,
    COALESCE(total_amount - previous_value, 0) as delta
FROM OrderSequence
ORDER BY customer_id, order_date;
