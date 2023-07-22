-- Table: Users

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | name           | varchar |
-- +----------------+---------+
-- In SQL, user_id is the primary key for this table.
-- This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 

-- Fix the names so that only the first character is uppercase and the rest are lowercase.

-- Return the result table ordered by user_id.

-- # Write your MySQL query statement below 
SELECT user_id, CONCAT(UCASE(SUBSTRING(name, 1, 1)), LCASE(SUBSTRING(name, 2))) AS name 
FROM users 
ORDER BY user_id
