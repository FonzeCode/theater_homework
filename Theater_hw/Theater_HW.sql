-- Syntax:
-- Create Table


-- Create the customer table
CREATE TABLE customer(
       customer_id SERIAL PRIMARY KEY,
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       cel_number VARCHAR(50) NOT NULL,
       email VARCHAR(100)
);

-- Confirm customer table was created
SELECT *
FROM customer;

-- Create the payments table
CREATE TABLE payment(
       payment_id SERIAL PRIMARY KEY,
       pay_amount NUMERIC(5,2) NOT NULL,
       payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       customer_id INTEGER NOT NULL,
       FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Confirm payment table was created
SELECT *
FROM payment;

-- Create tickets table
CREATE TABLE ticket(
       ticket_id SERIAL PRIMARY KEY,
       price NUMERIC(5,2) NOT NULL,
       order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       date_played TIMESTAMP NOT NULL,
       payment_id INTEGER NOT NULL,
       movie_id INTEGER NOT NULL,
       theater_id INTEGER NOT NULL,
       FOREIGN KEY(payment_id) REFERENCES payment(payment_id),
       FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
       FOREIGN KEY(theater_id) REFERENCES theater(theater_id)
);

--Confirm ticket table was created
SELECT *
FROM ticket;

-- Create movie table
CREATE TABLE movie(
       movie_id SERIAL PRIMARY KEY,
       movie_name VARCHAR(50) NOT NULL,
       info VARCHAR(200) NOT NULL,
       date_played TIMESTAMP NOT NULL
);

--Confirm movie table was created
SELECT *
FROM movie;

--Create room table
CREATE TABLE room(
       romm_id SERIAL PRIMARY KEY,
       theater_id INTEGER NOT NULL,
       movie_id INTEGER NOT NULL,
       FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
       FOREIGN KEY(theater_id) REFERENCES theater(theater_id)     
);

--Confirm room table was created
SELECT *
FROM room;

--Create theater table
CREATE TABLE theater(
       theater_id SERIAL PRIMARY KEY,
       theater_name VARCHAR(50) NOT NULL
);

--Confirm theater table was created
SELECT *
FROM theater;
       
       