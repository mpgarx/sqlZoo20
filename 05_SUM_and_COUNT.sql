--################################
--#
--#  05 SUM and COUNT
--#
--################################


-- 1. Show the total population of the world

SELECT SUM(population)
   FROM world;
  
-- 2. List all the continents - just once each

SELECT DISTINCT continent
   FROM world;
		   
-- 3. Give the total GDP of Africa
 
SELECT SUM(gdp)
   FROM world
  WHERE continent = 'Africa';

-- 4. How many countries have an area of at least 1000000 (6 zeros) 

SELECT COUNT(name)
   FROM world
  WHERE area >= 1000000;

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
   FROM world
  WHERE name IN('Estonia', 'Latvia', 'Lithuania');

-- 6. For each continent show the continent and number of countries

--  Using GROUP BY and HAVING:
--      
--  - GROUP BY continent - get only one row for each different value of continent
--  - HAVING clause (after GROUP BY) allows use to filter the groups which are displayed
--  - WHERE clause filters rows
--  - If ORDER BY clause is included we can refer to columns by their position

SELECT continent, COUNT(name)
   FROM world
GROUP BY continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10 million

SELECT continent, COUNT(name)
   FROM world
 WHERE population >= 10E6
GROUP BY continent;

-- 8. List the continents that have a total population of at least 100 million

SELECT continent
   FROM world
GROUP BY continent
  HAVING SUM (population) >=100E6;