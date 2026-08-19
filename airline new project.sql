create database flightanalysis;
use flightanalysis;


# TOTAL ROWS

select count(*) from fltdata;
# 10683
describe fltdata;
# ONLY TWO DATA TYPE BIGINT(INT) AND TEXT(STRING) 

#  Airline Analysis

# Q - Which airline has the highest average ticket price

select airline , round(avg(price),2) as avg_ticket_price
from fltdata
group by airline
order by avg_ticket_price desc
limit 5;

# ans - Jet Airways Business	58358.67

# q - Which airline has the lowest average ticket price

select airline , round(avg(price),2) as avg_ticket_price
from fltdata
group by airline
order by avg_ticket_price asc
limit 5;

# ans - Trujet	4140.00

#  q - Which airline operates the most flights

select airline ,count(*) as count_airline
from fltdata
group by airline
order by count_airline desc
limit 5;
# ans - Jet Airways	3849

# Which airline offers the most affordable flights

select airline , round(avg(price),2) most_affordable_flight
from fltdata
group by airline 
order by most_affordable_flight
limit 5;
# most affordable flight Trujet	4140.00

#   Source Analysis

select * from fltdata;

# Which source city has the most flights

select source , count(*) city_operat_flight
from fltdata
group by source
order by city_operat_flight desc
limit 10;

# Delhi	4537

# Which source city has the highest average ticket price

select source , round(avg(price),2) as avg_ticket_price
from fltdata
group by source
order by avg_ticket_price desc
limit 5;

# Delhi	10539.44

# Which source city has the lowest average ticket price

select source , round(avg(price),2) as avg_ticket_price
from fltdata
group by source
order by avg_ticket_price asc
limit 5;

# Chennai	4789.89

#  Destination Analysis

# Which destination has the most flights

select destination , count(*) as total_flight
from fltdata
group by destination 
order by total_flight desc
limit 5;

# Cochin	4537

# Which destination has the highest average ticket price

select destination , round(avg(price),2) as avg_ticket_price
from fltdata
group by destination
order by avg_ticket_price desc
limit 5;

# New Delhi	11917.72

# Which destination has the lowest average ticket price

select destination , round(avg(price),2) as avg_ticket_price
from fltdata
group by destination
order by avg_ticket_price asc
limit 5;

# Kolkata	4789.89

#  Route Analysis

# Which route has the most flights

select route , count(*) as total_flight
from fltdata
group by route
order by total_flight desc;

# DEL → BOM → COK	2376

# Which route is the most expensive

select route , round(avg(price),2) as total_avg_price
from fltdata
group by route
order by total_avg_price desc;

# BOM → DED → DEL → HYD	24115.00

# Which route is the cheapest

select route , round(avg(price),2) as total_avg_price
from fltdata
group by route
order by total_avg_price asc;

# BOM → HYD	3932.81

#  Departure Time Analysis

# Which departure hour has the most flights

select dep_hour , count(*) total_departure_hour
from fltdata
group by dep_hour
order by total_departure_hour desc;

# 9 departure hour hour - 916

select * from fltdata;

# Which departure hour has the highest average ticket price

select dep_hour, round(avg(price),2) as avg_price_ticket
from fltdata
group by dep_hour 
order by avg_price_ticket desc;

# 3 departure hour - 	10474.63

# Which departure hour has the lowest average ticket price

select dep_hour, round(avg(price),2) as avg_price_ticket
from fltdata
group by dep_hour 
order by avg_price_ticket asc;

# 1 departure hour - 4354.62

# Duration Analysis

# Does longer flight duration lead to higher prices

select duration_category ,count(*) total_fllight, round(avg(price),2) as avg_price
from fltdata
group by duration_category
order by avg_price desc;

# longer flight duration higher price ticket

select * from fltdata;

# Journey Analysis

# Which month has the most flights

select month_of_journey , count(*) total_flight
from fltdata
group by month_of_journey
order by total_flight desc;

# 5th month may 

# Which month has the highest average ticket price

select month_of_journey , round(avg(price),2) avg_price
from fltdata
group by month_of_journey
order by avg_price desc;

# 3rd march month 

# Which month has the lowest average ticket price

select month_of_journey , round(avg(price),2) avg_price
from fltdata
group by month_of_journey
order by avg_price asc;

# 4rth april month

# Which journey day has the highest average ticket price

select day_of_journey , round(avg(price),2) avg_price
from fltdata
group by day_of_journey
order by avg_price desc;

# jan month

# Price Analysis

# What is the average ticket price

select avg(price) avg_ticket_price
from fltdata;
# avg_ticket price  - 9087.0641


# What is the minimum ticket price

select min(price) min_ticket_price
from fltdata;

# 1759

# What is the maximum ticket price

select max(price) max_ticket_price
from fltdata;

# 79512

# How many flights are available

select count(*) flight_count
from fltdata;
# 10683

# Stops Analysis

# Which number of stops is most common

select total_stops , count(*) as total_flight
from fltdata
group by total_stops
order by total_flight desc;

# 1 stop

# Does the number of stops affect ticket price

select total_stops ,count(*) total_flight, round(avg(price),2) as avg_ticket_price
from fltdata
group by total_stops
order by total_stops asc;

# yes no of stop affected ticket price

# Most Expensive Flights

# What are the most expensive flight options

select airline , source , destination , route ,total_stops, price
from fltdata
order by price desc
limit 10;

# Jet Airways Business	Banglore	New Delhi	  BLR → BOM → DEL    	1	  79512

# Cheapest Flights
select airline , source , destination , route ,total_stops, price
from fltdata
order by price asc
limit 10;

# SpiceJet	Mumbai	Hyderabad	BOM → HYD	0	1759

# Additional Information

# Which additional information category occurs most

select additional_info , count(*) as add_info_count 
from fltdata
group by additional_info
order by add_info_count desc;

# no info category occures most

# Does additional information relate to different price level
select additional_info , count(*) total_flight , round(avg(price),2) avg_price
from fltdata
group by additional_info
order by avg_price desc;



select * from fltdata;

# Which airlines rank highest based on their average ticket price

select airline ,round(avg(price),2) as avg_ticket_price ,
rank() over(order by avg(price) desc ) as prices_rank
from fltdata
group by airline
order by prices_rank;

# Trujet	4140.00    	1

# Which airlines rank highest based on the number of flights operated

select airline , count(*) as no_of_flight_operated,
rank() over(order by count(*) desc) as total_flight
from fltdata
group by airline
order by total_flight;

# ans - Trujet	1	1

# Which routes have the highest average ticket prices

select route , round(avg(price),2) as avg_price,
dense_rank() over(order by avg(price) desc) as according_to_prices_rank
from fltdata
group by route
order by according_to_prices_rank;
# ans - BOM → HYD	3932.81	   1

# Which routes rank highest based on the number of flights

select route , count(*) as route_flight_count,
dense_rank() over(order by count(*) desc) as route_wise_flight_count_by_rank
from fltdata
group by route
order by route_wise_flight_count_by_rank;

# BOM → GOI → HYD	1	1

# What are the top 3 most expensive flights for each airline

WITH ranked_flights AS (
    SELECT
        airline,
        source,
        destination,
        route,
        total_stops,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY airline
            ORDER BY price DESC
        ) AS flight_rank
    FROM fltdata
)
SELECT *
FROM ranked_flights
WHERE flight_rank <= 3;

# What are the top 3 cheapest flights for each airline

with cheapest_flight as (
select airline , source , destination , route, total_stops , price ,
row_number() over(partition by airline order by price asc) as flight_rank 
from fltdata)

select * from cheapest_flight
where flight_rank <= 3;

# Which airlines have an average ticket price higher than the overall average

select airline , round(avg(price),2) as avg_price_ticket 
from fltdata
group by airline
having avg(price) > (select avg(price) from fltdata )
order by avg_price_ticket desc;

/* Jet Airways Business	58358.67
Jet Airways	11643.92
Multiple carriers Premium economy	11418.85
Multiple carriers	10902.68
Air India	9611.21
*/

# What is the price rank of each airline based on its average ticket price

select airline , avg(price) as avg_ticket_price,
dense_rank() over(order by avg(price) desc) as avg_price_rank
from fltdata
group by airline;


# What is the ranking of source cities based on their average ticket price

select source , avg(price) as avg_price,
rank() over(order by avg(price) desc) as rank_city
from fltdata
group by source;

/*Delhi	 10539.4391 	1
Kolkata	 9158.3894	    2
Banglore 8017.4643   	3
Mumbai	 5059.7088  	4
Chennai	 4789.8924  	5
*/

# What is the ranking of destinations based on their average ticket price

select destination , round(avg(price),2) avg_proice,
rank() over(order by avg(price) desc) as rank_destination
from fltdata
group by destination;
/*New Delhi	11917.72	1
Cochin	10539.44	2
Banglore	9158.39	3
Delhi	5143.92	4
Hyderabad	5059.71	5
Kolkata	4789.89	6
*/

# How many flights fall into Budget, Mid-Range, and Premium price categories
select * from fltdata;

select 
case 
    when price <=5000 then "budget"
    when price between 5000 and 10000 then "mid_ range"
    else "premium"
end as price_category ,
count(*) flight_count
from fltdata
group by price_category
order by flight_count desc;

alter table fltdata add column price_category varchar(20);

update fltdata set price_category = 
case 
    when price <=5000 then "budget"
    when price between 5000 and 10000 then "mid_ range"
    else "premium"
end;

# How many flights fall into Budget, Mid-Range, and Premium price categories

select price_category , count(*) total_flight_count 
from fltdata
group by price_category;
/* budget	2400
mid_ range	3913
premium	4370
*/

# Which airlines have the highest number of Premium flights

select airline , price_category , count(*) as premium_flight
from fltdata
where price_category = "premium"
group by airline ;

# Jet Airways	premium	2700

# How do flight duration categories rank based on their average ticket price

select * from fltdata;

select duration_category , round(avg(price),2) as avg_price,
dense_rank() over(order by avg(price) desc) as rank_of_duration_category
from fltdata
group by duration_category;
/* long duration	11463.15	1
medium duration	10329.12	2
short duration	5032.37	3
*/

# How do different numbers of stops rank based on average ticket price

select total_stops , round(avg(price),2) as avg_price,
rank() over(order by avg(price) desc ) as rank_of_total_stops
from fltdata
group by total_stops;

/* 4	17686.00	1
3	13112.00	2
2	12715.81	3
1	10593.57	4
0	5024.90	5
*/

# What is the most expensive flight offered by each airline

with most_expensive_flight as (
select airline ,source,destination,price,total_stops, 
row_number() over(partition by airline order by price desc) as highest_ticket_price
from fltdata)

select airline ,source,destination,price,total_stops
from most_expensive_flight
where highest_ticket_price = 1;
/* Air Asia	Delhi	Cochin	13774	1
Air India	Kolkata	Banglore	31945	0
GoAir	Delhi	Cochin	22794	1
IndiGo	Banglore	New Delhi	22153	1
Jet Airways	Banglore	New Delhi	54826	1
Jet Airways Business	Banglore	New Delhi	79512	1
Multiple carriers	Delhi	Cochin	36983	1
Multiple carriers Premium economy	Delhi	Cochin	14629	1
SpiceJet	Banglore	New Delhi	23267	1
Trujet	Mumbai	Hyderabad	4140	1
Vistara	Banglore	New Delhi	21730	0
Vistara Premium economy	Banglore	New Delhi	11793	0
*/

# What is the cheapest flight offered by each airline

with cheapest_flight as (
select airline, source , destination,route , price ,
row_number() over(partition by airline order by price asc) as cheap_flight
from fltdata)

select  airline, source ,route, destination , price
from cheapest_flight
where cheap_flight = 1
order by price asc;

/* 
SpiceJet	Mumbai	BOM → HYD	Hyderabad	1759
Jet Airways	Mumbai	BOM → HYD	Hyderabad	1840
Air India	Mumbai	BOM → HYD	Hyderabad	2050
IndiGo	Mumbai	BOM → HYD	Hyderabad	2227
Air Asia	Banglore	BLR → DEL	Delhi	3383
GoAir	Banglore	BLR → DEL	Delhi	3398
Vistara	Chennai	MAA → CCU	Kolkata	3687
Trujet	Mumbai	BOM → NDC → HYD	Hyderabad	4140
Multiple carriers	Delhi	DEL → BOM → COK	Cochin	5797
Vistara Premium economy	Banglore	BLR → DEL	Delhi	5969
Multiple carriers Premium economy	Delhi	DEL → BOM → COK	Cochin	9845
Jet Airways Business	Delhi	DEL → ATQ → BOM → COK	Cochin	46490
*/

# Which flights have a ticket price higher than the overall average ticket price

select airline , source , destination , route , price
from fltdata
where price > (
select avg(price) as overall_average_price
from fltdata)
order by price desc;


# Which departure hours rank highest based on average ticket price
select  dep_hour, round(avg(price),2) as avg_ticket_price,
rank() over(order by avg(price) desc) as rank_departure_hour_by_average_hour
from fltdata
group by dep_hour
order by rank_departure_hour_by_average_hour asc;


# Which journey months rank highest based on average ticket price

select month_of_journey , round(avg(price),2) as avg_price,
rank() over(order by avg(price) desc) as month_rank
from fltdata
group by month_of_journey
order by month_rank ;
/* 
3	10673.21	1
5	9127.25	2
6	8828.80	3
4	5770.85	4
*/

