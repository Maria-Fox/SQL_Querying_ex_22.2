-- Comments in SQL Start with dash-dash --
SELECT app_name FROM analytics WHERE id = 1800;

SELECT id, app_name FROM analytics
   WHERE last_updated = '2018-08-01';

SELECT count(app_name) FROM analytics GROUP BY category;
SELECT category, COUNT(*) FROM analytics 
  GROUP BY category;

SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;
-- Has to be desc to show the top 5 first -- 

SELECT app_name, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

SELECT category, avg(rating) GROUP BY category ORDER BY avg DESC;

SELECT app_name, price, rating FROM analytics WHERE 
rating < 3 ORDER BY price DESC LIMIT 1;

SELECT app_name FROM analytics 
  WHERE min_installs <= 50 
    AND rating IS NOT NULL 
    ORDER BY rating DESC;

SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 1000;

SELECT app_name FROM analytics WHERE price BETWEEN .10 AND 1.00 ORDER BY reviews DESC LIMIT 10;

--review this--
SELECT * FROM analytics 
  WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- using a subq. to go into the chosen category and query the max price alone)
SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

--without a subq--
SELECT * FROM analytics
  ORDER BY price DESC LIMIT 1;

SELECT SUM(reviews) FROM analytics;

SELECT category FROM analytics GROUP BY category HAVING count(category) > 300;

SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;



-- FURTHER STUDY 

-- FS1. Find the name and rating of the top rated apps in each category, 
-- among apps that have been installed at least 50,000 times.
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

-- FS2. Find all the apps that have a name similar to "facebook".
SELECT * FROM analytics 
  WHERE app_name ILIKE '%facebook%';

-- FS3. Find all the apps that have more than 1 genre.
SELECT * FROM analytics 
  WHERE  array_length(genres, 1) = 2;

-- FS4. Find all the apps that have education as one of their genres.
SELECT * FROM analytics 
  WHERE genres @> '{"Education"}';