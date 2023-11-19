-- DA PT 2023 
-- Sara Ferreira da Silva

-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name. So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select actor_id, first_name, last_name
from sakila.actor
where last_name 
	in (select last_name
	from sakila.actor
	group by last_name
	having count(*) = 1);

-- 2. Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
select actor_id, first_name, last_name
from sakila.actor
where last_name 
	in (select last_name
	from sakila.actor
	group by last_name
	having count(*) > 1);

-- 3. Using the rental table, find out how many rentals were processed by each employee.
-- Employee 1: 8040 // Employee 2: 8004
select * from sakila.rental;
select staff_id, count(*) as rentals_occured
from sakila.rental
group by staff_id;
 
-- 4. Using the film table, find out how many films were released each year.
-- 2006: 1000 films
select * from sakila.film;
select release_year, count(*) as films_released_per_year
from sakila.film
group by release_year;

-- 5. Using the film table, find out for each rating how many films were there.
-- 'PG', '194'
-- 'G', '178'
-- 'NC-17', '210'
-- 'PG-13', '223'
-- 'R', '195'
select * from sakila.film;
select rating, count(*) as films_per_rating
from sakila.film
group by rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length), 2) as avg_length_film
from sakila.film
group by rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
-- PG-13	120.44
select * from sakila.film;
select rating, round(avg(length), 2) as avg_length_film
from sakila.film
group by rating
having avg_length_film > 120
order by rating;



