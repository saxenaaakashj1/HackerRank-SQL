SELECT DISTINCT(city) 
-- Select distinct city names 
FROM station 
-- Filter city names that start with a consonant (anything that is 
-- not a vowel) using a regular expression
WHERE city REGEXP '^[^aeiou].+$';