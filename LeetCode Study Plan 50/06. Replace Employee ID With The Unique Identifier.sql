-- Table: Employees

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key for this table.
-- Each row of this table contains the id and the name of an employee in a company.
 

-- Table: EmployeeUNI

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | unique_id     | int     |
-- +---------------+---------+
-- (id, unique_id) is the primary key for this table.
-- Each row of this table contains the id and the corresponding unique id of an employee in the company.
 

-- Show the unique ID of each user, If a user does not have a unique ID replace just show null.

-- Return the result table in any order.

-- # Write your MySQL query statement below 
SELECT eu.unique_id as unique_id, e.name as name from Employees e left join EmployeeUNI eu on e.id=eu.id
