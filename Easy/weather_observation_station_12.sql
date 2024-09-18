-- Select unique city names 
SELECT DISTINCT(city) -- From the station table
FROM station -- Filter cities that start and end with a consonant
WHERE city REGEXP '^[^aeiou].+[^aeiou]$';