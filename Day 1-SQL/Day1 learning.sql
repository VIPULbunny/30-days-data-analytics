-- Day 1 Learning

--> From 
-- SELECT * FROM orders;
-- SELECT order_id,customer_id,region FROM orders;

--> Where
-- SELECT * FROM orders where order_id > 4;
-- SELECT * FROM orders where region = 'West';
-- SELECT * FROM orders where order_id > 4 and region = 'West';

--> Order BY - Desc or ASC
-- SELECT * FROM orders ORDER BY price Asc;
-- SELECT * FROM orders ORDER BY price DESC;

--> Limit
-- SELECT * FROM orders ORDER BY price DESC Limit 2;

--> Aggregate Function
-- Select Count(*) from orders;
-- Select Sum(price) from orders;
-- Select Sum(quantity) from orders;
-- Select AVG(price) from orders;

--> Group By
-- select region,count(*) as total_order from orders Group BY region;

--> Having
-- select region,count(*) as total_order from orders Group BY region HAVING count(*)>1;




