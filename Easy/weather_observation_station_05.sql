SELECT city, LENGTH(city)
FROM station
ORDER BY 2 ASC, 1 ASC
LIMIT 1;

SELECT city, LENGTH(city)
FROM station
ORDER BY 2 Desc, 1 ASC
LIMIT 1;