-- Table: Sales

-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- (sale_id, year) is the primary key of this table.
-- product_id is a foreign key to Product table.
-- Each row of this table shows a sale on the product product_id in a certain year.
-- Note that the price is per unit.
 

-- Table: Product

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key of this table.
-- Each row of this table indicates the product name of each product.
 

-- Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

-- Return the resulting table in any order. 

-- # Write your MySQL query statement below
WITH first_year_sales AS (
  SELECT s.product_id, MIN(s.year) AS first_year 
  FROM Sales s INNER JOIN Product p ON p.product_id=s.product_id
  GROUP BY s.product_id
)

SELECT f.product_id, f.first_year, s.quantity, s.price 
FROM first_year_sales f 
JOIN Sales s ON f.product_id=s.product_id AND f.first_year=s.year
