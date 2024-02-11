-- Some of the SQL commands used to create the database. For personal reference.

-- Before this, the 4 celestial body tables were created with a 'table_name_id SERIAL' column.

-- Add Columns to Galaxy (5 cols)
ALTER TABLE galaxy
ADD COLUMN name VARCHAR(20) NOT NULL UNIQUE,
ADD COLUMN mass INT NOT NULL,
ADD COLUMN diameter INT,
ADD COLUMN distance_from_earth INT
;

-- Add Columns to Star (5 cols)
ALTER TABLE star
ADD COLUMN name VARCHAR(20) NOT NULL UNIQUE,
ADD COLUMN mass INT NOT NULL,
ADD COLUMN diameter INT,
ADD COLUMN brightness NUMERIC(4,1),
ADD COLUMN galaxy_id INT,
ADD CONSTRAINT fk_galaxy
   	FOREIGN KEY(galaxy_id) 
        REFERENCES galaxy(galaxy_id)
;

-- Add Columns to Planet (5 cols)
ALTER TABLE planet
ADD COLUMN name VARCHAR(20) NOT NULL UNIQUE,
ADD COLUMN mass INT NOT NULL,
ADD COLUMN diameter INT,
ADD COLUMN discovered_by TEXT,
ADD COLUMN star_id INT,
ADD CONSTRAINT fk_star
   	FOREIGN KEY(star_id) 
        REFERENCES star(star_id)
;

-- Add Columns to Moon (5 cols)
ALTER TABLE moon
ADD COLUMN name VARCHAR(20) NOT NULL UNIQUE,
ADD COLUMN mass INT NOT NULL,
ADD COLUMN diameter INT,
ADD COLUMN has_oxygen BOOLEAN,
ADD COLUMN has_helium BOOLEAN,
ADD COLUMN planet_id INT,
ADD CONSTRAINT fk_planet
   	FOREIGN KEY(planet_id) 
        REFERENCES planet(planet_id)
;

-- Create Planet Habitants Table (At least 3 cols)
CREATE TABLE planet_habitants(
	planet_habitants_id SERIAL,
	name VARCHAR(40) NOT NULL UNIQUE,
    height INT NOT NULL,
	planet_id INT UNIQUE NOT NULL,
	PRIMARY KEY(planet_habitants_id),
	CONSTRAINT fk_planet
   		FOREIGN KEY(planet_id) 
      			REFERENCES planet(planet_id)
);

-- Galaxy Rows (at least 6)
INSERT INTO galaxy(galaxy_id, name, mass)
VALUES(1, 'Eye of God', 450),
    (2, 'Andromeda', 7400),
    (3, 'Condor', 8600),
    (4, 'Cosmos', 3100),
    (5, 'Needle', 2700),
    (6, 'Spider', 5500);
    
-- Star Rows (at least 6)
INSERT INTO star(star_id, name, mass, galaxy_id)
VALUES(1, 'Acrab', 350, 6),
    (2, 'Acrux', 450, 5),
    (3, 'Rana', 700, 4),
    (4, 'Tangra', 200, 3),
    (5, 'Wurren', 420, 2),
    (6, 'Zembra', 300, 1)
  ;
    
-- Planet Rows (at least 12)
INSERT INTO planet(planet_id, name, mass, star_id)
VALUES (1, 'Planet1', 20, 1),
(2, 'Planet2', 22, 1),
(3, 'Planet3', 24, 2),
(4, 'Planet4', 26, 2),
(5, 'Planet5', 28, 3),
(6, 'Planet6', 30, 3),
(7, 'Planet7', 32, 4),
(8, 'Planet8', 38, 4),
(9, 'Planet9', 42, 5),
(10, 'Planet10', 58, 5),
(11, 'Planet11', 70, 6),
(12, 'Planet12', 15, 6)
;

-- Moon Rows (at least 20)
INSERT INTO moon(moon_id, name, mass, planet_id)
VALUES (1, 'Moon1', 982, 1),
(2, 'Moon2', 859, 1),
(3, 'Moon3', 859, 2),
(4, 'Moon4', 840, 2),
(5, 'Moon5', 830, 3),
(6, 'Moon6', 820, 3),
(7, 'Moon7', 810, 4),
(8, 'Moon8', 790, 5),
(9, 'Moon9', 770, 6),
(10, 'Moon10', 750, 7),
(11, 'Moon11', 710, 7),
(12, 'Moon12', 620, 8),
(13, 'Moon13', 590, 8),
(14, 'Moon14', 570, 9),
(15, 'Moon15', 530, 10),
(16, 'Moon16', 450, 11),
(17, 'Moon17', 420, 11),
(18, 'Moon18', 350, 10),
(19, 'Moon19', 210, 12),
(20, 'Moon20', 110, 12)
;

--  Planet Habitants Rows (at least 3)
INSERT INTO planet_habitants(planet_habitants_id, name, height, planet_id)
VALUES (1, 'John', 170, 4),
    (2, 'Peter', 160, 8),
    (3, 'Mark', 195, 9)
  ;
