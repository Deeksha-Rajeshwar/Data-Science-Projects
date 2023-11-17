-- Task 1 -- 
use sakila
select concat(first_name,' ', last_name) as 'Full Name' from actor

-- Task 2 --
-- Part A --
select first_name ,count(first_name) as counting from actor group by first_name

-- Part B --
select count(first_name) as count,first_name from actor group by first_name having count(first_name) = 1

-- Task 3 --
-- Part A --
select last_name, count(last_name) as LastName from actor group by last_name

-- Part B --
select distinct(last_name) from actor

-- Task 4 --
-- Part A --
select title from film where rating='R'

-- Part B --
select title from film where rating !='R'

-- Part C --
select title from film where rating ='PG' or rating='G'

-- Task 5 --
-- Part A --
select title , replacement_cost from film where replacement_cost<=11

-- Part B --
select title , replacement_cost from film where replacement_cost between 11 and 20

-- Part C --
select * from film order by replacement_cost desc

-- Task 6 --
select f.title, count(a.actor_id) as actor_count from film as f 
join film_actor as fa on f.film_id=fa.film_id
join actor as a on fa.actor_id=a.actor_id
group by f.film_id
order by actor_count desc
limit 3

-- Task 7 --
select title from film where title like 'K%' or title like'Q%'

-- Task 8 --
select a.first_name,a.last_name from actor as a join 
film_actor as fa on fa.actor_id=a.actor_id 
join film as f on  f.film_id=fa.film_id
where title ='Agent Truman'

-- Task 9 --
select title from film join film_category as fc on film.film_id = fc.film_id
join category as c on fc.category_id=c.category_id where c.name='Family'

-- Task 10 --
-- Part A --
select max(rental_rate) as Maximum, min(rental_rate) as Minimum,round(avg(rental_rate),2) as Average from film group by rating order by Average desc

-- Part B --
select f.title , count(r.rental_id) as Rental_count from film as f join inventory as i on f.film_id=i.film_id
join rental r on i.inventory_id=r.inventory_id group by f.title order by Rental_count desc


-- Task 11 --
select c.name, round(avg(f.replacement_cost),2) as avg_replacement_cost,round(avg(f.rental_rate),2) as avg_rental_rate
from film f join film_category as fc on fc.film_id=f.film_id join category as c on c.category_id = fc.category_id    
group by c.name having (AVG(f.replacement_cost) - AVG(f.rental_rate)) > 15;


-- Task 12 --
select c.name, COUNT(fc.film_id) as counting from category as c join film_category as fc on fc.category_id=c.category_id group by c.name
having counting>70 
