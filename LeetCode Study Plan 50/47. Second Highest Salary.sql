-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- In SQL, id is the primary key column for this table.
-- Each row of this table contains information about the salary of an employee.
 

-- Find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas). 

-- # Write your MySQL query statement below 
SELECT MAX(salary) as SecondHighestSalary
FROM Employee 
WHERE salary NOT IN(
  SELECT MAX(salary) AS salary FROM Employee
)
