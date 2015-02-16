CREATE TABLE cars (
   kind text,
   make text,
   model text,
   priceUSD numeric
   )

SELECT *
FROM cars

SELECT make, priceUSD
FROM cars
WHERE priceUSD >= 100000
   or model = 'Esprit'
   or kind = 'sedan'

INSERT INTO cars (kind, make, model, priceUSD)
   VALUES ('sedan', 'Dodge', 'Polara', 2000)

INSERT INTO cars (model, kind, make, costUSD, sellUSD)
   VALUES ('SuperDuty', 'pickup', 'Fordx', 45000, costUSD * 1.5)

UPDATE cars
SET sellUSD = priceUSD * 1.5
WHERE make = 'Dodge'

DELETE FROM cars
WHERE kind = 'sedan'

ALTER TABLE cars
ADD sellUSD numeric DEFAULT 9

ALTER TABLE cars
RENAME priceUSD to costUSD
