SELECT uniqueCarrier, AVG(arrDelay) AS retraso_medio
FROM flights
WHERE arrDelay > 10
GROUP BY uniqueCarrier	
ORDER BY uniqueCarrier ASC;