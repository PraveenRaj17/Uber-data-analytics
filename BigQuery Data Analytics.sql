-- Average fare amount by vendor
select VendorID, AVG(fare_amount) from `uber_data_engineering.fact_table` group by VendorID;

-- Average tip amount by payment type
SELECT b.payment_type_name, AVG(a.tip_amount) FROM `uber_data_engineering.fact_table` a
JOIN `uber_data_engineering.payment_type_dim` b
ON a.payment_type_id = b.payment_type_id
GROUP BY b.payment_type_name;

-- Top 10 pickup locations based on number of pickups
SELECT
b.pickup_location_id, b.pickup_latitude, b.pickup_longitude, count(*) AS Pickups FROM `uber_data_engineering.fact_table` a
JOIN `uber_data_engineering.pickup_location_dim` b
ON a.pickup_location_id = b.pickup_location_id
GROUP BY b.pickup_location_id, b.pickup_latitude, b.pickup_longitude
ORDER BY count(*) DESC;

-- Total number of trips by passenger count
SELECT b.passenger_count, COUNT(*) AS Trips
FROM `uber_data_engineering.fact_table`a
JOIN `uber_data_engineering.passenger_Count_dim` b
ON a.passenger_count_id = b.passenger_count_id
GROUP BY b.passenger_count;

-- Average fare amount by hour of the day
SELECT b.pick_hour, AVG(a.fare_amount) as Fare
FROM `uber_data_engineering.fact_table` a
JOIN `uber_data_engineering.datetime_dim`b
ON a.datetime_id = b.datetime_id
GROUP BY b.pick_hour;

-- Busiest hour of the day
SELECT b.pick_hour, count(*) as Trips
FROM `uber_data_engineering.fact_table` a
JOIN `uber_data_engineering.datetime_dim`b
ON a.datetime_id = b.datetime_id
GROUP BY b.pick_hour
ORDER BY COUNT(*) DESC
LIMIT 10;