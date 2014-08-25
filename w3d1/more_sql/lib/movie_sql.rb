require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Casablanca"; order by the
# actor's name.
def casablanca_cast
  MovieDatabase.execute(<<-SQL)
  SELECT
    a.name
  FROM
    actor a
  JOIN
    casting c ON a.id = c.actorid
  JOIN
    movie m ON m.id = c.movieid
  WHERE
    m.title = "Casablanca"
  ORDER BY
    a.name;
SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    m.title
  FROM
    movie m 
  JOIN
    casting c ON m.id = c.movieid
  JOIN
    actor a ON a.id = c.actorid
  WHERE
    a.name = 'Harrison Ford'
  ORDER BY 
    m.title;
SQL
end

# 3. List the films where 'Harrison Ford' has appeared, but not in the
# star role. Order by movie title.
def harrison_ford_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    m.title
  FROM
    movie m 
  JOIN
    casting c ON m.id = c.movieid
  WHERE
    c.ord != 1 AND c.actorid = (SELECT
                                  a.id
                                FROM
                                  actor a
                                WHERE
                                  a.name = 'Harrison Ford')
  ORDER BY
    m.title;

SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    m.title, a.name
  FROM
    movie m
  JOIN 
    casting c ON m.id = c.movieid
  JOIN
    actor a ON a.id = c.actorid
  WHERE
    m.yr = 1962 AND c.ord = 1
  ORDER BY
    m.title;
SQL
end

# 5. Which were the busiest years for 'John Travolta'? List the year
# and the number of movies he made each year, for any year in which he
# made >2 movies. Order by year.
def busiest_john_travolta_years
  MovieDatabase.execute(<<-SQL)
  SELECT
    m.yr, COUNT(*) AS count
  FROM
    movie m 
  JOIN
    casting c ON m.id = c.movieid
  JOIN
    actor a ON a.id = c.actorid
  WHERE
    a.name = 'John Travolta'
  GROUP BY
    m.yr
  HAVING
    COUNT(*)>2;
SQL
end

# 6. List the film title and the leading actor for all of the films
# 'Julie Andrews' played in. Order by movie title name. Be careful!
# There is a movie (Pink Panther) in which Julie Andrews appears in
# two roles; do not double count the star of that film (Peter
# Sellers).
def julie_andrews_stars
  MovieDatabase.execute(<<-SQL)
  SELECT
    m.title, a.name
  FROM
    movie m 
  JOIN
    casting c ON m.id = c.movieid
  JOIN
    actor a ON a.id = c.actorid
  WHERE
    c.ord = 1 AND c.movieid in (SELECT
                                  DISTINCT(m.id)
                                FROM
                                  movie m 
                                JOIN
                                  casting c ON m.id = c.movieid
                                JOIN
                                  actor a ON a.id = c.actorid
                                WHERE
                                  a.name = 'Julie Andrews')
 ORDER BY
  m.title;
SQL
end

# 7. Obtain a list in alphabetical order of actors who've had >=30
# starring roles. Order by actor name.
def biggest_stars
MovieDatabase.execute(<<-SQL)
  SELECT
    a.name, COUNT(DISTINCT(m.id)) AS count
  FROM
    actor a
  JOIN
    casting c ON a.id = c.actorid
  JOIN 
    movie m ON c.movieid = m.id
  WHERE
    c.ord = 1
  GROUP BY
    a.name
  HAVING
    COUNT(DISTINCT(m.id)) >= 30
  ORDER BY
    a.name;
SQL
end

