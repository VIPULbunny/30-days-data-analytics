--1. Find top 2 customers by total revenue.
-- With order_revenue as(
-- 	Select customer_id,
-- 			Sum(price * quantity) as total_revenue
-- 	From orderj
-- 	group by customer_id
-- )
-- Select c.customer_name,
-- 	   oe.total_revenue
-- from customers c
-- Join order_revenue oe
-- on c.customer_id = oe.customer_id
-- ORDER BY oe.total_revenue Desc
-- LIMIT 2;

------------------------------------------------------------------------------

--2.Find customers whose total revenue is above average revenue.

-- with total_revenue AS(
-- 	Select customer_id , 
-- 	Sum(quantity * price) as total_rev
-- 	from orderj
-- 	group by customer_id
-- ),
-- Avg_revenue AS(
-- 	Select Avg(total_rev) as avg_rev
-- 	from total_revenue
-- )
-- Select c.customer_name,
-- 		tr.total_rev
-- from customers c
-- join total_revenue tr
-- on c.customer_id = tr.customer_id
-- cross join avg_revenue a
-- where tr.total_rev > a.avg_rev;

-------------------------------------------------------------------------------

-- 3. Find customers who bought from more than one product category.
With cust_category AS(
	Select o.customer_id ,
	count(DISTINCT(p.category)) as dist_count
	from products p
	join orderj o
	on p.product_id = o.product_id
	group by o.customer_id
)
Select c.customer_name,
		cc.dist_count 
from customers c
join cust_category cc
	on c.customer_id = cc.customer_id
where cc.dist_count > 1;






