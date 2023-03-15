-- DDL (Data Definition LAnguage) Statements

-- Syntax:
-- CREATE TABLE table_name( col_name DATA_TYPE, ...)
-- table_name -> all lowercase and singular form



-- Create the customer table
CREATE TABLE customer(
-- column_name DATATYPE <CONSTRAINTS>,
customer_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NOTNULL 
first_name VARCHAR(50) NOT NULL, -- NOT NULL menas that this COLUMN cannot be EMPTY 
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
address VARCHAR(100),
loyalty_member BOOLEAN DEFAULT FALSE 
);

-- Confirm customer table was created
SELECT *
FROM customer;

-- To make any changes to the table once it is created, use the ALTER statement

-- Add column to the table
-- ALTER TABLE table_name_to_alter ADD COLUMN new_col_name DATATYPE

ALTER TABLE customer 
ADD COLUMN username VARCHAR(25);

SELECT *
FROM customer;

-- Change the name of a column 
-- ALTER TABLE table_name RENAME COLUMN current_col_name TO new_col_name
ALTER TABLE customer
RENAME COLUMN email TO email_address;

SELECT *
FROM customer;

-- Create Order Table with a Foreign Key Customer table
CREATE TABLE "order"(
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP DEFAUTL CURRENT_TIMESTAMP,
    date_shipped TIMESTAMP,
    customer_id INTEGER NOT NULL, -- CREATE COLUMN FIRST
    -- Add Foreign key second
    -- FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM "order";

-- Create Order-Product Table (join table between the Order and Product tables - Many-to-Many relationship)
CREATE TABLE order_product(
    order_id INTEGER NOT NULL,
    FOREIGN KEY(order_id) REFERENCES "order"(order_id),
    product_id INTEGER NOT NULL,
  --  FOREIGN KEY (product_id) REFERENCES product(product_id) -- CANNOT REFERENCE A TABLE THAT DOES NOT EXIST!
);

-- Create Product table AND THEN alter order_product table to add foreign key
CREATE TABLE product(
    product_id SERIAL PRIMARY KEY,
    prod_name VARCHAR(50),
    description VARCHAR(200),
    price NUMERIC(5,2),
    quantity INTEGER
 );
 
-- Alter the order_product to add the foreign key
ALTER TABLE order_product
ADD FOREIGN KEY(product_id) REFERENCES product(product_id);

SELECT *
FROM product;

--SELECT *
--FROM information_schema.TABLES;

--RENAME a table
--ALTER TABLE table_name RENAME TO new_name;
ALTER TABLE product
RENAME TO item;


-- Create a seller table
CREATE TABLE seller( 
    seller_id SERIAL PRIMARY KEY,
    seller_name VARCHAR(50) NOT NULL,
    description VARCHAR(50),
    address VARCHAR(100)
);

-- Add the seller_id column to Item (formely product) and reference new seller TABLE 

ALTER TABLE  item 
ADD COLUMN seller_id INTEGER NOT NULL;
-- Add FK
ALTER TABLE item 
ADD FOREIGN KEY(seller_id)  REFERENCES seller_id);

-- Create a test table that we will eventually delete
CREATE TABLE test(
   test_id SERIAL PRIMARY KEY,
   col_1 INTEGER,
   col_2 BOOLEAN 
);

-- Drop a column
-- ALTER TABLE table_name DROP COLUMN col_name;
-- BE VERY CAREFUL WITH DROP - NO UNDOING!

ALTER TABLE test 
DROP COLUMN col_1;

SELECT *
FROM test;

-- Remove a table completely use DROP TABLE
-- * IF EXIST will only drop if the table exists; otherwise will skip

DROP TABLE IF EXISTS test;
