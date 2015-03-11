/*Paul Laibach
  Lab 3
  Getting Started with SQL Queries
  Database Systems
  CMPT 308 - Spring 2015
  Alan G. Labouseur*/

--1
SELECT ordno, dollars
FROM orders;

--2
SELECT name, city
FROM agents
WHERE name = 'Smith';

--3
SELECT pid, name, priceUSD
FROM products
WHERE quantity > 200000;

--4
SELECT name, city
FROM customers
WHERE city = 'Dallas';

--5
SELECT name
FROM agents
WHERE city != 'Tokyo'
  AND city != 'New York';

--6
SELECT *
FROM products
WHERE city != 'Dallas'
  AND city != 'Duluth'
  AND priceUSD >= 1;

--7
SELECT *
FROM orders
WHERE mon = 'jan'
   OR mon = 'may';

--8
SELECT *
FROM orders
WHERE mon = 'feb'
  AND dollars > 500;

--9
SELECT ordno
FROM orders
WHERE cid = 'c005';
