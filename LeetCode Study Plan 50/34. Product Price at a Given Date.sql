-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.

WITH less_than AS (
  SELECT * FROM Products WHERE change_date<='2019-08-16'
), 
latest_change AS (
  SELECT product_id, MAX(change_date) AS change_date FROM less_than GROUP BY product_id
)

SELECT product_id, 10 AS price FROM Products GROUP BY product_id HAVING MIN(change_date)>'2019-08-16'
UNION 
SELECT p.product_id, p.new_price AS price FROM Products p 
JOIN latest_change lc ON p.product_id=lc.product_id 
WHERE p.change_date=lc.change_date
