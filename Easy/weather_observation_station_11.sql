SELECT DISTINCT(city) 
-- Select unique city names 
FROM station 
-- Filter cities that start with a consonant
WHERE city REGEXP '^[^aeiou].+$' 
-- Or cities that end with a consonant
OR city REGEXP '^.+[^aeiou]$';