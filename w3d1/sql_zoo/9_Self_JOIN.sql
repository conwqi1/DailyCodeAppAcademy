# 1
SELECT
  COUNT(*)
FROM
  stops

# 2
SELECT
  id
FROM
  stops
WHERE
  name='Craiglockhart'
  
-- 3

  
-- 4
SELECT 
  company, num, COUNT(*)
FROM 
  route 
WHERE 
  stop=149 OR stop=53
GROUP BY 
  company, num
HAVING
  COUNT(*)=2
  
-- 5
SELECT 
  a.company, a.num, a.stop, b.stop
FROM 
  route a 
JOIN 
  route b 
ON
  (a.company=b.company AND a.num=b.num)
WHERE
  a.stop=(SELECT id FROM stops WHERE name='Craiglockhart') AND
  b.stop=(SELECT id FROM stops WHERE name='London Road')
  
-- 6
SELECT 
  a.company, a.num, stopa.name, stopb.name
FROM
  route a 
JOIN 
  route b
ON
  (a.company=b.company AND a.num=b.num)
JOIN 
  stops stopa
ON
  (a.stop=stopa.id)
JOIN
  stops stopb
ON
  (b.stop=stopb.id)
WHERE
  stopa.name='Craiglockhart' AND stopb.name='London Road'
  
-- 7
SELECT 
  a.company, a.num
FROM
  route a 
JOIN 
  route b
ON
  (a.company=b.company AND a.num=b.num)
JOIN 
  stops stopa
ON
  (a.stop=stopa.id)
JOIN
  stops stopb
ON
  (b.stop=stopb.id)
WHERE
  stopa.name='Haymarket' AND stopb.name='Leith'
GROUP BY
  a.num
ORDER BY
  a.stop
  
-- 8
SELECT
a.company, a.num
FROM
  route a 
JOIN 
  route b
ON
  (a.company=b.company AND a.num=b.num)
JOIN 
  stops stopa
ON
  (a.stop=stopa.id)
JOIN
  stops stopb
ON
  (b.stop=stopb.id)
WHERE
  stopa.name='Craiglockhart' AND stopb.name='Tollcross'
    
-- 9
SELECT 
  stopb.name, a.company, a.num
FROM
  route a 
JOIN 
  route b
ON
  (a.company=b.company AND a.num=b.num)
JOIN 
  stops stopa
ON
  (a.stop=stopa.id)
JOIN
  stops stopb
ON
  (b.stop=stopb.id)
WHERE
  stopa.id IN (SELECT stops.id FROM stops WHERE stops.name='Craiglockhart')
ORDER BY
  a.stop
  
-- 10
