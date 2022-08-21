-- Comments in SQL Start with dash-dash --

-- Q 1 --
SELECT * FROM analytics WHERE id = 1880
---------

-- Q 2 --
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01'
---------

-- Q 3 --
SELECT category,COUNT(*) FROM analytics GROUP BY category
---------

-- Q 4 --
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5
---------

-- Q 5 --
SELECT app_name FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1
---------

-- Q 6 --
SELECT category,avg(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;
---------

-- Q 7 --
SELECT app_name,price,rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1
---------

-- Q 8 --
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC
---------

-- Q 9 --
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000
---------

-- Q 10 --
SELECT * FROM analytics WHERE price BETWEEN .10 AND 1.00 ORDER BY  reviews DESC LIMIT 10
----------

-- Q 11 --
SELECT * FROM analytics ORDER BY last_updated ASC LIMIT 1
----------

-- Q 12 --
SELECT * FROM analytics ORDER BY price DESC LIMIT 1
----------

-- Q 13 --
SELECT SUM(reviews) as total_reviews FROM analytics
----------

-- Q 14 --
SELECT category,COUNT(*) as apps FROM analytics GROUP BY category HAVING COUNT(*) > 300
----------

-- Q 15 --
SELECT app_name,min_installs,min_installs/reviews as installs_to_reviews FROM analytics
WHERE min_installs >= 100000 ORDER BY installs_to_reviews DESC LIMIT 1