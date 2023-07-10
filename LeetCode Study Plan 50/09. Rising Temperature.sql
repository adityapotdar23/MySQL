-- Table: Weather

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- This table contains information about the temperature on a certain day.
 

-- Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

-- # Write your MySQL query statement below 
SELECT w1.id from Weather w1, Weather w2
WHERE datediff(w1.recordDate,w2.recordDate)=1 AND w1.temperature>w2.temperature
