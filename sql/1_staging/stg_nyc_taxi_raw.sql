CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.stg_nyc_taxi_raw` AS
SELECT *
FROM 
    `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2023` -- On change l'année ici
WHERE 
    DATE(pickup_datetime) BETWEEN '2023-01-01' AND '2023-01-31' -- On cible Janvier 2023
LIMIT 100000;