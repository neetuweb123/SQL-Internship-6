use ecommercedb;
select * from Customers;
insert into Customers (customer_id, name, email, phone, address, age)
values
(1, 'Arjun Mehta', 'arjun@example.com', '9876543210', 'Delhi, India', 30),
(2, 'Priya Sharma', 'priya@example.com', '9823456789', 'Mumbai, India', 28),
(3, 'Ravi Kumar', 'ravi@example.com', '9876512345', 'Chennai, India', 32),
(4, 'Anita Singh', 'anita@example.com', '9812345678', 'Bangalore, India', 26),
(5, 'Kiran Das', 'kiran@example.com', '9898989898', 'Kolkata, India', 35),
(6, 'Sunita Rao', 'sunita@example.com', '9876123456', 'Hyderabad, India', 27),
(7, 'Raj Patel', 'raj@example.com', '9812123456', 'Ahmedabad, India', 29),
(8, 'Meena Joshi', 'meena@example.com', '9888877777', 'Pune, India', 24),
(9, 'Suresh Reddy', 'suresh@example.com', '9899988888', 'Nagpur, India', 33),
(10, 'Neha Kapoor', 'neha@example.com', '9777766666', 'Lucknow, India', 31),
(11, 'Ajay Verma', 'ajay@example.com', '9811223344', 'Surat, India', 34),
(12, 'Divya Bhatia', 'divya@example.com', '9822334455', 'Indore, India', 30),
(13, 'Vikas Jain', 'vikas@example.com', '9833445566', 'Jaipur, India', 36),
(14, 'Swati Chauhan', 'swati@example.com', '9844556677', 'Bhopal, India', 27),
(15, 'Manoj Pandey', 'manoj@example.com', '9855667788', 'Patna, India', 29),
(16, 'Ritika Sharma', 'ritika@example.com', '9866778899', 'Ranchi, India', 26),
(17, 'Amit Khanna', 'amit@example.com', '9877889900', 'Raipur, India', 28),
(18, 'Tina Desai', 'tina@example.com', '9888990011', 'Chandigarh, India', 33),
(19, 'Sameer Saxena', 'sameer@example.com', '9899001122', 'Dehradun, India', 32),
(20, 'Preeti Kaur', 'preeti@example.com', '9900112233', 'Amritsar, India', 25);

SELECT * FROM Orders;
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2024-06-01', 1200.00),
(2, 2, '2024-06-02', 1500.00),
(3, 3, '2024-06-03', 2000.00),
(4, 4, '2024-06-04', 1800.00),
(5, 5, '2024-06-05', 2100.00),
(6, 6, '2024-06-06', 1750.00),
(7, 7, '2024-06-07', 2300.00),
(8, 8, '2024-06-08', 900.00),
(9, 9, '2024-06-09', 2500.00),
(10, 10, '2024-06-10', 1300.00),
(11, 11, '2024-06-11', 1700.00),
(12, 12, '2024-06-12', 1600.00),
(13, 13, '2024-06-13', 1400.00),
(14, 14, '2024-06-14', 2200.00),
(15, 15, '2024-06-15', 1550.00),
(16, 16, '2024-06-16', 1950.00),
(17, 17, '2024-06-17', 2400.00),
(18, 18, '2024-06-18', 1850.00),
(19, 19, '2024-06-19', 1450.00),
(20, 20, '2024-06-20', 1100.00);


SELECT * FROM Payments;
INSERT INTO Payments (payment_id, order_id, payment_date, amount_paid, payment_method)
VALUES
(1, 1, '2024-06-01', 1200.00, 'Credit Card'),
(2, 2, '2024-06-02', 1500.00, 'UPI'),
(3, 3, '2024-06-03', 2000.00, 'Debit Card'),
(4, 4, '2024-06-04', 1800.00, 'Cash'),
(5, 5, '2024-06-05', 2100.00, 'Net Banking'),
(6, 6, '2024-06-06', 1750.00, 'Credit Card'),
(7, 7, '2024-06-07', 2300.00, 'UPI'),
(8, 8, '2024-06-08', 900.00, 'Debit Card'),
(9, 9, '2024-06-09', 2500.00, 'Cash'),
(10, 10, '2024-06-10', 1300.00, 'Net Banking'),
(11, 11, '2024-06-11', 1700.00, 'Credit Card'),
(12, 12, '2024-06-12', 1600.00, 'UPI'),
(13, 13, '2024-06-13', 1400.00, 'Debit Card'),
(14, 14, '2024-06-14', 2200.00, 'Cash'),
(15, 15, '2024-06-15', 1550.00, 'Net Banking'),
(16, 16, '2024-06-16', 1950.00, 'Credit Card'),
(17, 17, '2024-06-17', 2400.00, 'UPI'),
(18, 18, '2024-06-18', 1850.00, 'Debit Card'),
(19, 19, '2024-06-19', 1450.00, 'Cash'),
(20, 20, '2024-06-20', 1100.00, 'Net Banking');


-- 1.What is a subquery?
SELECT * FROM Customers
WHERE age > (SELECT AVG(age) FROM Customers);


-- 2.Difference between subquery and join?
SELECT name FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Orders
);
SELECT DISTINCT c.name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;














-- 3.What is a correlated subquery?
SELECT name,
       (SELECT COUNT(*) FROM Orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM Customers c;


-- 4.Can subqueries return multiple rows?
SELECT name FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Orders
);


-- 5.How does EXISTS work?
SELECT * FROM Customers c
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id
);


-- 6.How is performance affected by subqueries?
-- Uncorrelated subqueries (run once) are faster.
-- Correlated subqueries (run for each outer row) may be slow.
-- JOINs or EXISTS often outperform subqueries with IN on large datasets.

-- 7.What is scalar subquery?
SELECT * FROM Customers
WHERE age > (SELECT AVG(age) FROM Customers);


-- 8.Where can we use subqueries?
SELECT name, (SELECT COUNT(*) FROM Orders WHERE Orders.customer_id = Customers.customer_id) AS order_count
FROM Customers;

SELECT t.customer_id, t.total_spent
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) t;

SELECT * FROM Orders
WHERE customer_id IN (SELECT customer_id FROM Customers WHERE age > 30);



-- 9.Can a subquery be in FROM clause?
SELECT t.customer_id, t.total_spent
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) t;


-- 10.What is a derived table?
SELECT *
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) AS summary;


-- sub query
select *
from payments
where amount_paid > 1800.00;
select * from payments;

select avg(amount_paid)from payments;

select * 
from payments
where amount_paid > (select avg(amount_paid)from payments);

select order_id from orders;
select order_id, amount_paid, payment_method
from payments
where order_id in (select order_id from orders);

-- using exist  operator
select order_id ,amount_paid
from payments
where amount_paid >2100;
select * from payments;