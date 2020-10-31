-- Lesson 1: SELECT queries 101

-- 1.
SELECT title FROM movies

-- 2.
SELECT director FROM movies

-- 3.
SELECT title, director FROM movies

-- 4.
SELECT title, year FROM movies

-- 5.
SELECT * FROM movies

-- Lesson 2: Queries with constraints (Pt. 1)

-- 1.
SELECT * FROM movies
WHERE id = 6

-- 2.
SELECT * FROM movies
WHERE year BETWEEN 2000 AND 2010

-- 3.
SELECT * FROM movies
WHERE year NOT BETWEEN 2000 AND 2010

-- 4.
SELECT * FROM movies
WHERE id IN (1, 2, 3, 4, 5)

-- Lesson 3: Queries with constraints (Pt. 2)

-- 1.
SELECT * FROM movies
WHERE title LIKE 'Toy Story%'

-- 2.
SELECT * FROM movies
WHERE director = 'John Lasseter'

-- 3.
SELECT * FROM movies
WHERE director <> 'John Lasseter'

-- 4.
SELECT * FROM movies
WHERE title LIKE 'WALL-%'

-- Lesson 4: Filtering and sorting Query results

-- 1.
SELECT DISTINCT(director) FROM movies
ORDER BY director

-- 2.
SELECT title FROM movies
ORDER BY year DESC LIMIT 4

-- 3.
SELECT title FROM movies
ORDER BY title LIMIT 5

-- 4.
SELECT title FROM movies
ORDER BY title LIMIT 5 OFFSET 5

-- Lesson 5: Simple SELECT queries

-- 1.
SELECT city, population FROM north_american_cities
WHERE country = 'Canada'

-- 2.
SELECT city, latitude FROM north_american_cities
WHERE country = 'United States'
ORDER BY latitude DESC

-- 3.
SELECT city, longitude FROM north_american_cities
WHERE longitude <
(SELECT longitude from north_american_cities WHERE city = 'Chicago')
ORDER BY longitude

-- 4.
SELECT city FROM north_american_cities
WHERE country = 'Mexico'
ORDER BY population DESC LIMIT 2

-- 5.
SELECT city FROM north_american_cities
WHERE country = 'United States'
ORDER BY population DESC LIMIT 2 OFFSET 2

-- Lesson 6: Multi-table queries with JOINs

-- 1.
SELECT title, domestic_sales, international_sales
FROM Movies JOIN Boxoffice ON id = movie_id

-- 2.
SELECT title, domestic_sales, international_sales
FROM Movies JOIN Boxoffice ON id = movie_id
WHERE international_sales > domestic_sales

-- 3.
SELECT title, rating
FROM Movies JOIN Boxoffice ON id = movie_id
ORDER BY rating DESC

-- Lesson 7: OUTER JOINs

-- 1.
SELECT DISTINCT(building) FROM Employees

-- 2.
SELECT * FROM Buildings

-- 3.
SELECT DISTINCT Building_name, Role
FROM Buildings LEFT JOIN Employees ON Building_name = Building

-- Lesson 8: A short note on NULLs

-- 1.
SELECT role, name
FROM Employees
WHERE building IS NULL

-- 2.
SELECT building_name
FROM Buildings LEFT JOIN Employees ON building_name = building
WHERE role IS NULL

-- Lesson 9: Queries with expressions

-- 1.
SELECT title, (domestic_sales + international_sales) / 1000000 as total_sales
FROM Movies JOIN Boxoffice on id = movie_id

-- 2.
SELECT title, rating * 10
FROM Movies JOIN Boxoffice on id = movie_id

-- 3.
SELECT title
FROM Movies JOIN Boxoffice on id = movie_id
WHERE year % 2 = 0

-- Lesson 10: Queries with aggregates (Pt. 1)

-- 1.
SELECT building, MAX(years_employed)
FROM Employees

-- 2.
SELECT role, AVG(years_employed)
FROM Employees
GROUP BY role

-- 3.
SELECT building, SUM(years_employed)
FROM Employees
GROUP BY building

-- Lesson 11: Queries with aggregates (Pt. 2)

-- 1.
SELECT COUNT(name)
FROM employees
WHERE role = 'Artist'

-- 2.
SELECT role, COUNT(*)
FROM employees
GROUP BY role

-- 3.
SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = 'Engineer'

-- Lesson 12: Order of execution of a Query

-- 1.
SELECT director, COUNT(*) FROM movies
GROUP BY director

-- 2.
SELECT director, SUM(domestic_sales) + SUM(international_sales) FROM movies JOIN Boxoffice on id = movie_id
GROUP BY director

-- Lesson 13: Inserting rows

-- 1.
INSERT INTO movies (id, title, director, year, length_minutes)
VALUES (15, 'Toy Story 4', 'John Lasseter', 2020, 105)

-- 2.
INSERT INTO boxoffice
(movie_id, rating, domestic_sales, international_sales)
VALUES (15, 8.7, 340000000, 270000000)

-- Lesson 14: Updating rows

-- 1.
UPDATE movies
SET director = 'John Lasseter'
WHERE title = 'A Bug''s Life'

-- 2.
UPDATE movies
SET year = 1999
WHERE title = 'Toy Story 2'

-- 3.
UPDATE movies
SET title = 'Toy Story 3', director = 'Lee Unkrich'
WHERE title = 'Toy Story 8'

-- Lesson 15: Deleting rows

-- 1.
DELETE FROM movies
WHERE year < 2005

-- 2.
DELETE FROM movies
WHERE director = 'Andrew Stanton'

-- Lesson 16: Creating tables

-- 1.
CREATE TABLE IF NOT EXISTS Database (
Name TEXT,
Version FLOAT,
Download_count INTEGER)

-- Lesson 17: Altering tables

-- 1.
ALTER TABLE movies
ADD Aspect_ratio FLOAT

-- 2.
ALTER TABLE movies
ADD Language TEXT
DEFAULT 'English'

-- Lesson 18: Dropping

-- 1.
DROP TABLE IF EXISTS Movies

-- 2.
DROP TABLE IF EXISTS Boxoffice
