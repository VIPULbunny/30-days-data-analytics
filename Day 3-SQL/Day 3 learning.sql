--DAY 3 – Subqueries Mastery

-- 1. Orders greater than average order price
-- Select * from orderj
-- where price > ( select avg(price)
-- 				from orderj
-- 				);

-- 2. Customers who placed at least one order
-- Select customer_name from customers
-- where customer_id IN(Select customer_id
-- 					from orderj);

-- 3. Customers who never ordered
-- Select customer_name from customers
-- where customer_id Not IN(Select customer_id
-- 					from orderj);

-- 4. Correlated Subquery
-- Customers whose total spending is above overall average spending
-- Select c.customer_name, 
-- 	(Select Sum(o.price * o.quantity)
-- 	from orderj o
-- 	Where o.customer_id = c.customer_id
-- 	) as total_spent
-- from customers c;


-- 5. Subquery Inside HAVING
-- Customers who spent more than average customer spending

-- SELECT c.customer_name,
--        SUM(o.quantity * o.price) AS total_spent
-- FROM customers c
-- JOIN orderj o
--   ON c.customer_id = o.customer_id
-- GROUP BY c.customer_name
-- HAVING SUM(o.quantity * o.price) >
-- (
--     SELECT AVG(sub.total_spent)
--     FROM (
--         SELECT SUM(quantity * price) AS total_spent
--         FROM orderj
--         GROUP BY customer_id
--     ) sub
-- );


