-- Select the maximum total earnings (salary * months) and count the employees with that maximum
SELECT MAX(salary * months) AS `maximum_total_earnings`, 
    (
        -- Subquery to count how many employees have the maximum total earnings
        SELECT COUNT(*) 
        FROM employee 
        WHERE (salary * months) = (
            -- Subquery to find the maximum total earnings
            SELECT MAX(salary * months) 
            FROM employee
        )
    ) AS `employee_count_with_max_earnings`
FROM employee;