-- Select the triangle type based on side lengths A, B, and C
SELECT 
    CASE 
        -- Check if the sides satisfy the triangle inequality theorem
        -- Triangle inequality theorem states: 
        -- 1. A + B > C
        -- 2. B + C > A
        -- 3. C + A > B
        WHEN A + B > C AND B + C > A AND C + A > B THEN
            CASE 
                -- Check if all three sides are equal (Equilateral Triangle)
                WHEN A = B AND B = C THEN 'Equilateral'
                
                -- Check if exactly two sides are equal (Isosceles Triangle)
                -- Ensure that (A = B AND B <> C) OR (B = C AND C <> A) OR (C = A AND A <> B)
                -- covers all cases where two sides are equal
                WHEN (A = B AND B <> C) OR (B = C AND C <> A) OR (C = A AND A <> B) THEN 'Isosceles'
                
                -- Check if all three sides are different (Scalene Triangle)
                WHEN A <> B AND B <> C AND C <> A THEN 'Scalene'
            END
        ELSE 'Not A Triangle' -- If the sides do not satisfy the triangle inequality theorem, it is not a valid triangle
    END AS triangle_type -- Alias for the resulting column indicating the type of triangle
FROM triangles; -- Specify the table containing the triangle side lengths