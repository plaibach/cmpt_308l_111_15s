DROP TABLE cars;

CREATE TABLE cars (
   mfgYear int,
   kind text,
   make text,
   model text,
   priceUSD numeric
   );

-- Demonstrate two different statements to insert data
INSERT INTO cars (model, kind, mfgYear, make, priceUSD) VALUES
   ('Wranger', 'Utility', 2013, 'Jeep', 35000),
   ('SuperDuty', 'Pickup', 2008, 'Ford', 45000);
INSERT INTO cars (mfgYear, kind, make, model, priceUSD) VALUES
   (1964, 'Sedan', 'Dodge', 'Polara', 2000),
   (1963, 'Sedan', 'Volvo', 'PV 544', 1500);

ALTER TABLE cars
   ADD sellUSD numeric DEFAULT NULL;

-- ALTER RENAME cannot be applied simultaneously?
ALTER TABLE cars 
   RENAME priceUSD to costUSD;
ALTER TABLE cars 
   RENAME kind to bodyStyle;

-- UPDATE SET cannot be applied simultaneously.
UPDATE cars
   SET sellUSD = costUSD * 1.5
   WHERE mfgYear < 1970;
UPDATE cars
   SET sellUSD = costUSD * 1.25
   WHERE mfgYear >= 1970;

SELECT mfgYear, make, model, bodyStyle, costUSD, sellUSD
   FROM cars

-- ******************************************************
-- RANDOM NOTES BELOW HERE
-- ******************************************************

SELECT make, priceUSD
FROM cars
WHERE priceUSD >= 100000
   or model = 'Esprit'
   or kind = 'sedan'

UPDATE cars
SET sellUSD = priceUSD * 1.5
WHERE make = 'Dodge'

DELETE FROM cars
WHERE kind = 'sedan'

ALTER TABLE cars
ADD sellUSD numeric DEFAULT 9

ALTER TABLE cars
RENAME priceUSD to costUSD

ALTER TABLE cars
RENAME costUSD to priceUSD

UPDATE cars
SET make = 'Ford'
WHERE make = 'Ford'
