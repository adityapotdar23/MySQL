-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- id is the primary key for this table.
-- id is an autoincrement column.
 

-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- # Write your MySQL query statement below
WITH cte AS (
  SELECT num, 
  LEAD(num, 1) OVER() num1, 
  LEAD(num, 2) OVER() num2 
  FROM logs
)

SELECT DISTINCT num AS ConsecutiveNums FROM cte WHERE num=num1 AND num=num2
