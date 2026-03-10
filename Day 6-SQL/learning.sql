-- 1. Lag()

-- SELECT order_id,
--        price,
--        LAG(price) OVER (
--            ORDER BY order_id
--        ) AS previous_price
-- FROM orderj;

-- SELECT customer_id,
--        order_id,
--        price,
--        LAG(price,1,0) OVER (
--            PARTITION BY customer_id
--            ORDER BY order_id
--        ) AS prev_price
-- FROM orderj;
-----------------------------------------------------------------------------------

-- 2. LEAD

-- Select order_id,
-- 		price,
-- 		LEAD(price) OVER(
-- 			ORDER BY order_id
-- 		) AS Next_price
-- from orderj;

-------------------------------------------------------------------------------------
-- 3. Write a query to show: customer_id, order_date, days difference from previous order

-- ALTER TABLE orderj
-- ADD COLUMN order_date DATE;

-- UPDATE orderj
-- SET order_date = '2024-01-05'
-- WHERE order_id = 1;

-- UPDATE orderj
-- SET order_date = '2024-01-10'
-- WHERE order_id = 2;

-- UPDATE orderj
-- SET order_date = '2024-02-15'
-- WHERE order_id = 3;

-- UPDATE orderj
-- SET order_date = '2024-02-20'
-- WHERE order_id = 4;

-- UPDATE orderj
-- SET order_date = '2024-03-05'
-- WHERE order_id = 5;

-- UPDATE orderj
-- SET order_date = '2024-03-10'
-- WHERE order_id = 6;

-- Select * from orderj;

-- Select customer_id, order_date,
-- 		order_date - LAG(order_date) over(
-- 		Partition by customer_id
-- 			order by order_date ASC
-- 		) as date_diff
-- from orderj;

------------------------------------------------------------------------------------
-- Missing Revenue Aggregation MoM growth requires: Compute monthly revenue
-- Compare current month revenue with previous month revenue

-- Select month,
-- 	   revenue,
-- 	   CASE
-- 	   		when revenue > prev_revenue then 'Growth'
-- 			When PREV_revenue is NULL then 'First Month'
-- 			When revenue < prev_revenue then 'Decline'
-- 			else 'Flat'
-- 		END as Trend
-- 	From (
-- 		Select month,
-- 		Revenue,
-- 			LAG(revenue) over(
-- 				order by month
-- 			)as prev_revenue
-- 	From(
-- 		Select Date_trunc('month',order_date) as month,
-- 			SUM(price * quantity) as revenue
-- 		from orderj
-- 		group by month
-- 	)monthly_data
-- )final_data
-- order by month;
	   
-------------------------------------------------------------------------------------
-- Write a query that returns: month, revenue, previous_month_revenue, growth_percent

-- SELECT
-- 	month,
-- 	revenue,
-- 	prev_revenue,
-- 	round((100 * (revenue - prev_revenue)/NULLIF(prev_revenue, 0)),2)as growth_percent
-- From(
-- 	SELECT month,
-- 		   revenue,
-- 			Lag(revenue) over (
-- 					order by month
-- 			   )as prev_revenue
-- 	From(
-- 		Select Date_trunc('month',order_date)as month,
-- 		SUM(price * quantity) as revenue
-- 		from orderj
-- 		group by month
-- 	)monthly_data
-- )full_data
-- order by month;	

---------------------------------------------------------------------------------------
-- 3-Month Rolling Average Revenue

-- SELECT 
-- 	month,
-- 	revenue,
-- 	prev_revenue,
-- 	avg_roll_rev
-- 	From(
-- 			Select month,
-- 					revenue,
-- 					round(AVG(revenue) OVER (
-- 					    ORDER BY month
-- 					    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
-- 					),2)as avg_roll_rev,
-- 					Lag(revenue) over(
-- 						order by month
-- 					)as prev_revenue
-- 	From(
-- 			Select Date_trunc('month',order_date) as month,
-- 			Sum(price * quantity) as revenue
-- 			from orderj
-- 			group by month
-- 	)monthly_data
-- )full_data
-- order by month;

--------------------------------------------------------------------------------------
-- Write a query that shows: month, revenue, growth_percent, rolling_3_month_avg, 
-- trend classification (Growth / Decline / Flat)

SELECT 
	month,
	revenue,
	prev_revenue,
	round((100.0 * (revenue - prev_revenue)/NULLIF(prev_revenue, 0)),2)as growth_percent,
	rolling_3_month_avg,
	CASE
		When prev_revenue is NULL then 'First Month'
		When prev_revenue > revenue then 'Decline'
		When prev_revenue < revenue then 'Growth'
		else 'Flat'
	End as trend
	From(
			Select month,
					revenue,
					round(AVG(revenue) OVER (
					    ORDER BY month
					    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
					),2)as rolling_3_month_avg,
					Lag(revenue) over(
						order by month
					)as prev_revenue
	From(
			Select Date_trunc('month',order_date) as month,
			Sum(price * quantity) as revenue
			from orderj
			group by month
	)monthly_data
)full_data
order by month;









