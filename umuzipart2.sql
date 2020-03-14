--1--
select * FROM customers

--2--
select first_name FROM customers;

--3--
select * FROM customers WHERE customersid = 1;

--4--
UPDATE customers
SET first_name = 'Lerato' , last_name = 'Mabitso'
WHERE customersid = 1;

--5--
DELETE FROM customers WHERE customersid = 2;
SELECT COUNT(DISTINCT status) FROM orders;

--6--
select distinct on (status) status
from orders

--7--
SELECT MAX(amount)
FROM payments;

--8--
SELECT * FROM customers
ORDER BY Country;

--9--
SELECT buy_price
FROM products
WHERE buy_price BETWEEN 100 AND 600;

--10--
SELECT * FROM customers
WHERE Country ='Germany' AND City='Berlin';

--11--
SELECT * FROM customers
WHERE City='Cape Town' OR City='Durban';

--12--
SELECT * FROM products
WHERE buy_price >500;

--13--
SELECT SUM(amount)
FROM payments;

--14--
SELECT COUNT(DISTINCT status)
FROM orders;

--15--
SELECT CAST(AVG(buy_price) AS DECIMAL(10,2)) average_in_rands,
CAST(AVG((buy_price/12)) AS DECIMAL(10,2)) average_in_dollars
FROM products;

--16--
SELECT payments.paymentid, customers.first_name,last_name,gender,address,phone,email,city,country
FROM payments
INNER JOIN customers ON payments.customersid = customers.customersid;

--17--
select *
from products
where description Like '%Turnable front wheels%'