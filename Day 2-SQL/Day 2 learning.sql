-- CREATE TABLE customers (
--     customer_id VARCHAR(10) PRIMARY KEY,
--     customer_name TEXT NOT NULL,
--     city TEXT
-- );

-- INSERT INTO customers VALUES
-- ('C1', 'Alice', 'Mumbai'),
-- ('C2', 'Bob', 'Delhi'),
-- ('C3', 'Charlie', 'Pune'),
-- ('C4', 'David', 'Chennai'),
-- ('C5', 'Eve', 'Kolkata');

-- CREATE TABLE orderj(
--     order_id INT PRIMARY KEY,
--     customer_id VARCHAR(10),
--     product_id INT,
--     quantity INT,
--     price NUMERIC(10,2)
-- );

-- INSERT INTO orderj VALUES
-- (1, 'C1', 101, 2, 500),
-- (2, 'C2', 102, 1, 800),
-- (3, 'C1', 102, 3, 200),
-- (4, 'C3', 101, 1, 1000),
-- (5, 'C4', 102, 2, 300),
-- (6, 'C2', 103, 1, 500);

-- Select * from orderj;
-- Select * from customers;


-- Inner Join
-- Select c.customer_id,c.customer_name,c.city , o.amount 
-- from customers c
-- inner join orderj o
-- on c.customer_id = o.customer_id;


-- Left Join
-- Select * 
-- from customers c
-- left join orderj o
-- on c.customer_id = o.customer_id;


-- Right Join
-- Select * 
-- from customers c
-- right join orderj o
-- on c.customer_id = o.customer_id;


-- Full Outer Join
-- Select * 
-- from customers c
-- full outer join orderj o
-- on c.customer_id = o.customer_id;


-- Cross Join
-- SELECT c.customer_name,
--        o.order_id
-- FROM customers c
-- CROSS JOIN orderj o;


-- CREATE TABLE products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(50),
--     category VARCHAR(30)
-- );

-- INSERT INTO products VALUES
-- (101, 'Laptop', 'Electronics'),
-- (102, 'Chair', 'Furniture'),
-- (103, 'Phone', 'Electronics');

-- SELECT c.customer_name,
--        p.product_name,
--        o.quantity,
--        o.price
-- FROM orderj o
-- JOIN customers c
--   ON o.customer_id = c.customer_id
-- JOIN products p
--   ON o.product_id = p.product_id;







