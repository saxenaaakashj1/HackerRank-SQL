SELECT DISTINCT(city) 
-- Select unique city names 
FROM station 
-- Filter cities that start and end with a consonant
WHERE city REGEXP '^[^aeiou].+[^aeiou]$';