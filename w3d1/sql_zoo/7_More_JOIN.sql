# 1
SELECT
  id, title
FROM
  movie
WHERE
  yr=1962
  
# 2
SELECT
  yr
FROM
  movie
WHERE
  title='Citizen Kane'
  
# 3
SELECT
  id, title, yr
FROM
  movie
WHERE
  title LIKE '%Star Trek%'
ORDER BY
  yr

# 4
SELECT
  title
FROM
  movie
WHERE
  id IN (11768, 11955, 21191)
  
# 5
SELECT
  id
FROM
  actor
WHERE
  name='Glenn Close'
  
# 6
SELECT
  id
FROM
  movie
WHERE
  title='Casablanca'

# 7
SELECT
  a.name
FROM
  casting c JOIN actor a ON c.actorid=a.id
WHERE
  c.movieid=(SELECT id FROM movie WHERE title='Casablanca')
  
# 8
SELECT
  a.name
FROM
  casting c JOIN actor a ON c.actorid=a.id
WHERE
  c.movieid=(SELECT id FROM movie WHERE title='Alien')
  
# 9
SELECT 
  title
FROM
  movie
JOIN
  casting
ON
  movie.id = casting.movieid
JOIN
  actor
ON 
  actor.id = casting.actorid
WHERE
  actor.name = "Harrison Ford"
  
# 10
SELECT
  title
FROM
  movie
JOIN 
  casting
ON
  movie.id = casting.movieid
JOIN
  actor
ON
  actor.id = casting.actorid
WHERE
  ord != 1 AND actor.name = "Harrison Ford"
  
  #11
SELECT
  title, actor.name
FROM
  movie
JOIN 
  casting
ON
  movie.id = casting.movieid
JOIN
  actor
ON
  actor.id = casting.actorid
WHERE
  ord = 1 AND yr = 1962
  
  #12
SELECT 
  yr,COUNT(title) 
FROM
  movie 
JOIN 
  casting 
ON 
  movie.id=movieid
JOIN 
  actor   
ON
  actorid=actor.id
WHERE 
  name='John Travolta'
GROUP BY 
  yr
HAVING 
  COUNT(title)=(SELECT MAX(c) 
                FROM
                  (SELECT yr,COUNT(title) AS c 
                      FROM
                        movie 
                      JOIN 
                        casting 
                      ON 
                        movie.id=movieid
                      JOIN 
                        actor   
                      ON 
                        actorid=actor.id
                      WHERE name='John Travolta'
                      GROUP BY yr) 
                      AS t
                      )
# 13
SELECT
  title, actor.name
FROM
  movie
JOIN
  casting
ON
  movie.id=movieid
JOIN
  actor
ON
  actor.id=actorid
WHERE
ord = 1 AND movieid IN (
  SELECT
   movieid
  FROM
    movie 
  JOIN 
    casting 
  ON 
    movie.id=movieid
  JOIN 
    actor   
  ON
    actorid=actor.id
  WHERE 
    actor.name='Julie Andrews'
)

# 14
SELECT
  name
FROM
  actor
JOIN
  casting
ON
  actorid=actor.id
JOIN
  movie
ON
  movieid=movie.id
WHERE
  ord = 1
GROUP BY
  name
HAVING
  COUNT(name) >= 30
ORDER BY
  name
  
# 15
SELECT
  title, COUNT(actorid) cast_size
FROM
  actor
JOIN
  casting
ON
  actorid=actor.id
JOIN
  movie
ON
  movieid=movie.id
WHERE
  yr = 1978 
GROUP BY
  title
ORDER BY DESC
  COUNT(actorid)
  
# 16
SELECT
  name
FROM
  actor
JOIN
  casting
ON
  actorid=actor.id
JOIN
  movie
ON  
  movieid=movie.id
WHERE
  name != 'Art Garfunkel' AND
  movieid IN (
    SELECT
     movieid
    FROM
      movie 
    JOIN 
      casting 
    ON 
      movie.id=movieid
    JOIN 
      actor   
    ON
      actorid=actor.id
    WHERE 
      actor.name='Art Garfunkel'
    )
GROUP BY
  name
ORDER BY
  actorid