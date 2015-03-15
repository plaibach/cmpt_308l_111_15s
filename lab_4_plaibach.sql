/* Paul Laibach
   Lab 4
   SQL Queries - The Subqueries Sequel
   Database Systems
   CMPT 308 - Spring 2015
   Alan G. Labouseur */

-- 1. Get the cities of agents booking an order for a customer whose cid is 'c006'.
--    *  If I understand the instructions, this answer violates the "Do not use primary key values in the queries. E.g., you may not assume that customer “Basics” is ‘c007’." caveat.

   SELECT city
   FROM agents
   WHERE aid IN
      (SELECT aid
       FROM orders
       WHERE cid = 'c006')
   ORDER BY city ASC;

-- 1. Alternate - not using a primary key in the base criteria...
--    *  So in this example I specified 'ACME' in 'Kyoto' to avoid using the "cid" primary key of 'c006'.
--    *  We cannot simply specify the "customer [name] whose cid is 'c006' as there are two customers named 'ACME'.
--    *  The results happen to be the same, but the query is actually flawed without specifying at least a superkey; e.g., name and city.
--    *  I break the rule about including periods within quotations when I end a sentence with a field name. Sometimes I avoid ending a sentence with a field name for just this reason. A similar issue arises with (cambridge [or oxford... whatever], of course) commas.

   SELECT city
   FROM agents
   WHERE aid IN
      (SELECT aid
       FROM orders
       WHERE cid IN
          (SELECT cid
           FROM customers
           WHERE name = 'ACME'
             AND city = 'Kyoto'))
   ORDER BY city ASC;

-- 2. Get the pids of products ordered through any agent who takes at least one order from a customer in Kyoto, sorted by pid from highest to lowest. (This is not the same as asking for pids of products ordered by customers in Kyoto.)

   SELECT DISTINCT pid
   FROM orders
   WHERE aid IN
      (SELECT aid
       FROM orders
       WHERE cid IN
          (SELECT cid
           FROM customers
           WHERE city = 'Kyoto'))
   ORDER BY pid DESC;

-- 3. Get the cids and names of customers who did not place an order through agent a03. 
--    *  Am I overcomplicating things for the stipulation "Do not use primary key values in the queries. E.g., you may not assume that customer “Basics” is ‘c007’."
--    *  I.e, in this example I specified 'Brown' in 'Tokyo' to avoid using the "aid" primary key of 'a03'.

   SELECT cid, name
   FROM customers
   WHERE cid NOT IN
      (SELECT cid
       FROM orders
       WHERE aid IN
          (SELECT aid
           FROM agents
           WHERE name = 'Brown'
             AND city = 'Tokyo'))
   ORDER BY cid ASC;

-- 4. Get the cids of customers who ordered both product p01 and p07. 

   SELECT DISTINCT cid
   FROM orders
   WHERE pid = 'p01'
     AND cid IN
      (SELECT cid
         FROM orders
        WHERE pid = 'p07')
   ORDER BY cid ASC;

-- 5. Get the pids of products NOT ordered by any customers who placed any order through agent a05. 

   SELECT pid
   FROM products
   WHERE pid NOT IN
      (SELECT pid
       FROM orders
       WHERE cid IN
          (SELECT cid
           FROM orders
           WHERE aid = 'a05'))
   ORDER BY pid ASC;

-- 6. Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York. 

   SELECT name, discount, city
   FROM customers
   WHERE cid IN
      (SELECT cid
       FROM orders
       WHERE aid IN
          (SELECT aid
           FROM agents
           WHERE city = 'Dallas'
              OR city = 'New York'))
   ORDER BY name ASC, city ASC;

-- 7. Get all customers who have the same discount as that of any customers in Dallas or London

   SELECT cid, name
   FROM customers
   WHERE discount IN
          (SELECT discount
           FROM customers
           WHERE city = 'Dallas'
              OR city = 'London')
   ORDER BY cid ASC;

-- 8. Tell me about check constraints: What are they? What are they good for? What’s the advantage of putting that sort of thing inside the database? Make up some examples of good uses of check constraints and some examples of bad uses of check constraints. Explain the differences in your examples and argue your case.

   /*    Check constraints are included to limit the values that may be stored in a field / column or tuple. Thus, check constraints may be single-field attribute based or tuple-based - invoking more complex relationship rules. A basic form of check constraint may be used to prevent storing a NULL value. A tuple based constraint might be used to require or limit another value when a particular condition is met. For example, in the Red Hook Alumni Association database, the 'Grad_Year' and 'Affiliation_Code' of "G" are interdependent; that is, if the 'Affiliation_Code' set includes the value "G", then a 'Grad_Year' value is also required; the converse and inverse are also true. However, this example highlights an unnecessary redundancy in the database logic: unless 'Grad_Year' were to be repurposed as a generic 'Year' field, there is no need for a 'Grad_Year' specific affiliation code.

   A good use of check constraints might be to require any birthdate to fall in the past. Another good use would be to require exactly 10 digits for a Unites States domestic telephone number; or to require either 7 or 10 digits for a zip code. It might be appropriate to include tuple-based check of relationships between country code, zip code, and postal code.

   An example in our text, "studio name can only be Disney, Fox, MGM, or Paramount" appears to be a bad use of (hard coded) check constraints. Are these really the only studios that might appear in the data? Other bad uses of check constraints include names of unknown persons, cities, etc., as it is not feasible to anticipate all the possible permutations. */
