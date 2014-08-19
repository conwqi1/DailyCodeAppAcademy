# 1. Show the population of Germany
SELECT
  population
FROM
  world
WHERE
  name = 'Germany';
  
# 2. Show the name and per capita gdp: gdp/population for each country where
#    the area is over 5,000,000 km^2
SELECT
  name, gdp / population
FROM
  world
WHERE
  area > 5000000;  
  
# 3. Show the name and continent where the area is less than 2000 and the gdp
#    is more than 5,000,000,000
SELECT
  name, continent
FROM
  world
WHERE
  area < 2000 AND gdp > 5000000000;
  
# 4. Show the name and the population for 'Denmark', 'Finland', 'Norway', and
#    'Sweden'
SELECT
  name, population
FROM
  world
WHERE
  name IN ('Denmark', 'Finland', 'Norway', 'Sweden');
  
# 5. Show each country that begins with G
SELECT
  name
FROM
  world
WHERE  
  name LIKE 'G%';
  
# 6. Show countries with an area between 200,000 and 250,000. Show the area
#    in 1000 square km. Show area / 1000 instead of area
SELECT 
  name, area / 1000
FROM
  world
WHERE
  area BETWEEN 200000 AND 250000;