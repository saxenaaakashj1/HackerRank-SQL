SELECT `result`
FROM (
    (
        -- First sub_query: Selecting names and their occupations.
        -- CONCAT combines the name with the first letter of the occupation in parentheses.
        -- LEFT(occupation, 1) gets the first letter of the occupation.
        SELECT CONCAT(name, '(', LEFT(occupation, 1), ')') AS `result`, 1 AS `order`
        FROM occupations
    )
    UNION ALL
    (
        -- Second sub_query: Counting the total number of people in each occupation.
        -- CONCAT creates a string that states the total number of each occupation.
        -- COUNT(*) counts the number of entries in each group created by GROUP BY.
        -- LOWER(occupation) converts the occupation name to lowercase for consistent formatting.
        SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.') AS `result`, 2 AS `order`
        FROM occupations
        GROUP BY occupation
    )
) AS `occupation`
-- First, the results are grouped by their order (1 for names, 2 for occupation counts).
-- Second, within those groups, they are sorted alphabetically by the result strings.
-- The final output will show all names first (as they have order 1), sorted 
-- alphabetically, followed by the occupation summaries sorted by the count, and 
-- alphabetically for those with the same count.
ORDER BY `order` ASC, `result` ASC;