CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.int_nyc_taxi` AS
SELECT
    *
FROM
    `my-ba-journey.NYC_TAXI.stg_nyc_taxi_raw`
WHERE
    -- 1. Cohérence temporelle (Périmètre Janvier 2023)
    tpep_pickup_datetime BETWEEN '2023-01-01 00:00:00' AND '2023-01-31 23:59:59'
    -- 2. Cohérence chronologique (On ne peut pas arriver avant d'être parti)
    AND tpep_dropoff_datetime > tpep_pickup_datetime
    
    -- 3. Cohérence métier (Trajets avec passagers et codes valides)
    AND passenger_count > 0
    AND RatecodeID > 0
    
    -- 4. Cohérence financière (Pas de montants négatifs)
    AND fare_amount >= 0
    AND extra >= 0
    AND mta_tax >= 0
    AND tip_amount >= 0
    AND tolls_amount >= 0
    AND improvement_surcharge >= 0
    AND total_amount >= 0
    AND congestion_surcharge >= 0
    AND airport_fee >= 0;