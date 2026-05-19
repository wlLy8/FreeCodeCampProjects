-- change column name
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

-- change column constraints
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ADD CONSTRAINT uq_elements_symbol UNIQUE (symbol);
ALTER TABLE elements ADD CONSTRAINT uq_elements_name UNIQUE (name);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);


CREATE TABLE types (type_id INT PRIMARY KEY, type VARCHAR NOT NULL);

-- ZEILEN 18-20 noch anpassen
INSERT INTO types (type_id, type) VALUES (1, 'alcohol'), (2, 'acid'), (3, 'carbohydrate');
UPDATE types SET type = 'nonmetal'  WHERE type_id = 1;
UPDATE types SET type = 'metal'     WHERE type_id = 2;
UPDATE types SET type = 'metalloid' WHERE type_id = 3;

ALTER TABLE properties ADD COLUMN type_id INT;
ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);
UPDATE properties SET type_id = 1 WHERE type = 'nonmetal';
UPDATE properties SET type_id = 2 WHERE type = 'metal';
UPDATE properties SET type_id = 3 WHERE type = 'metalloid';
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;


-- capitalize the first letter of each symbol in the elements table
UPDATE elements SET symbol = UPPER(LEFT(symbol, 1)) || LOWER(SUBSTRING(symbol, 2));
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass = RTRIM(RTRIM(atomic_mass::text, '0'), '.')::numeric;
-- add values
INSERT INTO elements (atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
ALTER TABLE properties DROP COLUMN type;
INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (9, 18.998, -220, -188.1, 1), (10, 20.18, -248.6, -246.1, 1);


-- drop a row
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;