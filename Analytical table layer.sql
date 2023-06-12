CREATE OR REPLACE TABLE `uber_data_engineering.tbl_analytical_layer` AS(
SELECT 
f.VendorID, dt.tpep_pickup_datetime, dt.tpep_dropoff_datetime, pc.passenger_count, td.trip_distance, rc.rate_code_name, pt.payment_type_name, pk.pickup_latitude, pk.pickup_longitude, dp.dropoff_latitude, dp.dropoff_longitude,
f.fare_amount, f.extra, f.mta_tax, f.tolls_amount, f.improvement_surcharge, f.total_amount, f.tip_amount
FROM `uber_data_engineering.fact_table` f
JOIN `uber_data_engineering.datetime_dim` dt ON f.datetime_id = dt.datetime_id
JOIN `uber_data_engineering.passenger_Count_dim` pc ON f.passenger_count_id = pc.passenger_count_id
JOIN `uber_data_engineering.trip_distance_dim` td ON f.trip_distance_id = td.trip_distance_id
JOIN `uber_data_engineering.pickup_location_dim` pk ON f.pickup_location_id = pk.pickup_location_id
JOIN `uber_data_engineering.dropoff_location_dim` dp ON f.dropoff_location_id = dp.dropoff_location_id
JOIN `uber_data_engineering.rate_code_dim` rc ON f.rate_code_id = rc.rate_code_id
JOIN `uber_data_engineering.payment_type_dim` pt ON f.payment_type_id = pt.payment_type_id)
