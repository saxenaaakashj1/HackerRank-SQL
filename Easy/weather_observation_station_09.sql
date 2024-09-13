-- Select distinct city names 
SELECT DISTINCT(city)
-- From the 'station' table
FROM station
-- Filter city names that start with a consonant (anything that is not a vowel) using a regular expression
WHERE city REGEXP '^[^aeiou].+$';