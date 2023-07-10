-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the name of an employee, their department, and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themself.
 

-- Find the managers with at least five direct reports.

-- Return the result table in any order.

-- # Write your MySQL query statement below 
SELECT E1.name FROM Employee E1 INNER JOIN Employee E2 on E1.id=E2.managerID 
GROUP BY E1.name
HAVING COUNT(e1.name)>=5
