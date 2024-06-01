-- How many distinct (different) actors' last names are there?
select count(distinct last_name) as number_of_distinct_last_names
from actor;

-- In how many different languages where the films originally produced?
select count(distinct language_id) as number_of_languages
from film;

-- How many movies were released with "PG-13" rating?
select count(*) as numbers_of_movies_pg13_rating
from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
select title, length
from film
where release_year = 2006
order by length desc
limit 10;

--  How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(CURDATE(), create_date) as number_of_days
FROM customer;

-- Show rental info with additional columns month and weekday. Get 20.
select
    rental_id,
    rental_date,
    month( rental_date) as rental_month,
    dayname(rental_date) as rental_weekday
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select 
	 rental_id,
     rental_date,
     dayname(rental_date) as rental_weekday,
     case
		 when dayofweek(rental_date) in (1,7) then 'weekend'
         else 'workday'
	 end as day_type
from rental;

-- How many rentals were in the last month of activity?
select count(rental_id) as rentals_activity
from rental
where rental_date >= DATE_SUB('2005-05-30', interval 1 month) and rental_date <= '2005-05-30';



