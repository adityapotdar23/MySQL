-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- | mail          | varchar |
-- +---------------+---------+
-- In SQL, user_id is the primary key for this table.
-- This table contains information of the users signed up in a website. Some e-mails are invalid.
 

-- Find the users who have valid emails.

-- A valid e-mail has a prefix name and a domain where:

-- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- The domain is '@leetcode.com'.
-- Return the result table in any order. 


-- # Write your MySQL query statement below 
SELECT user_id, name, mail 
FROM Users 
WHERE mail REGEXP '^[a-zA-Z]+[a-zA-Z-._0-9]*@leetcode[.]com$';
