-- We will use the corrected 3-table schema:
-- customers(customer_id, customer_name, city)
-- products(product_id, product_name, category)
-- orderj(order_id, customer_id, product_id, quantity, price)
-- Revenue = quantity * price 

-- 1. Total Revenue Per Customer
Select c.customer_name, sum(o.quantity * o.price) as revenue
from customers c
left join orderj o
on c.customer_id = o.customer_id
group by c.customer_name
order by revenue DESC;



