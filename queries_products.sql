-- Comments in SQL Start with dash-dash --

-- questions 1, 2 and 3 --
INSERT INTO products (name,price,can_be_returned) VALUES
('chair',44.00,false),('stool',25.99,true),('table',124.00,false)
--------------------------

-- question 4 --
SELECT * FROM products
----------------

-- q 5 --
SELECT name FROM products
---------

-- q 6 --
SELECT name,price FROM products
---------

-- q 7 --
INSERT INTO products (name,price,can_be_returned) VALUES
('bookshelf',59.99,true)
---------

-- q 8 --
SELECT * FROM products WHERE can_be_returned=true
---------

-- q 9 --
SELECT * FROM products WHERE price < 44.00
---------

-- q 10 --
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99
----------

-- q 11 --
UPDATE products SET price = price - 20
----------

-- q 12 --
DELETE FROM products WHERE price < 25.00
----------

-- q 13 --
UPDATE products SET price = price + 20
----------

-- q 14 --
UPDATE products SET can_be_returned = true
----------