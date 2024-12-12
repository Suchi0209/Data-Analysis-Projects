use sakila;

/* 1) Display the first and last names of all actors from the table actor*/
SELECT first_name, last_name FROM actor
order by first_name, last_name;



/* 2) You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, “Joe.” 
What is one query would you use to obtain this information? */
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE first_name = 'Joe';



/* 3) Select specific columns from the films table that last 3 hours or longer. */    
Select title, length
from film 
where length >= 180
order by length desc;


    
/* 4) Select all columns from the customer table for rows that have a last name beginning with "S" and a first name ending with "N". */
select * 
FROM customer 
WHERE last_name Like 'S%' AND first_name Like '%N';

    
    
/* 5) Select specific columns from the payments table for payments made on or after 05/27/2005. */
SELECT payment_id, customer_id, amount, payment_date 
FROM payment 
WHERE payment_date >= '2005-05-27';


    
/* 6) Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China: */
SELECT country_id, country 
FROM country 
WHERE country in ('Afghanistan', 'Bangladesh', 'China');



/* 7) Find all actors whose last name contain the letters GEN */
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE "%GEN%";


    
/* 8) Find all actors whose last names contain the letters LI. This time, 
order the rows by last name and first name, in that order: */
SELECT * 
FROM actor 
WHERE last_name LIKE '%LI%' 
ORDER BY last_name, first_name;


    
/* 9) Which actors have the first name ‘Scarlett’ */
SELECT * 
FROM actor 
WHERE first_name = 'Scarlett';



/* 10) Which actors have the last name ‘Johansson’ */
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE last_name = 'Johansson';



/* 11) Select the following columns from the film table for rows where the description ends with the word "Boat"
and rental duration greater than 6. Title, Description, Rental Duration */
SELECT title, description, rental_duration 
FROM film 
WHERE description LIKE '%Boat' AND rental_duration > 6;



/* 12) How many distinct actors last names are there? */
SELECT COUNT(DISTINCT last_name) 
FROM actor;



/* 13) When is ‘Academy Dinosaur’ due? */
select title, rental_duration
from film
where title = "Academy Dinosaur";


/* 14) What is that average running time of all the films in the sakila DB? */
Select Avg(length) 
from film;


