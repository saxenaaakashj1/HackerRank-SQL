-- Select the name of cities
SELECT 
    city.name 
FROM 
    city
-- Join the city table with the country table based on the country code
INNER JOIN 
    country ON city.countrycode = country.code
-- Filter for countries in the continent of Africa
WHERE 
    country.continent = 'Africa';