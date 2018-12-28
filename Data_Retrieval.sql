-- Retrive static value

SELECT 'MyFirstValue' AS SomeValue;

SELECT 1+1 AS TWO;

SELECT NOW() AS CURRENTDATE;

SELECT CURDATE();

SELECT CURTIME();

SELECT PI();

SELECT MOD(45,7);

SELECT SQRT(25);


-- Retrieve all the data from the table

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.country;

USE sakila
;
SELECT *
FROM city;


-- Retrive all the data ordered by single column 

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.actor
ORDER BY first_name;

SELECT *
FROM sakila.actor
ORDER BY last_name;

SELECT *
FROM sakila.actor
ORDER BY first_name DESC;

SELECT *
FROM sakila.actor
ORDER BY last_name DESC;

-- Retrieve selected columns from table

SELECT *
FROM sakila.actor;

SELECT first_name, last_name
FROM sakila.actor;

SELECT first_name, last_name
FROM sakila.actor
ORDER BY first_name DESC;


-- Retrive the data with filter condition

SELECT *
FROM sakila.actor
WHERE actor_id > 100;

SELECT *
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';


-- Retrieve the data with filter condition and ordered by columns

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick'
ORDER BY actor_id DESC;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100
ORDER BY first_name, last_name DESC;


-- Retrive empty result set

SELECT *
FROM sakila.actor
WHERE 1 = 2;


-- Retrive column names using aliases

SELECT rental_date, inventory_id, return_date
FROM sakila.rental;

SELECT
    rental_date AS RentalDate,
    inventory_id AS FilmListID,
    return_date AS ReturnDate
FROM sakila.rental;

SELECT replacement_cost-rental_rate,
    film_id AS FilmID,
    length/60
FROM sakila.film;

SELECT replacement_cost-rental_rate AS CostDiff,
    film_id AS FilmID,
    length/60 AS TimeInHour
FROM sakila.film;

SELECT replacement_cost AS ReplacementCost,
    replacement_cost / 5 AS DecimalRentalRate,
    replacement_cost DIV
5 AS IntegerRentalRate,
    replacement_cost % 5 AS RemainderRentalRate
FROM sakila.film;


-- Retrieve results based on function

-- Integer Operations

SELECT amount,
    ROUND(amount) Amnt, ROUND(amount, 1) Amnt1,
    FLOOR(amount) FloorAmnt, CEILING(amount) CeilingAmnt
FROM sakila.payment;

SELECT CEILING(4.49);

-- String Operations

-- Concat
SELECT CONCAT(first_name, ' ', last_name) AS FullName
FROM sakila.actor;

-- Left function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
    CONCAT(LEFT(first_name, 1), LEFT(last_name, 1)) AS FirstInitial
FROM sakila.actor;

-- LENGTH function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
    LENGTH(CONCAT(first_name, ' ' ,last_name)) AS Length
FROM sakila.actor;

-- Various function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
    REVERSE(CONCAT(first_name, ' ', last_name)) AS ReverseFullName,
    REPLACE(CONCAT(first_name, ' ', last_name), 'S', '$') AS ReplaceExample
FROM sakila.actor;


-- Date Operations

-- DATE_FORMAT function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
    DATE_FORMAT(last_update, '%m/%d/%y') AS LastUpdated1,
    DATE_FORMAT(last_update, '%d-%m-%y') AS LastUpdated2,
    DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdated3
FROM sakila.actor;

-- DATE_FORMAT with GET_FIRLAT function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
    DATE_FORMAT(last_update, GET_FORMAT(DATE, 'EUR')) AS EUR,
    DATE_FORMAT(last_update, GET_FORMAT(DATE, 'ISO')) AS ISO,
    DATE_FORMAT(last_update, GET_FORMAT(DATE, 'USA')) AS USA
FROM sakila.actor;

-- Other function
SELECT rental_date,
    DAYOFWEEK(rental_date) AS DayOfWeek,
    QUARTER(rental_date) AS Quarter,
    WEEK(rental_date) AS Week,
    MONTHNAME(rental_date) AS MonthName
FROM sakila.rental;


-- DISTINCT Operations

SELECT last_name
FROM sakila.actor;

SELECT DISTINCT last_name
FROM sakila.actor;


-- WHERE clause Comparison Operators

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id = 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id >= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name < 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name > 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name >= 'Nick';

-- Not equal (<> or !=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <> 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name != 'Nick';


-- WHERE clause Comparison Operators

-- AND

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 AND last_name='TORN';

-- OR

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100 OR last_name='TORN';

-- NOT
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT actor_id = 5;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 5;


-- All together

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND (actor_id < 100 OR last_name = 'TEMPLE');