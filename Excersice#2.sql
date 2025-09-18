   --- Excersice#2
   SELECT
       c.last_name,
       c.first_name,
       c.favorite_color
   FROM 
       customers c
   -- Left join to include all customers, even those without sales
   LEFT JOIN sales s 
       ON c.customer_id = s.customer_id
   -- Filter for customers where no sales record exists
   WHERE s.customer_id IS NULL
   -- Sort alphabetically by last name for clean presentation
   ORDER BY 
       c.last_name ASC,
       c.first_name ASC;
   --As we run on previouse data set provide there its shows null because all our customer did purchases not any null values.
