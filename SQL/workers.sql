CREATE DATABASE IF NOT EXISTS workers;

USE workers;

#Table for every person with NOT NULL fields
#Work position will be after this table in another one

CREATE TABLE IF NOT EXISTS person(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    salary BIGINT NOT NULL
);

#Insert values in table

INSERT INTO person (id, first_name, last_name, salary) 
VALUES (null, 'Caleb', 'Smith', 540000);

INSERT INTO person (id, first_name, last_name, salary) 
VALUES (null, 'Oleg', 'Gregoryn', 36000);

INSERT INTO person (id, first_name, last_name, salary) 
VALUES (null, 'Kirill', 'Makarov', 70000);

INSERT INTO person (id, first_name, last_name, salary) 
VALUES (null, 'Max', 'Kazakov', 7700);

INSERT INTO person (id, first_name, last_name,salary) 
VALUES (null, 'Brant', 'Rivera', 8000);

#Table for work's position

CREATE TABLE IF NOT EXISTS work_position(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
    work_position VARCHAR(30) NOT NULL
);

#Insert some work_position

INSERT INTO work_position (id, work_position)
VALUES (null, 'Junior programmer');

INSERT INTO work_position (id, work_position)
VALUES (null, 'Senior programmer');

INSERT INTO work_position (id, work_position)
VALUES (null, 'Middle programmer');

INSERT INTO work_position (id, work_position)
VALUES (null, 'Director');

#Add field work_position in person

ALTER TABLE person ADD work_position_id INTEGER NOT NULL;

#Add relationship between tables

UPDATE person SET work_position_id=4 WHERE id=1;
UPDATE person SET work_position_id=3 WHERE id=2;
UPDATE person SET work_position_id=2 WHERE id=3;
UPDATE person SET work_position_id=1 WHERE id IN (4,5);


#Print tables for testing with JOIN
SELECT pers.id, pers.first_name, pers.last_name, pos.work_position, pers.salary 
FROM person pers
INNER JOIN work_position pos ON pers.work_position_id = pos.id;

#Second task

#Select people with salary<30000
SELECT pers.id, pers.first_name, pers.last_name, pos.work_position, pers.salary 
FROM person pers
INNER JOIN work_position pos ON pers.work_position_id = pos.id
WHERE salary < 30000;

#Select people with defined work position and salare<30000
#For testing this new feature with defined name, salary are going to be less than 300000
SELECT pers.id, pers.first_name, pers.last_name, pos.work_position, pers.salary 
FROM person pers
INNER JOIN work_position pos ON pers.work_position_id = pos.id
WHERE salary < 300000 and work_position LIKE 'Mid%';


#Third task
CREATE TABLE IF NOT EXISTS bosses(
	bosses_id INT UNSIGNED NOT NULL,
    subordinates_id INT UNSIGNED,
    primary key (bosses_id, subordinates_id),
    FOREIGN KEY (bosses_id) REFERENCES person(id),
    FOREIGN KEY (subordinates_id) REFERENCES person(id)
);

#Insert values
#We suppose that Director is a chief above Middle and Senior
INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (1, 2);

INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (1, 3);

#Middle is a chief above Junior developers
INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (2, 4);

INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (2, 5);

#Senior is a chief above Middle
INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (3, 2);

#And Juniors have no subordinates
INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (4, null);

INSERT INTO bosses (bosses_id, subordinates_id)
VALUES (5, null);

#Select subbordinates for boss №1
SELECT first_name, last_name FROM person 
WHERE id IN (
SELECT subordinates_id FROM bosses 
WHERE bosses_id=1);

#Select bosses for subordinate №2
SELECT first_name, last_name FROM person 
WHERE id IN (
SELECT bosses_id FROM bosses 
WHERE subordinates_id=2);