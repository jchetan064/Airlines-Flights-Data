use airlines;
select * from airlines_flights_data;

--     "1. List all flights from Mumbai to Delhi sorted by departure time."
Select * from airlines_flights_data where source_city = 'Mumbai' and destination_city = 'delhi' order by departure_time;

--     "2. Which airline has the highest average ticket price?"
select airline , round(avg(price) , 2 ) as max_avg_price from airlines_flights_data group by airline order by max_avg_price desc limit 1;

--     "3. Show the number of flights operated by each airline."
select airline , count(flight) total_flights from airlines_flights_data group by airline;

--     "4. Find the top 5 most frequent source cities."
select source_city , count(*) total_departures from airlines_flights_data group by source_city order by total_departures desc limit 5;

--     "5. What is the average price for flights with no stops?"
select round(avg(price) , 2) avg_price from airlines_flights_data where stops = 0;

--     "6. Which class (Economy/Business) has the highest average price?"
select class , round(avg(price) , 2) highest_price from airlines_flights_data group by class order by highest_price desc limit 1;

--     "7. How does price vary with number of days left before departure?"
select days_left , round(avg(price) , 2) avg_price from airlines_flights_data group by days_left order by days_left; 

--     "8. What is the distribution of flight durations for each airline?"
select airline , duration , count(*) from airlines_flights_data group by airline , duration;

--     "9. Find all flights that depart in the evening and have only 1 stop."
select * from airlines_flights_data where departure_time = 'evening' and stops ='one';

--     "10. Compare average prices for different times of the day (Morning, Afternoon, Evening, Night)."
SELECT departure_time time_slot , round(AVG(price) , 2 ) avg_price FROM airlines_flights_data GROUP BY time_slot;

--     "11. Which route (source to destination) has the most number of flights?"
--     "12. Find flights with duration greater than 5 hours and price below average."
--     "13. List flights departing within 7 days having the highest price."
--     "14. Show average delay (if available) or proxy duration for each airline."
--     "15. Compare flight prices for the same route but different classes."
--     "16. Which airlines operate non-stop flights from Bangalore to Delhi?"
--     "17. What is the correlation between duration and price?"
--     "18. Show the cheapest flight for each source-destination pair."
--     "19. What is the total number of business class flights for each airline?"
--     "20. How many flights are there per day of the week?"
--     "21. List all flights with more than 1 stop sorted by price."
--     "22. What is the most common flight duration?"
--     "23. Find all flights that arrive at night."
--     "24. Which source city has the highest average flight price?"
--     "25. Show the percentage of economy vs business class flights."
--     "26. Find the longest and shortest flight durations."
--     "27. What is the average number of days left before departure for each airline?"
--     "28. Count the number of flights per class (Economy/Business) for each city."
--     "29. Which destination city receives the most number of flights?"
--     "30. Show flights with price greater than the 90th percentile."
--     "31. Compare ticket prices between two specific cities of your choice."
--     "32. Which flights are priced above the average for their route?"
--     "33. Show the count of flights grouped by number of stops."
--     "34. What is the minimum, maximum, and average flight price per airline?"
--     "35. Find all flights where the price is less than ₹3000 and the duration is under 2 hours."
--     "36. Which class has a higher variance in pricing?"
--     "37. List top 3 airlines with most business class flights."
--     "38. How many night flights operate from Mumbai?"
--     "39. Show average price for flights grouped by both source and destination."
--     "40. What is the distribution of flights per time slot (Morning, Afternoon, Evening, Night)?"
--     "41. Show the change in average flight price as days_left decreases."
--     "42. What percentage of flights have a duration over 3 hours?"
--     "43. Find all routes that only have one airline operating."
--     "44. Show flights that operate daily between two cities."
--     "45. Which flights have the lowest price per minute of flight duration?"
--     "46. Which source city has the most expensive flights on average?"
--     "47. How many unique flight numbers are there per airline?"
--     "48. List all flights operated by Indigo that are longer than 4 hours."
--     "49. Find the busiest day of the week for flights."
--     "50. What’s the average flight price for each day of the week?"