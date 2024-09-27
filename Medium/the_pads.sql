SELECT `result` 
FROM (
    (
        -- This part of the query selects the names along with the first letter of their occupation in parentheses.
        -- CONCAT: Combines the name with the first letter of their occupation (e.g., 'John(E)').
        -- LEFT(occupation, 1): Extracts the first character from the occupation (e.g., 'Engineer' -> 'E').
        -- AS `result`: Renames the resulting value as `result`.
        -- AS `order`: Assigns a value of 1 to this part of the query to indicate it's a name entry.
        SELECT CONCAT(name, '(', LEFT(occupation, 1), ')') AS `result`, 1 AS `order`
        FROM occupations
    )
    UNION ALL
    (
        -- This part of the query groups the results by occupation and counts the number of people in each occupation.
        -- CONCAT: Combines the string "There are a total of ", the count of people in each occupation, and the occupation name in lowercase.
        -- COUNT(*): Counts the number of occurrences (people) for each occupation.
        -- LOWER(occupation): Converts the occupation name to lowercase (e.g., 'ENGINEER' -> 'engineer').
        -- AS `result`: Renames the resulting string as `result` (e.g., "There are a total of 3 engineers.").
        -- AS `order`: Assigns a value of 2 to indicate it's a summary of occupation counts.
        SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.') AS `result`, 2 AS `order`
        FROM occupations
        GROUP BY occupation -- Groups the results by occupation to generate the count for each.
    )
) AS `occupation_summary`
-- Now, the results of both queries (name and occupation summary) are combined using UNION ALL and processed further.
ORDER BY `order` ASC, -- First, the results are ordered by `order` in ascending order (1 for names, 2 for occupation summaries).

-- Next, we conditionally sort based on the value of `order`.
CASE 
    WHEN `order` = 1 THEN `result` -- For names (order = 1), we sort alphabetically by the `result` column (name with first letter of occupation).
    ELSE 
        -- For occupation summaries (order = 2), we extract the count from the string and cast it to an integer to sort numerically.
        -- SUBSTRING_INDEX(`result`, ' ', 6): Extracts the first 6 words of the string, which includes the count (e.g., "There are a total of 2").
        -- SUBSTRING_INDEX(..., ' ', -1): From the previous string, it extracts the last word, which is the numeric count.
        -- CAST(... AS UNSIGNED): Converts this extracted count to an integer for numerical sorting (e.g., "2" becomes 2).
    CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`result`, ' ', 6), ' ', -1) AS UNSIGNED)
END ASC, -- After sorting by numeric count, we move to the next step.
CASE -- For occupation summaries (order = 2), we apply a secondary alphabetical sorting by the entire `result` string.
    WHEN `order` = 2 THEN `result` -- Sort occupation summaries alphabetically within groups of the same count.
END ASC;