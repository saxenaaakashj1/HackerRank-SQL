SELECT DISTINCT(city) 
-- Select distinct city names 
FROM station 
-- Filter city names that end with a consonant (anything that is not
-- a vowel) using a regular expression
WHERE city REGEXP '^.+[^aeiou]$';