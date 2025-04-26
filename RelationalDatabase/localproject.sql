CREATE TABLE place ();

CREATE TABLE galaxy ();
CREATE TABLE moon ();
CREATE TABLE planet ();
CREATE TABLE star ();
CREATE TABLE place ();

ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL PRIMARY KEY NOT NULL;
ALTER TABLE moon ADD COLUMN moon_id SERIAL PRIMARY KEY NOT NULL;
ALTER TABLE planet ADD COLUMN planet_id SERIAL PRIMARY KEY NOT NULL;
ALTER TABLE star ADD COLUMN star_id SERIAL PRIMARY KEY NOT NULL;
ALTER TABLE place ADD COLUMN id SERIAL PRIMARY KEY NOT NULL;

-- table moon
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(id),
ADD COLUMN name TEXT,
ADD COLUMN has_life BOOLEAN,
ADD COLUMN is_spherical BOOLEAN,
ADD COLUMN age_in_millions_of_years INT,
ADD COLUMN galaxy_types INT,
ADD COLUMN distance_from_earth INT;
INSERT INTO moon (planet_id, name, has_life, is_spherical, age_in_millions_of_years, galaxy_types, distance_from_earth) 
VALUES 
(1, 'Moon', TRUE, TRUE, 4.5, 1, 384400),
(2, 'Europa', FALSE, TRUE, 4.5, 1, 628300000),
(3, 'Titan', FALSE, TRUE, 4.5, 1, 1275000),
(3, 'Ganymede', FALSE, TRUE, 4.5, 1, 1070400),
(3, 'Callisto', FALSE, TRUE, 4.5, 1, 1882700),
(3, 'Io', FALSE, TRUE, 4.5, 1, 421700),
(4, 'Enceladus', FALSE, TRUE, 4.5, 1, 2379480),
(4, 'Triton', FALSE, TRUE, 4.5, 1, 3548000),
(4, 'Rhea', FALSE, TRUE, 4.5, 1, 527400),
(5, 'Dione', FALSE, TRUE, 4.5, 1, 561700),
(5, 'Iapetus', FALSE, TRUE, 4.5, 1, 3563000),
(6, 'Miranda', FALSE, TRUE, 4.5, 1, 1290000),
(7, 'Ariel', FALSE, TRUE, 4.5, 1, 1158000),
(8, 'Umbriel', FALSE, TRUE, 4.5, 1, 2660000),
(9, 'Titania', FALSE, TRUE, 4.5, 1, 4360000),
(10, 'Oberon', FALSE, TRUE, 4.5, 1, 5835000),
(11, 'Phoebe', FALSE, TRUE, 4.5, 1, 1290000),
(12, 'Hyperion', FALSE, TRUE, 4.5, 1, 1360000),
(1, 'Mimas', FALSE, TRUE, 4.5, 1, 1856000),
(2, 'Enceladus', FALSE, TRUE, 4.5, 1, 2379480);

-- table planet → 12 rows
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(id),
ADD COLUMN name TEXT,
ADD COLUMN has_life BOOLEAN,
ADD COLUMN is_spherical BOOLEAN,
ADD COLUMN age_in_millions_of_years INT,
ADD COLUMN galaxy_types INT,
ADD COLUMN distance_from_earth NUMERIC;
INSERT INTO planet (star_id, name, has_life, is_spherical, age_in_millions_of_years, galaxy_types, distance_from_earth) 
VALUES 
(1, 'Earth', TRUE, TRUE, 4500, 1, 0),
(1, 'Mars', FALSE, TRUE, 4500, 1, 225),
(1, 'Jupiter', FALSE, TRUE, 4500, 1, 778.5),
(1, 'Saturn', FALSE, TRUE, 4500, 1, 1434),
(1, 'Venus', FALSE, TRUE, 4500, 1, 108.2),
(1, 'Mercury', FALSE, TRUE, 4500, 1, 77.3),
(1, 'Uranus', FALSE, TRUE, 4500, 1, 2871),
(1, 'Neptune', FALSE, TRUE, 4500, 1, 4495),
(1, 'Pluto', FALSE, TRUE, 4500, 1, 5906),
(2, 'Proxima b', FALSE, TRUE, 4850, 1, 4.2),
(3, 'Alpha Centauri Bb', FALSE, TRUE, 4600, 1, 4.37),
(4, 'Barnard''s Star b', FALSE, TRUE, 10000, 1, 5.958);

-- table star → 6 rows
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(id),
ADD COLUMN name TEXT,
ADD COLUMN has_life BOOLEAN,
ADD COLUMN is_spherical BOOLEAN,
ADD COLUMN age_in_millions_of_years INT,
ADD COLUMN galaxy_types INT,
ADD COLUMN distance_from_earth NUMERIC;
INSERT INTO star (galaxy_id, name, has_life, is_spherical, age_in_millions_of_years, galaxy_types, distance_from_earth) 
VALUES 
(1, 'Sun', FALSE, TRUE, 4600, 1, 0),
(1, 'Proxima Centauri', FALSE, TRUE, 4850, 1, 4.246),
(1, 'Alpha Centauri', FALSE, TRUE, 4600, 1, 4.37),
(1, 'Barnard''s Star', FALSE, TRUE, 10000, 1, 5.958),
(1, 'Sirius', FALSE, TRUE, 242, 1, 8.611),
(1, 'Betelgeuse', FALSE, TRUE, 10000, 1, 642.5);

-- table galaxy → 6 rows
ALTER TABLE galaxy ADD COLUMN name TEXT,
ADD COLUMN has_life BOOLEAN,
ADD COLUMN is_spherical BOOLEAN,
ADD COLUMN age_in_millions_of_years INT,
ADD COLUMN galaxy_types INT,
ADD COLUMN distance_from_earth NUMERIC;
INSERT INTO galaxy (name, has_life, is_spherical, age_in_millions_of_years, galaxy_types, distance_from_earth) 
VALUES 
('Milky Way', FALSE, TRUE, 13600, 1, 0),
('Andromeda', FALSE, TRUE, 10000, 1, 2537000),
('Triangulum', FALSE, TRUE, 10000, 1, 3200000),
('Large Magellanic Cloud', FALSE, TRUE, 1101, 1, 163000),
('Small Magellanic Cloud', FALSE, TRUE, 6500, 1, 200000),
('Centaurus A', FALSE, TRUE, 12000, 1, 13700000);

-- table place → 3 rows
ALTER TABLE place ADD COLUMN name TEXT,
ALTER TABLE ADD COLUMN moon_id INT, ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES moon(moon_id);
ALTER TABLE ADD COLUMN planet_id INT, ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
INSERT INTO place (name, moon_id, planet_id) 
VALUES 
('Apollo 11 Landing Site', (SELECT moon_id FROM moon WHERE name = 'Moon'), 1),
('Olympus Mons', NULL, 2),
('Great Red Spot', NULL, 3);
('Titan Sea', (SELECT moon_id FROM moon WHERE name = 'Titan'), 3),
('Europa Ice Fields', (SELECT moon_id FROM moon WHERE name = 'Europa'), 2),
('Enceladus Geysers', (SELECT moon_id FROM moon WHERE name = 'Enceladus'), 4);