-- 1.evenue per customer

-- Select *
-- from(
-- 	SELECT c.customer_name,
-- 			SUM(o.quantity * o.price) as total_revenue,
-- 			ROW_NUMBER() OVER(
-- 				Order by SUM(o.quantity * o.price) DESC
-- 			) AS row_num
-- 	FROM customers c
-- 	JOIN orderj o
-- 		on c.customer_id = o.customer_id
-- 	group by c.customer_name
-- )sub;

--------------------------------------------------------------------------------
--2. Top 2 Customers Using RANK (No LIMIT)

-- Select *
-- from(
-- 	SELECT c.customer_name,
-- 			SUM(o.quantity * o.price) as total_revenue,
-- 			RANK() OVER(
-- 				Order by SUM(o.quantity * o.price) DESC
-- 			) AS row_rank
-- 	FROM customers c
-- 	JOIN orderj o
-- 		on c.customer_id = o.customer_id
-- 	group by c.customer_name
-- )sub
-- where row_rank <= 2;

-------------------------------------------------------------------------------
-- 3.Rank customers inside each category.(PARTITION BY (Very Important))

-- Select *
-- From (
-- 	Select p.category,
-- 			c.customer_name,
-- 			Sum(o.quantity * o.price) as total_rev,
-- 			rank() over(
-- 					Partition by p.category
-- 					order by Sum(o.quantity * o.price) DESC
-- 			) AS category_rank
-- 	From orderj o
-- 	join customers c on o.customer_id = c.customer_id
-- 	join products p on p.product_id = o.product_id
-- 	group by p.category,c.customer_name
-- 	)sub
-- Where category_rank = 1;

----------------------------------------------------------------------------------
--4. Rank customers by total revenue using DENSE_RANK()

-- Select *
-- from (
-- 	Select c.customer_name,
-- 		   sum(o.price * o.quantity) as total_rev,
-- 		   DENSE_RANK() over(
-- 				Order by sum(o.price * o.quantity) DESC
-- 		   )as Row_dense
-- 	from customers c
-- 	join orderj o
-- 	on c.customer_id = o.customer_id
-- 	group by c.customer_name
-- ) ranked;

---------------------------------------------------------------------------------
--5. Get top 2 customers by revenue using DENSE_RANK()
-- Select * 
-- from(
-- 	SELECT c.customer_name,
-- 		sum(o.price * o.quantity) as total_rev,
-- 		Dense_rank() over(
-- 			order by sum(o.price * o.quantity) DESC
-- 		)as row_ranked
-- From orderj o
-- join customers c
-- on o.customer_id = c.customer_id
-- group by c.customer_name
-- )ranked
-- Where row_ranked <=2;

--------------------------------------------------------------------------------------
--6.  Rank customers within each product category by revenue.
-- 		Return: category, customer_name, revenue, rank

-- Select * 
-- From (
-- 	Select p.category,
-- 		   c.customer_name,
-- 		   Sum(o.price * o.quantity) as total_rev,
-- 		   rank() over(
-- 			Partition by p.category
-- 			order by Sum(o.price * o.quantity) DESC
-- 		   ) as partation_rank
-- 	From orderj o
-- 	join customers c
-- 	on o.customer_id = c.customer_id
-- 	join products p
-- 	on p.product_id = o.product_id
-- 	group by c.customer_name,p.category
-- )sub;

-----------------------------------------------------------------------------------
--7. Show each customer's revenue AND the percentage contribution to total company revenue.

-- SELECT customer_name,
-- 		total_rev,
-- 		round(100 * total_rev / SUM(total_rev) over(),2) as revenue_percent
-- from(
-- 	SELECT c.customer_name,
-- 		sum(o.price * o.quantity) as total_rev
-- From orderj o
-- join customers c
-- on o.customer_id = c.customer_id
-- group by c.customer_name
-- )ranked;

-----------------------------------------------------------------------------------
--8. Percentage contribution within each category.

-- SELECT customer_name,
-- 		category,
-- 		total_rev,
-- 		round(
-- 				100 * total_rev /
-- 				SUM(total_rev) over(partition by category),2
-- 				)
-- 		as revenue_percent
-- from(
-- 	SELECT c.customer_name,
-- 			p.category,
-- 			sum(o.price * o.quantity) as total_rev
-- From orderj o
-- join customers c
-- 	on o.customer_id = c.customer_id
-- join products p
-- 	on p.product_id = o.product_id
-- group by c.customer_name,p.category
-- )ranked;


-------------------------------------------------------------------------------------
-- 9. Show each customer's revenue AND cumulative revenue percentage (Pareto analysis style).

-- Select
-- 	customer_name,
-- 	total_revenue,
-- 	round(
-- 			100 * sum(total_revenue) over(order by total_revenue desc)
-- 			/
-- 			sum(total_revenue) over(),2
-- 			)as cum_percent
-- from (
-- 	SELECT c.customer_name,
-- 		sum(o.price * o.quantity) as total_revenue
-- From orderj o
-- join customers c
-- on o.customer_id = c.customer_id
-- group by c.customer_name
-- )revenue_data
-- order by total_revenue desc;







