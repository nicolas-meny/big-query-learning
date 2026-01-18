CREATE OR REPLACE VIEW `my-ba-journey.NYC_TAXI.v_strategic_taxi_analysis` AS
SELECT 
    -- 1. AXE TEMPOREL
    EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,
    FORMAT_DATE('%A', tpep_pickup_datetime) AS pickup_day,
    CASE 
        WHEN FORMAT_DATE('%u', tpep_pickup_datetime) IN ('6', '7') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    -- Calcul de la durée précise en minutes (secondes / 60)
    ROUND(TIMESTAMP_DIFF(tpep_dropoff_datetime, tpep_pickup_datetime, SECOND) / 60.0, 2) AS duration_minutes,

    -- 2. AXE GÉOGRAPHIQUE (Pickup & Dropoff)
    pickup_borough,
    pickup_zone,
    dropoff_borough,
    dropoff_zone,

    -- 3. INDICATEURS FINANCIERS & PERFORMANCE
    total_amount,        -- Ta Source of Truth (ce qui est payé)
    fare_amount,         -- Ta base de rentabilité brute
    trip_distance,
    passenger_count,
    tip_amount,
    
    -- 4. ATTRIBUTS SUPPLÉMENTAIRES
    payment_desc,
    rate_desc

FROM `my-ba-journey.NYC_TAXI.mrt_taxi_trips`