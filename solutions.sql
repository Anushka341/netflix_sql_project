CREATE DATABASE netflix_data;
USE netflix_data;
CREATE TABLE netflix_titles (
    show_id VARCHAR(20),
    type VARCHAR(7),
    title VARCHAR(104),
    director VARCHAR(208),
    cast TEXT,
    country VARCHAR(123),
    date_added VARCHAR(19),
    release_year INT,
    rating VARCHAR(8),
    duration VARCHAR(10),
    listed_in VARCHAR(79),
    description TEXT
);
SELECT * FROM netflix_titles LIMIT 10;
SELECT * FROM netflix_titles LIMIT 10;

SELECT COUNT(*) AS total_titles FROM netflix_titles;
SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;
SELECT release_year, COUNT(*) AS total_releases
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;
SELECT country, COUNT(*) AS total
FROM netflix_titles
GROUP BY country
ORDER BY total DESC
LIMIT 10;
SELECT COUNT(*) AS missing_country
FROM netflix_titles
WHERE country IS NULL OR country = '';
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
SELECT COUNT(*) FROM netflix_titles;
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
SELECT title, duration
FROM netflix_titles
WHERE duration IS NOT NULL
ORDER BY duration DESC
LIMIT 1;
SELECT title, date_added
FROM netflix_titles
WHERE date_added >= CURDATE() - INTERVAL 5 YEAR;
SELECT title, release_year
FROM netflix_titles
WHERE release_year >= YEAR(CURDATE()) - 5;
SELECT title, type, director
FROM netflix_titles
WHERE director = 'Rajiv Chilaka';
SELECT title, type, director
FROM netflix_titles
WHERE director = 'Rabindranath Tagore';
-- What is the ratio of Movies to TV Shows in the Netflix catalog?
SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;
-- How many titles were added to Netflix in 2020?"
SELECT COUNT(*) AS count
FROM netflix_titles
WHERE YEAR(date_added) = 2020;
-- How many titles are missing director or cast information?
SELECT COUNT(*) AS count
FROM netflix_titles
WHERE director IS NULL OR cast IS NULL;
-- What is the most frequent rating assigned to movies and TV shows
SELECT rating, COUNT(*) AS count
FROM netflix_titles
GROUP BY rating
ORDER BY count DESC
LIMIT 1;
-- What are the most common genres across Netflix content?
SELECT listed_in, COUNT(*) AS count
FROM netflix_titles
GROUP BY listed_in
ORDER BY count DESC
LIMIT 10;
-- Which countries are producing the most content on Netflix?
SELECT country, COUNT(*) AS count
FROM netflix_titles
GROUP BY country
ORDER BY count DESC
LIMIT 10;
-- Which is the longest movie currently listed on Netflix?"
SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;
-- What kind of content is consistently created by specific directors like 'Jay Karas'?
SELECT type, listed_in, COUNT(*) AS count
FROM netflix_titles
WHERE director = 'Jay Karas'
GROUP BY type, listed_in
ORDER BY count DESC;
-- How many documentary films are available for viewers?
SELECT COUNT(*) AS documentary_count
FROM netflix_titles
WHERE type = 'Movie'
  AND listed_in LIKE '%Documentaries%';
  -- What percentage of content has no director listed?
  SELECT 
  ROUND(
    (SUM(CASE WHEN director IS NULL OR director = '' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
    2
  ) AS percentage_without_director
FROM netflix_titles;
-- What is the yearly trend of Netflix content being released in India? Which 5 years had the highest average releases?"
SELECT release_year, COUNT(*) AS total_titles
FROM netflix_titles
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 5;
-- Can we identify and label potentially disturbing content by detecting words like 'kill' or 'violence' in descriptions?
SELECT title, description
FROM netflix_titles
WHERE description LIKE '%kill%' 
   OR description LIKE '%murder%' 
   OR description LIKE '%violence%' 
   OR description LIKE '%death%' 
   OR description LIKE '%crime%';
   -- How many movies has Salman Khan been featured in the last 10 years?
   SELECT COUNT(*) AS movies_count
FROM netflix_titles
WHERE cast LIKE '%Salman Khan%'
  AND release_year >= YEAR(CURDATE()) - 10
  AND type = 'Movie';
  -- Who are the top 10 actors most frequently featured in Indian-produced movies?
SELECT cast, COUNT(*) AS movie_count
FROM netflix_titles
WHERE LOWER(country) LIKE '%india%'
  AND type = 'Movie'
  AND cast IS NOT NULL
GROUP BY cast
ORDER BY movie_count DESC
LIMIT 10;
-- How long does it take on average from a title's release year to its Netflix release (date_added)?
SELECT 
  AVG(DATEDIFF(date_added, STR_TO_DATE(CONCAT(release_year, '-01-01'), '%Y-%m-%d'))) AS avg_days_to_netflix
FROM netflix_titles
WHERE date_added IS NOT NULL
  AND release_year IS NOT NULL
  AND release_year != ''
  AND date_added != ''
  AND release_year > 1900;  -- Ensures valid release years
  -- What are the top 5 genres with the highest average rating?
SELECT listed_in, AVG(CASE 
                        WHEN rating IN ('PG', 'PG-13', 'R', 'TV-MA') THEN 1
                        WHEN rating = 'TV-PG' THEN 2
                        WHEN rating = 'TV-G' THEN 3
                        ELSE 0 END) AS avg_rating
FROM netflix_titles
WHERE listed_in IS NOT NULL
  AND rating IS NOT NULL
GROUP BY listed_in
ORDER BY avg_rating DESC
LIMIT 5;



