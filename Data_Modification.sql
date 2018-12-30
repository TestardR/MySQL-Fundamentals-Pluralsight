-- INSERT Statement

USE sakila;

CREATE TABLE ActorSample
(
    actor_id SMALLINT(5)
    UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR
    (45) NOT NULL,
    last_name VARCHAR
    (45) NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
		ON
    UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY
    (actor_id)
);

    -- Insert Single Row
    INSERT INTO sakila.actorsample
        (first_name, last_name, last_update)
    VALUES
        ('Pinal', 'Dave', '2013-04-05');
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Insert Single Row
    INSERT INTO sakila.actorsample
        (first_name, last_name, last_update)
    VALUES
        ('Romain', 'Testard', '2013-04-16');
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Insert Single Row
    INSERT INTO sakila.actorsample
        (first_name, last_name)
    VALUES
        ('Vanessa', 'Renaud');
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Insert Single Row
    INSERT INTO sakila.actorsample
        (first_name)
    VALUES
        ('William');
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Insert Single Row
    INSERT INTO sakila.actorsample
        (first_name, last_name, last_update)
    VALUES
        ('Roger', NULL, DEFAULT);
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Insert Multiple values
    INSERT INTO sakila.actorsample
        (first_name, last_name, last_update)
    VALUES
        ('Martin', 'Jay', DEFAULT),
        ('André', 'Solter', DEFAULT),
        ('Quentin', 'Trainesl', DEFAULT);
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Subquery
    INSERT INTO sakila.actorsample
        (first_name, last_name, last_update)
    SELECT first_name, last_name, last_update
    FROM actor
    WHERE first_name = 'Nick';
    -- Check Data
    SELECT *
    FROM ActorSample;

    -- Clean up
    DROP TABLE ActorSample;


    -- UPDATE Statement


    USE sakila;

    -- Populate Sample Table
    CREATE TABLE ActorSample
    (
        actor_id SMALLINT(5)
        UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR
        (45) NOT NULL,
    last_name VARCHAR
        (45) NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON
        UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY
        (actor_id)
);

        INSERT INTO sakila.actorsample
            (first_name, last_name, last_update)
        SELECT first_name, last_name, last_update
        FROM sakila.actor;

        -- Check Data
        SELECT first_name fm
        FROM sakila.actorsample
        ORDER BY fm DESC;

        -- Update Single Row Single Column
        UPDATE sakila.ActorSample
SET first_name='Romain'
WHERE actor_id = 1;
        UPDATE sakila.ActorSample
SET first_name='Vanessa'
WHERE actor_id = 2;

        -- Update Multiple Rows Single Column
        UPDATE sakila.actorsample
SET first_name = 'Romano'
WHERE actor_id IN (1,2,3,4,5);

        -- Check Data
        SELECT first_name
        FROM sakila.actorsample
        WHERE actor_id BETWEEN 1 AND 5;

        -- Update Multiple Rows and Multiple Columns
        UPDATE sakila.actorsample
SET first_name = 'Romano',
	last_name = 'Testard',
	last_update = DEFAULT
WHERE actor_id IN (1,2,3,4,5);

        -- Check Data
        SELECT first_name, last_name, last_update
        FROM sakila.actorsample
        WHERE actor_id BETWEEN 1 AND 5;


        -- DELETE Statement


        USE sakila;

        -- Delete Single Row
        DELETE
FROM sakila.actorsample
WHERE actor_id = 1;
        -- Check Data
        SELECT *
        FROM sakila.actorsample;

        -- DELETE Multiple Rows
        DELETE 
FROM sakila.actorsample
WHERE actor_id IN (3, 4, 5);
        -- Check Data
        SELECT *
        FROM sakila.actorsample;

        -- Delete using SELECT Statement (works the same with UPDATE)
        DELETE
FROM sakila.actorsample
WHERE actor_id IN (SELECT actor_id
        FROM film_actor
        WHERE film_id = 1);
        -- Check Data
        SELECT *
        FROM sakila.actorsample;

        -- Delete all Rows from Table
        DELETE
FROM sakila.ActorSample;

        -- Clean up
        DROP TABLE ActorSample;



