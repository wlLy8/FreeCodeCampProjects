CREATE TABLE bikes (
    bike_id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,);
ALTER TABLE bikes ADD COLUMN size INT NOT NULL;
ALTER TABLE bikes ADD COLUMN available BOOLEAN NOT NULL DEFAULT TRUE; 

CREATE TABLE customers();
ALTER TABLE customers ADD customer_id SERIAL PRIMARY KEY;
ALTER TABLE customers ADD phone VARCHAR(15) NOT NULL UNIQUE;
ALTER TABLE customers ADD name VARCHAR(40) NOT NULL;

CREATE TABLE rentals();
ALTER TABLE rentals ADD rental_id SERIAL PRIMARY KEY;
ALTER TABLE rentals ADD customer_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY customer_id REFERENCES customers(customer_id);
ALTER TABLE rentals ADD bike_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY (bike_id) REFERENCES bikes(bike_id);
ALTER TABLE rentals ADD date_rented DATE NOT NULL DEFAULT NOW();
Alter TABLE rentals ADD date_returned DATE;

INSERT INTO bikes (type, size) VALUES ('Mountain', 27);
INSERT INTO bikes (type, size) VALUES ('Mountain', 28);
INSERT INTO bikes (type, size) VALUES ('Mountain', 29);
INSERT INTO bikes (type, size) VALUES ('Road', 27);
INSERT INTO bikes (type, size) VALUES ('Road', 28), ('Road', 29);
INSERT INTO bikes (type, size) VALUES ('BMX', 19), ('BMX', 20), ('BMX', 21);

-- Rest is done in bash
-- connect to the database bikes to proceed whenever you close programming and want to continue with the next steps