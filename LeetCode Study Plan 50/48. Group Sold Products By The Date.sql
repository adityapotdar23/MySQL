-- Table Activities:

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | sell_date   | date    |
-- | product     | varchar |
-- +-------------+---------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains the product name and the date it was sold in a market.
 

-- Find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.

-- Return the result table ordered by sell_date. 

-- # Write your MySQL query statement below 
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM Activities 
GROUP BY sell_date 
ORDER BY sell_date ASC
