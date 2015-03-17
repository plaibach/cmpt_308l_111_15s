/* Paul Laibach
   Lab 5
   SQL Queries - The Joins Three­quel
   Database Systems
   CMPT 308 - Spring 2015
   Alan G. Labouseur */

-- 1. Show the cities of agents booking an order for a customer whose pid is 'c006'. Use joins; no subqueries. 
--    *  I believe this exercise contains an error in that 'pid' should actually specify 'cid'.

   SELECT agents.city
   FROM orders
      INNER JOIN agents
         ON orders.aid = agents.aid
   WHERE orders.cid = 'c006'
   ORDER BY city ASC;

-- 2. Show the pids of products ordered through any agent who makes at least one order for a customer in Kyoto, sorted by pid from highest to lowest. Use joins; no subqueries. 

   SELECT DISTINCT a.pid
   FROM orders a
      RIGHT JOIN orders b
         ON a.aid = b.aid
      INNER JOIN customers
         ON b.cid = customers.cid
   WHERE customers.city = 'Kyoto'
   ORDER BY a.pid ASC;

-- 3. Show the names of customers who have never placed an order. Use a subquery. 

   SELECT name
   FROM customers
   WHERE cid NOT IN
      (SELECT cid
       FROM orders)
   ORDER BY customers.name ASC;

-- 4. Show the names of customers who have never placed an order. Use an outer join. 

   SELECT name
   FROM customers
      LEFT JOIN orders
         ON customers.cid = orders.cid
   WHERE orders.cid IS NULL
   ORDER BY customers.name ASC;

-- 5. Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names. 

   SELECT DISTINCT customers.name, agents.name
   FROM customers
      INNER JOIN orders
         ON customers.cid = orders.cid
      INNER JOIN agents
         ON orders.aid = agents.aid
   WHERE customers.city = agents.city
   ORDER BY customers.name ASC;

-- 6. Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent. 

   SELECT customers.name, agents.name, customers.city
   FROM customers, agents
   WHERE customers.city = agents.city
   ORDER BY customers.name ASC;

-- 7. Show the name and city of customers who live in the city that makes the fewest different kinds of products. (Hint: Use count and group by on the Products table.) 

-- WTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTF
-- WTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTF

   SELECT MIN(count), city
   FROM (SELECT COUNT(*), city
         FROM products
         GROUP BY products.city) AS foo;
