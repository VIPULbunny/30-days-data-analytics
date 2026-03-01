-- 🔶 Problem 1
-- Products that were never ordered.
-- Select product_name from products where product_id Not in(select product_id from orderj);


-- 🔶 Problem 2
-- Customers who placed more orders than average number of orders per customer.
-- select c.customer_name ,
-- 	count(o.order_id)as total_orders
-- from customers c
-- join orderj o
-- 	on c.customer_id = o.customer_id
-- group by c.customer_name
-- having count(o.order_id) > 
-- 	(
-- 		SELECT AVG(order_count)
--     FROM (
--         SELECT COUNT(*) AS order_count
--         FROM orderj
--         GROUP BY customer_id
--     ) sub
-- 	);


-- 🔶 Problem 3
-- Orders whose price is greater than overall average price.
-- select * from orderj
-- where price >
-- (select avg(price) from orderj);


-- 4.Return orders that belong to the customer who placed the maximum number of orders.
Select *
from orderj 
where customer_id IN
	(
		Select customer_id
		from orderj
		group by customer_id
		having count(*)=
	(
		Select Max(order_sum)
		from(
			Select count(*)as order_sum
			from orderj 
			group by customer_id
		)sub
	)	
);





