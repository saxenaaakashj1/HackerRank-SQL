SELECT DISTINCT(city) 
-- Select distinct city names 
FROM station 
-- Filter city names that start and end with a vowel (a, e, i, o, u) using a 
-- regular expression
WHERE city REGEXP '^[aeiou].+[aeiou]$';