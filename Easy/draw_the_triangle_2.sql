WITH RECURSIVE pattern(n) AS (  
    SELECT 1                          -- Start with the initial value of 'n' set to 1
    UNION                             -- Combine the initial SELECT with the recursive SELECT
    SELECT n + 1                     -- Increment the value of 'n' by 1 for the next recursive call
    FROM pattern                     -- Reference the 'pattern' CTE to continue generating values
    WHERE n < 20                     -- Continue the recursion as long as 'n' is less than 20
)
SELECT REPEAT('* ', n) AS `Stars`  -- For each value of 'n' generated by the CTE, repeat the '*' character 'n' times
FROM pattern;                       -- Select the generated values from the CTE