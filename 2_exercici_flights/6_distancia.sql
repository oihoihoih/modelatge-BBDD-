SELECT tailNum, SUM(distance) AS total_distancia
FROM flights
GROUP BY tailNum
ORDER BY total_Distancia DESC
LIMIT 10
OFFSET 1
;