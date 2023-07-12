-- Table: Movies

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key for this table.
-- title is the name of the movie.
 

-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key for this table.
 

-- Table: MovieRating

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 
 

-- Write an SQL query to:

-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

-- # Write your MySQL query statement below
(
  SELECT u.name AS results 
  FROM Users u JOIN MovieRating mr ON u.user_id=mr.user_id
  GROUP BY u.user_id
  ORDER BY COUNT(mr.user_id) DESC, u.name LIMIT 1
)
UNION  ALL
(
  SELECT m.title AS results 
  FROM MovieRating mr JOIN Movies m ON mr.movie_id=m.movie_id  
  WHERE MONTH(mr.created_at)=02 AND YEAR(mr.created_at)=2020 
  GROUP BY mr.movie_id
  ORDER BY AVG(mr.rating) DESC, m.title LIMIT 1
)
