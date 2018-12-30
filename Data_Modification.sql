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