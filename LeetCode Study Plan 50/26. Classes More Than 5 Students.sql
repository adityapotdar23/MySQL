-- Table: Courses

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |
-- | class       | varchar |
-- +-------------+---------+
-- (student, class) is the primary key column for this table.
-- Each row of this table indicates the name of a student and the class in which they are enrolled.
 

-- Find all the classes that have at least five students.

-- Return the result table in any order.

-- # Write your MySQL query statement below
SELECT class FROM Courses 
GROUP BY class
HAVING COUNT(DISTINCT student)>=5;
