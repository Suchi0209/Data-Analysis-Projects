use sakila;

/***Exercises***/
     
    
/* 1- Use `INNER JOIN` to display the first and last names, as well as the address, of each staff member. 
Use the tables `staff` and `address` */
SELECT 
    staff.first_name, 
    staff.last_name, 
    address.address
FROM 
    staff
INNER JOIN 
    address
ON 
    staff.address_id = address.address_id;



  
  
  
/* 2- Use `INNER JOIN` to display first name, last name and the amount for each staff member. 
Use tables `staff` and `payment*/
SELECT 
    staff.first_name, 
    staff.last_name, 
    payment.amount
FROM 
    staff
INNER JOIN 
    payment
ON 
    staff.staff_id = payment.staff_id;





/* 3- Use `INNER JOIN` to display first name, last name,  payment date and 
the amount for each staff member in  August of 2005. Use tables `staff` and `payment*/
SELECT 
    staff.first_name, 
    staff.last_name, 
    payment.amount
FROM 
    staff
INNER JOIN 
    payment
ON 
    staff.staff_id = payment.staff_id;



  
/* 4- Use `INNER JOIN` to display the total amount rung up by each staff member in August of 2005. 
Use tables `staff` and `payment`. */
SELECT 
    staff.first_name, 
    staff.last_name, 
    SUM(payment.amount) AS total_amount
FROM 
    staff
INNER JOIN 
    payment
ON 
    staff.staff_id = payment.staff_id
WHERE 
    payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY 
    staff.staff_id, 
    staff.first_name, 
    staff.last_name;





/* 5) List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. 
Use inner join, group by. */
SELECT 
    film.title, 
    COUNT(film_actor.actor_id) AS actor_count
FROM 
    film
INNER JOIN 
    film_actor
ON 
    film.film_id = film_actor.film_id
GROUP BY 
    film.film_id, 
    film.title;






/* 6) How many copies of the film `Hunchback Impossible` exist in the inventory system? 
Use tables `film` and `inventory`*/
SELECT 
    COUNT(inventory.inventory_id) AS total_copies
FROM 
    film
INNER JOIN 
    inventory
ON 
    film.film_id = inventory.film_id
WHERE 
    film.title = 'Hunchback Impossible';








/* 7) Using the tables `payment` and `customer` and the `INNER JOIN` command, list payments by each customer. 
List the customers alphabetically by last name */
SELECT 
    customer.last_name, 
    customer.first_name, 
    payment.amount, 
    payment.payment_date
FROM 
    customer
INNER JOIN 
    payment
ON 
    customer.customer_id = payment.customer_id
ORDER BY 
    customer.last_name ASC, 
    customer.first_name ASC;





/* 8) Using the tables `payment` and `customer` and the `INNER JOIN` command, list the total paid by each customer. 
List the customers alphabetically by last name. */
SELECT 
    customer.last_name, 
    customer.first_name, 
    SUM(payment.amount) AS total_paid
FROM 
    customer
INNER JOIN 
    payment
ON 
    customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id, 
    customer.last_name, 
    customer.first_name
ORDER BY 
    customer.last_name ASC, 
    customer.first_name ASC;





/* 9) Which actor has appeared in the most films? */
SELECT 
    actor.first_name, 
    actor.last_name, 
    COUNT(film_actor.film_id) AS film_count
FROM 
    actor
INNER JOIN 
    film_actor
ON 
    actor.actor_id = film_actor.actor_id
GROUP BY 
    actor.actor_id, 
    actor.first_name, 
    actor.last_name
ORDER BY 
    film_count DESC
LIMIT 1;





/* 10) Find the most common actor surname from the Sakila database */
SELECT 
    actor.last_name, 
    COUNT(actor.last_name) AS surname_count
FROM 
    actor
GROUP BY 
    actor.last_name
ORDER BY 
    surname_count DESC
LIMIT 1;





/* 11) List the last names of actors, as well as how many actors have that last name.*/
SELECT 
    actor.last_name, 
    COUNT(actor.actor_id) AS actor_count
FROM 
    actor
GROUP BY 
    actor.last_name
ORDER BY 
    actor_count DESC;





/* 12) Which last names are not repeated? (Please search for having clause for this exercises) */
SELECT 
    actor.last_name
FROM 
    actor
GROUP BY 
    actor.last_name
HAVING 
    COUNT(actor.actor_id) = 1;





/* 13) Which last names appear more than once? (Please search for having clause for this exercises) */
SELECT 
    actor.last_name
FROM 
    actor
GROUP BY 
    actor.last_name
HAVING 
    COUNT(actor.actor_id) > 1;

