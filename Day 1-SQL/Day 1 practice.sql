-- SELECT * from orders;

-- 1. Show all Furniture orders.
-- SELECT * FROM orders where category='Furniture';

-- 2. Show orders with price > 500.
-- SELECT * FROM orders where price > 500;

-- 3. Count total Electronics orders.
-- SELECT count(*) FROM orders GROUP BY category HAVING category = 'Electronics';

-- 4. Find total quantity sold per region.
-- SELECT region,sum(quantity) as total_quantity FROM orders GROUP BY region;

-- 5. Show regions with more than 2 orders.
-- SELECT region, COUNT(*) AS total_orders
-- FROM orders
-- GROUP BY region
-- HAVING COUNT(*) > 2;

-- 6. Show top 2 most expensive orders.
-- SELECT * FROM orders ORDER BY price DESC LIMIT 2;

