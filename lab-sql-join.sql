use sakila;

-- 1. List the number of films per category.
select name, count(*) as count from film_category
left join category
on film_category.category_id = category.category_id
group by name
order by count desc;


-- 2. Display the first and the last names, as well as the address, of each staff member.
select first_name, last_name, address from staff
left join address
on staff.address_id = address.address_id;


-- 3. Display the total amount rung up by each staff member in August 2005.
select staff_id, count(*) as aug2005_count
from rental
where DATE_FORMAT(rental_date, '%M %Y') = 'August 2005'
group by staff_id;



-- 4. List all films and the number of actors who are listed for each film.
select title,  count(*) as num_actors from film_actor
left join film
on  film.film_id = film_actor.film_id
group by film_actor.film_id
order by num_actors desc;








-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from customer;
select * from payment;

select customer_id, SUM(amount) from payment
group by customer_id;


select first_name, last_name, payment.customer_id, sum(amount) as total_paid from payment
left join customer
on payment.customer_id = customer.customer_id
group by customer_id
order by last_name desc;


