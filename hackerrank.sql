
-- Query the list of CITY names from STATION that do not end with vowels. Your result 
-- cannot contain duplicates.

SELECT DISTINCT(city)
FROM station
WHERE city NOT REGEXP '[aeiou]$';

OR 

SELECT DISTINCT(city)
FROM station
WHERE city REGEXP '[^aeiou]$';

-- Query the list of CITY names from STATION that either do not start with vowels or 
-- do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(city)
FROM station
WHERE city REGEXP '^[^aeiou]'
OR city REGEXP '[^aeiou]$';

-- Query the list of CITY names from STATION that do not start with vowels and do not 
-- end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(city)
FROM station
WHERE city REGEXP '^[^aeiou]'
AND city REGEXP '[^aeiou]$';

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your 
-- output by the last three characters of each name. If two or more students both have 
-- names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary 
-- sort them by ascending ID.

SELECT name
FROM students
WHERE marks > 75 
ORDER BY RIGHT(name, 3) ASC, ID ASC;


-- Write a query that prints a list of employee names (i.e.: the name attribute) 
-- from the Employee table in alphabetical order.

SELECT name
FROM employee 
ORDER BY name ASC;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for 
-- employees in Employee having a salary greater than 2000 per month who have been employees 
-- for less than 10 months. Sort your result by ascending employee_id.

SELECT name
FROM employee 
WHERE salary > 2000
AND months < 10
ORDER BY employee_id ASC;

-- Query a count of the number of cities in CITY having a Population larger than 100,000.

SELECT COUNT(*)
FROM city
WHERE population > 100000;

-- Query the total population of all cities in CITY where District is California.

SELECT SUM(population)
FROM city
WHERE district = 'California';

-- Query the average population of all cities in CITY where District is California.

SELECT AVG(population)
FROM city 
WHERE district = 'California';

-- Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT ROUND(AVG(population))
FROM city;

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(population)
FROM city 
WHERE countrycode = 'JPN';


-- Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(population) - MIN(population)
FROM city;



-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880  and 
-- less than 137.2345. Truncate your answer to  decimal places.


SELECT ROUND(SUM(lat_n),4)
FROM station
WHERE lat_n > 38.7880 AND lat_n < 137.2345;

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
-- Truncate your answer to 4 decimal places.

SELECT ROUND(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345;

-- Given the CITY and COUNTRY tables, query the names of all the continents 
-- (COUNTRY.Continent) and their respective average city populations (CITY.Population) 
-- rounded down to the nearest integer.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

-- while ROUND might seem like a viable option at first glance, FLOOR is the preferred 
-- function for rounding down to the nearest integer in SQL due to its consistent rounding 
-- behavior, portability, and clarity.

-- For example:

-- FLOOR(10.5) would return 10.
-- FLOOR(-3.2) would return -4.
-- Floor returns value lesser than equal to number.

-- For example:

-- CEIL(10.5) would return 11.
-- CEILING(-3.2) would return -3.
-- Ceil returns value greater than equal to number.

SELECT country.continent, FLOOR(AVG(city.population))
FROM city
JOIN country ON city.countrycode = country.code
GROUP BY country.continent;

-- Samantha was tasked with calculating the average monthly salaries for all employees in 
-- the EMPLOYEES table, but did not realize her keyboard's  key was broken until after
-- completing the calculation. She wants your help finding the difference between her
-- miscalculation (using salaries with any zeros removed), and the actual average salary.

-- Write a query calculating the amount of error (i.e.: actual - miscalculated average 
-- monthly salaries), and round it up to the next integer.

-- REPLACE(salary, 0, "") replaces all zeros in the salary column with empty strings (""). 
-- This effectively removes zeros from the salary data before calculating the average.

-- REPLACE function in SQL is a versatile tool for modifying strings within your database.
-- Syntax: REPLACE(string, old_substring, new_substring)
-- The new_substring can be empty (""). This effectively removes the old_substring from 
-- the string.


SELECT ROUND(AVG(salary)) - ROUND(AVG(REPLACE(salary, 0, ""))) 
FROM employees;

