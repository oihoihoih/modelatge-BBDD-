SELECT city, colYear, colMonth, AVG(ArrDelay) AS retard_arribades
FROM flights
INNER JOIN USAirports
ON flights.origin = USAirports.iata
GROUP BY city, colyear, colmonth
ORDER BY city ASC;