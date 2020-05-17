SELECT origin, AVG(arrDelay) AS prom_arribades, AVG(depDelay) AS prom_sortides
FROM flights
GROUP BY origin;