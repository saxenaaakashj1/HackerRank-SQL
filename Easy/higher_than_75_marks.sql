SELECT name
-- Select the 'name' column from the 'students' table
FROM students -- Filter rows where 'marks' are greater than 75
WHERE marks > 75 
-- Order the results by the last 3 characters of 'name' in ascending order and 
-- then by 'id' in ascending order
ORDER BY RIGHT (name, 3) ASC, id ASC;