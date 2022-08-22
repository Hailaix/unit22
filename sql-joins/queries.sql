-- write your queries here

-- Query 1 --
SELECT * FROM owners o FULL JOIN vehicles v ON o.id = v.owner_id
-------------

-- Query 2 --
SELECT o.first_name, o.last_name, COUNT(*) as count 
FROM owners o 
JOIN vehicles v 
ON o.id = v.owner_id
GROUP BY o.id
ORDER BY count ASC;
-------------

-- Query 3 --
SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) as average_price, COUNT(*) as count
FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.id
HAVING AVG(v.price) > 10000 AND COUNT(*) > 1
ORDER BY o.first_name DESC;
-------------

