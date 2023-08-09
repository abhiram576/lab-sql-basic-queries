USE  sakila;
-- Challenge 1
-- 1.1 
SELECT * FROM sakila.film;
SELECT MIN(length) as min_duration, MAX(length) as max_duration FROM sakila.film;
-- 1.2  Express the average movie duration in hours and minutes. Don't use decimals. Hint: look for floor and round functions.
SELECT AVG(length) as avg_duration FROM sakila.film;

SELECT
    CONCAT(
        floor (AVG(length) / 60), -- Average hours
        ' hours ',
        AVG(length) % 60, -- Average minutes
        ' minutes'
    ) AS average_duration
FROM sakila.film;

-- 2 
 SELECT * FROM sakila.rental;
 
-- 2.1 
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS date_difference
FROM sakila.rental;

-- 2.2
 SELECT 
    rental_id, 
    rental_date, 
    DATE_FORMAT(rental_date, '%M') AS rental_month,
    DATE_FORMAT(rental_date, '%W') AS rental_weekday
FROM sakila.rental
LIMIT 20;

-- 2.3
 SELECT 
    rental_id, 
    rental_date, 
    CASE 
        WHEN DAYOFWEEK(rental_date) = 1 or DAYOFWEEK(rental_date) = 7 THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM rental;

-- 3 
SELECT * FROM sakila.film;

SELECT title,  coalesce(rental_duration, 'Not Available') as rental_duration
FROM sakila.film
ORDER BY title ASC;

-- 4 
SELECT  concat(first_name,' ', last_name) as full_name, left(email,3) as email_char
FROM sakila.customer
order by last_name ASC;

-- Challenge 2
-- 1.1
SELECT count(film_id) as toal_films FROM sakila.film;

-- 1.2 
 SELECT DISTINCT rating, count(film_id) as films FROM sakila.film
GROUP BY rating;

-- 1.3
 SELECT DISTINCT rating, count(film_id) as films FROM sakila.film
GROUP BY rating
ORDER BY  films desc;

-- 2
SELECT * FROM sakila.rental;
SELECT  staff_id, count(DISTINCT rental_id) as rentals   FROM sakila.rental
GROUP BY staff_id;

-- 3
SELECT * FROM film;
-- 3.1 
SELECT DISTINCT rating, avg(length) as mean FROM sakila.film
GROUP BY rating
ORDER BY  mean desc;

-- 3.2
SELECT DISTINCT rating, avg(length) as mean FROM sakila.film
GROUP BY rating
HAVING mean >120;

-- 4
SELECT last_name FROM actor
GROUP BY last_name
HAVING count(last_name) = 1;