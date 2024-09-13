-- Select distinct city names 
SELECT DISTINCT(city)
-- From the 'station' table
FROM station
-- Filter city names that start and end with a vowel (a, e, i, o, u) using a regular expression
WHERE city REGEXP '^[aeiou].+[aeiou]$';