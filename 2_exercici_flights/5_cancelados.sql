SELECT 	uniqueCarrier, colYear, colMonth, SUM(cancelled) AS cancelados
FROM flights
GROUP BY uniqueCarrier, colYear, colMonth
ORDER BY cancelados DESC;