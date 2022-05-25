
-- 1st query
select title from film where rating = 'PG-13' and film_id in (select film_id from film_category fc where fc.category_id = (select category_id from category where name = 'Comedy'));


-- 2nd query
select f.title from rental r 
join inventory i on r.inventory_id=i.inventory_id 
join film_category fc on i.film_id = fc.film_id
join category c on c.category_id = fc.category_id
join film f on f.film_id=fc.film_id
where c.name = 'Horror' 
group by r.inventory_id order by count(customer_id) desc limit 3;



-- 3rd query
select distinct cl.ID, cl.name, cl.country from customer_list cl 
join rental r on r.customer_id = cl.ID
join inventory i on r.inventory_id = i.inventory_id
join film_category fc on fc.film_id = i.film_id
join category c on fc.category_id = c.category_id
where cl.country='India' and c.name='Sports';

-- 4th query
select distinct r.customer_id, cl.name from rental r
join customer_list cl on cl.ID = r.customer_id
join inventory i on i.inventory_id = r.inventory_id
join film_actor fa on fa.film_id = i.film_id
join actor a on fa.actor_id = a.actor_id
where cl.country = 'Canada' and a.first_name='NICK' and a.last_name='WAHLBERG';

-- 5th query
select count(*) from film_actor fa
join actor a on a.actor_id = fa.actor_id
where a.first_name= 'SEAN' and a.last_name= 'WILLIAMS';








