-- 1.Above Average Spending

-- WITH customer_spending AS(
-- 	Select customer_id,sum(quantity * price) as total_price
-- 	from orderj
-- 	group by customer_id
-- ),
-- Average_spending AS(
-- 	Select Avg(total_price) as avg_price
-- 	from customer_spending
-- )
-- Select c.customer_name,ct.total_price
-- from customer_spending ct
-- join customers c
--  on c.customer_id = ct.customer_id
-- cross join Average_spending a
-- where ct.total_price > a.avg_price;

---------------------------------------------------------------------------

-- 2. Customers With Maximum Orders (Cleaner)
-- With cust_order AS(
-- 	Select customer_id , count(order_id) as all_orders
-- 	from orderj
-- 	group by customer_id
-- ),
-- Max_order as(
-- 	Select Max(all_orders) as max_orderd
-- 	from cust_order
-- )
-- Select c.customer_name, oc.all_orders
-- from cust_order oc
-- join customers c
-- on oc.customer_id = c.customer_id
-- join max_order m
-- on oc.all_orders = m.max_orderd;

--------------------------------------------------------------------------------

-- 3. Orders Belonging to Top Customer
-- With order_count AS(
-- 	Select customer_id,
-- 		count(*) as total_order
-- 	from orderj
-- 	group by customer_id
-- ),
-- Max_order as(
-- 	Select Max(total_order) as max_count
-- 	from order_count
-- ),
-- top_customer As(
-- 	Select customer_id
-- 	From order_count oc
-- 	join Max_order m
-- 	on oc.total_order = m.max_count
-- )
-- Select * from orderj
-- where customer_id IN(
-- Select customer_id from top_customer
-- );

----------------------------------------------------------------------------






