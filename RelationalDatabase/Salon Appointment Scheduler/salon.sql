--SAVE progress:
-- pg_dump -cC --inserts -U freecodecamp salon > salon.sql


-- RESUME BY RUNNING IN TERMINAL:
-- psql -U postgres < salon.sql


-- LOGIN TO POSTGRESQL:
-- psql --username=freecodecamp --dbname=postgres

CREATE DATABASE salon;
\c salon


CREATE TABLE customers (customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(15) NOT NULL UNIQUE,
    name VARCHAR(40) NOT NULL);


CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_ID INT NOT NULL, service_ID INT NOT NULL,
    time VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
    );

CREATE TABLE services (service_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
    );

INSERT INTO services (name) VALUES ('Cut'), ('Color'), ('Trim');