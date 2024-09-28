SELECT DISTINCT(city) 
-- Select unique city names 
FROM station 
-- Filter city names that start with a vowel (a, e, i, o, u) using a regular 
-- expression
WHERE city REGEXP '^[aeiou].+$';