-- Table: Customer

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- | visited_on    | date    |
-- | amount        | int     |
-- +---------------+---------+
-- (customer_id, visited_on) is the primary key for this table.
-- This table contains data about customer transactions in a restaurant.
-- visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
-- amount is the total paid by a customer.
 

-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

-- Write an SQL query to compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

-- Return result table ordered by visited_on in ascending order.

WITH CTE AS (
    SELECT visited_on, COUNT(visited_on) OVER W AS day_cnt, 
    SUM(SUM(amount)) OVER W AS amount, 
    ROUND(AVG(SUM(amount)) OVER W, 2) AS average_amount 
    FROM Customer 
    GROUP BY 1
    WINDOW W AS (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
)
SELECT visited_on, amount, average_amount FROM cte 
WHERE day_cnt=7 

-- OR 

SELECT visited_on, (
    SELECT SUM(amount) 
    FROM Customer 
    WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
) AS amount, 
ROUND(
    (
        SELECT SUM(amount)/7 
        FROM Customer 
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ), 2
) AS average_amount 
FROM Customer c 
WHERE visited_on>= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) 
    From Customer
)
GROUP BY visited_on;
