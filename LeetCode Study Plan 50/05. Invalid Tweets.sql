-- Table: Tweets

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | tweet_id       | int     |
-- | content        | varchar |
-- +----------------+---------+
-- tweet_id is the primary key for this table.
-- This table contains all the tweets in a social media app.

-- Find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order. 

-- # Write your MySQL query statement below 
select tweet_id from Tweets where length(content)>15