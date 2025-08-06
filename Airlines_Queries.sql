--     "1. List all flights from Mumbai to Delhi sorted by departure time."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    source_city = 'Mumbai'
        AND destination_city = 'delhi'
ORDER BY departure_time;

--     "2. Which airline has the highest average ticket price?"
SELECT 
    airline, ROUND(AVG(price), 2) AS max_avg_price
FROM
    airlines_flights_data
GROUP BY airline
ORDER BY max_avg_price DESC
LIMIT 1;

--     "3. Show the number of flights operated by each airline."
SELECT 
    airline, COUNT(flight) total_flights
FROM
    airlines_flights_data
GROUP BY airline;

--     "4. Find the top 5 most frequent source cities."
SELECT 
    source_city, COUNT(*) total_departures
FROM
    airlines_flights_data
GROUP BY source_city
ORDER BY total_departures DESC
LIMIT 5;

--     "5. What is the average price for flights with no stops?"
SELECT 
    ROUND(AVG(price), 2) avg_price
FROM
    airlines_flights_data
WHERE
    stops = 0;

--     "6. Which class (Economy/Business) has the highest average price?"
SELECT 
    class, ROUND(AVG(price), 2) highest_price
FROM
    airlines_flights_data
GROUP BY class
ORDER BY highest_price DESC
LIMIT 1;

--     "7. How does price vary with number of days left before departure?"
SELECT 
    days_left, ROUND(AVG(price), 2) avg_price
FROM
    airlines_flights_data
GROUP BY days_left
ORDER BY days_left; 

--     "8. What is the distribution of flight durations for each airline?"
SELECT 
    airline, duration, COUNT(*)
FROM
    airlines_flights_data
GROUP BY airline , duration;

--     "9. Find all flights that depart in the evening and have only 1 stop."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    departure_time = 'evening'
        AND stops = 'one';

--     "10. Compare average prices for different times of the day (Morning, Afternoon, Evening, Night)."
SELECT 
    departure_time time_slot, ROUND(AVG(price), 2) avg_price
FROM
    airlines_flights_data
GROUP BY time_slot;

--     "11. Which route (source to destination) has the most number of flights?"
SELECT 
    source_city, destination_city, COUNT(*) Number_of_flights
FROM
    airlines_flights_data
GROUP BY source_city , destination_city
ORDER BY number_of_flights DESC
LIMIT 1;

--     "12. Find flights with duration greater than 5 hours and price below average."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    duration > 5
        AND price < (SELECT 
            AVG(price)
        FROM
            airlines_flights_data);

--     "13. List flights departing within 7 days having the highest price."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    days_left <= 7
ORDER BY price DESC
LIMIT 1;

--     "14. Show average delay (if available) or proxy duration for each airline."
SELECT 
    airline, ROUND(AVG(duration), 2) average_delay
FROM
    airlines_flights_data
GROUP BY airline;

--     "15. Compare flight prices for the same route but different classes."
SELECT 
    source_city,
    destination_city,
    class,
    AVG(price) AS avg_price
FROM
    airlines_flights_data
GROUP BY source_city , destination_city , class
ORDER BY source_city , destination_city , class;

--     "16. Which airlines operate non-stop flights from Bangalore to Delhi?"
SELECT 
    airline
FROM
    airlines_flights_data
WHERE
    source_city = 'Bangalore'
        AND destination_city = 'delhi'
        AND stops = 'zero';

--     "17. What is the correlation between duration and price?"
SELECT
    (
        SUM((duration - avg_duration) * (price - avg_price)) /
        SQRT(SUM(POW(duration - avg_duration, 2)) * SUM(POW(price - avg_price, 2)))
    ) AS correlation_duration_price
FROM (
    SELECT *,
        (SELECT AVG(duration) FROM airlines_flights_data) AS avg_duration,
        (SELECT AVG(price) FROM airlines_flights_data) AS avg_price
    FROM airlines_flights_data
) AS subquery;

--     "18. Show the cheapest flight for each source-destination pair."
SELECT 
    source_city, destination_city, MIN(price) AS cheapest_price
FROM
    airlines_flights_data
GROUP BY source_city , destination_city;

--     "19. What is the total number of business class flights for each airline?"
SELECT 
    airline, COUNT(*) AS Business_class_flights
FROM
    airlines_flights_data
WHERE
    class = 'business'
GROUP BY airline;

--     "20. How many flights are there per day of the week?"

--     "21. List all flights with more than 1 stop sorted by price."
SELECT *
FROM airlines_flights_data
WHERE 
  stops LIKE '%two%' OR
  stops LIKE '%two_or_more%'
ORDER BY price;

