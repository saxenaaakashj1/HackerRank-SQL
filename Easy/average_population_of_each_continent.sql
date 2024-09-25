-- Select the continent and the average population of cities, rounded down
SELECT country.continent, FLOOR(AVG(city.population)) AS avg_population
FROM country
-- Join the city table with the country table based on the country code
INNER JOIN 
city ON country.code = city.countrycode
-- Group by the continent
GROUP BY country.continent;