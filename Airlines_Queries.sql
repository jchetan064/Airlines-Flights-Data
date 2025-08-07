use airlines;
select * from airlines_flights_data;

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


--     "22. What is the most common flight duration?"
SELECT 
    duration, COUNT(*)
FROM
    airlines_flights_data
GROUP BY duration
ORDER BY COUNT(*) DESC
LIMIT 1;

--     "23. Find all flights that arrive at night."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    arrival_time = 'night';

--     "24. Which source city has the highest average flight price?"
SELECT 
    source_city, AVG(price)
FROM
    airlines_flights_data
GROUP BY source_city
ORDER BY AVG(price) DESC
LIMIT 1;

--     "25. Show the percentage of economy vs business class flights."
SELECT 
    class,
    COUNT(*) * 100 / (SELECT 
            COUNT(*)
        FROM
            airlines_flights_data) Percentage
FROM
    airlines_flights_data
GROUP BY class;

--     "26. Find the longest and shortest flight durations."
SELECT 
    MAX(duration) AS longest, MIN(duration) AS shortest
FROM
    airlines_flights_data;

--     "27. What is the average number of days left before departure for each airline?"
SELECT 
    airline, AVG(days_left) AS avg_days_left
FROM
    airlines_flights_data
GROUP BY airline;

--     "28. Count the number of flights per class (Economy/Business) for each city."
SELECT 
    source_city, class, COUNT(*)
FROM
    airlines_flights_data
GROUP BY class , source_city;

--     "29. Which destination city receives the most number of flights?"
SELECT 
    destination_city, COUNT(*) total_flights
FROM
    airlines_flights_data
GROUP BY destination_city
ORDER BY destination_city DESC;

--     "30. Show flights with price greater than the 90th percentile."
--     "31. Compare ticket prices between two specific cities of your choice."
use airlines;
SELECT 
    source_city,
    destination_city,
    round(AVG(price) , 2 ) average_price,
    MIN(price) minimum_price,
    MAX(price) maximum_price,
    COUNT(*) total_flights
FROM
    airlines_flights_data
WHERE
    (source_city = 'mumbai'
        AND destination_city = 'delhi')
        OR (source_city = 'delhi'
        AND destination_city = 'mumbai')
GROUP BY source_city , destination_city;

--     "32. Which flights are priced above the average for their route?"
SELECT 
    *
FROM
    airlines_flights_data f1
WHERE
    price > (SELECT 
            AVG(price)
        FROM
            airlines_flights_data f2
        WHERE
            f2.source_city = f1.source_city
                AND f2.destination_city = f1.destination_city);

--     "33. Show the count of flights grouped by number of stops."
SELECT 
    stops, COUNT(airline)
FROM
    airlines_flights_data
GROUP BY stops;

--     "34. What is the minimum, maximum, and average flight price per airline?"
SELECT 
    airline,
    MIN(price) minimum_price,
    MAX(price) maximum_price,
    ROUND(AVG(price), 2) average_price
FROM
    airlines_flights_data
GROUP BY airline;

--     "35. Find all flights where the price is less than ₹3000 and the duration is under 2 hours."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    price < 3000 AND duration < 2;

--     "36. Which class has a higher variance in pricing?"
SELECT 
    class, ROUND(VARIANCE(price), 2)
FROM
    airlines_flights_data
GROUP BY class;

--     "37. List top 3 airlines with most business class flights."
SELECT 
    airline, COUNT(*) AS business_count
FROM
    airlines_flights_data
WHERE
    class = 'Business'
GROUP BY airline
ORDER BY business_count DESC
LIMIT 3;

--     "38. How many night flights operate from Mumbai?"
SELECT 
    COUNT(*)
FROM
    airlines_flights_data
WHERE
    departure_time = 'night'
        AND source_city = 'mumbai';

--     "39. Show average price for flights grouped by both source and destination."
SELECT 
    source_city,
    destination_city,
    ROUND(AVG(price), 2) average_price
FROM
    airlines_flights_data
GROUP BY source_city , destination_city;

--     "40. What is the distribution of flights per time slot (Morning, Afternoon, Evening, Night)?"
SELECT 
    departure_time, COUNT(*)
FROM
    airlines_flights_data
GROUP BY departure_time;

--     "41. Show the change in average flight price as days_left decreases."
SELECT 
    days_left, AVG(price) average_price
FROM
    airlines_flights_data
GROUP BY days_left;

--     "42. What percentage of flights have a duration over 3 hours?"
SELECT 
    COUNT(*) * 100.0 / (SELECT 
            COUNT(*)
        FROM
            airlines_flights_data) percentage
FROM
    airlines_flights_data
WHERE
    duration > 3.0;

--     "43. Find all routes that only have one airline operating." 
SELECT 
    source_city, destination_city
FROM
    airlines_flights_data
GROUP BY source_city , destination_city
HAVING COUNT(DISTINCT airline) = 1;

--     "44. Show flights that operate daily between two cities."
 SELECT 
    source_city, destination_city, COUNT(*)
FROM
    airlines_flights_data
GROUP BY source_city , destination_city;

--     "45. Which flights have the lowest price per minute of flight duration?"
SELECT 
    *, price / duration AS price_per_minute
FROM
    airlines_flights_data
ORDER BY price_per_minute ASC
LIMIT 1;

--     "46. Which source city has the most expensive flights on average?"
SELECT 
    source_city, AVG(price) AS avg_price
FROM
    airlines_flights_data
GROUP BY source_city
ORDER BY avg_price DESC
LIMIT 1;

--     "47. How many unique flight numbers are there per airline?"
SELECT 
    airline, COUNT(DISTINCT flight)
FROM
    airlines_flights_data
GROUP BY airline;

--     "48. List all flights operated by Indigo that are longer than 4 hours."
SELECT 
    *
FROM
    airlines_flights_data
WHERE
    airline = 'Indigo' AND duration > 4;

--     "49. Find the busiest time of the week for flights."
SELECT 
    departure_time AS day, COUNT(*)
FROM
    airlines_flights_data
GROUP BY day
ORDER BY COUNT(*) DESC
LIMIT 1;

--     "50. What’s the average flight price for each time of the day?"
SELECT 
    departure_time AS day, ROUND(AVG(price), 2) average_price
FROM
    airlines_flights_data
GROUP BY day;
