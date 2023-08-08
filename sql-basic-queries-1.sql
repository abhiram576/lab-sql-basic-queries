USE  sakila;
-- 0.file save script as , name, 
-- 1.Show all tables.
SHOW TABLES;
-- 2.Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
-- 3.1
SELECT title FROM film;
-- 3.2
SELECT name AS language FROM language;
-- 3.3
SELECT first_name FROM staff ;
-- 4 Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- 5.1 Determine the number of stores that the company has.
SELECT * FROM store;
-- 5.2 Determine the number of employees that the company has.
SELECT * FROM staff;
-- 5.3 Determine how many films are available for rent and how many have been rented.  This means:
-- Number of physical movies that are owned by the stores : And distinct film titles in inventory

SELECT * FROM film;
SELECT * FROM inventory; 
SELECT * FROM store;

SELECT COUNT(DISTINCT inventory_id) FROM inventory; -- the no.of copies owned by the inventory
SELECT COUNT(DISTINCT film_id) FROM inventory;

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) FROM actor;

-- Retrieve the 10 longest films.
SELECT title, length FROM film ORDER BY length DESC LIMIT 10;

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name from actor where first_name = 'SCARLETT';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title, length  FROM film
WHERE title LIKE '%ARMAGEDDON%'
AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(special_features)  FROM film
Where special_features LIKE '%Behind the Scenes%';
