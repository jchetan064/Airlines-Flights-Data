Airlines Flights Data Analysis using SQL
Overview:
This project performs insightful analysis of airline flight booking data using SQL. The dataset includes real-world flight details such as airline names, departure and arrival cities, prices, booking dates, and travel times (e.g., morning, afternoon, evening, night). All analysis is done using pure SQL queries to extract trends, compare routes, and understand pricing patterns.

Dataset Information:
Source: Kaggle – Airlines Flights Data Analysis

Tables:
flight_id	 -  Primary key for each flight,
airline	- Airline operating the flight,
source_city	- City of departure,
destination_city -	City of arrival,
departure_time	- Part of day: ( Morning, Afternoon, etc ),
stops	- Stop info: ( Non-stop, 1 Stop, 2 Stops ),
duration -	Duration of the flight,
days_left	- Days between booking and departure,
class	- Economy or Business,
price	- Final price of the flight ticket,

Objectives:
Analyze flight fare trends across different routes and airlines,
Compare pricing based on time of day: ( morning, afternoon, evening, night ),
Identify the most expensive and cheapest routes,
Examine seasonal or monthly fare changes,
Use SQL JOINs, GROUP BY, ORDER BY, aggregate functions and window functions for insights,

SQL Features Used:
GROUP BY and HAVING for aggregation,
INNER JOIN, LEFT JOIN for combining multiple tables,
CASE statements to handle time categories (morning/evening),
RANK() and DENSE_RANK() for ranking fares,
DATE functions for monthly or seasonal analysis,
UBQUERIES and CTEs for clean, readable logi

