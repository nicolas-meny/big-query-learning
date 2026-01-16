WITH stats AS (
  SELECT
    -- 1. Dates (Converties en STRING pour l'UNION)
    CAST(MIN(tpep_pickup_datetime) AS STRING) AS min_pickup, CAST(MAX(tpep_pickup_datetime) AS STRING) AS max_pickup,
    CAST(MIN(tpep_dropoff_datetime) AS STRING) AS min_dropoff, CAST(MAX(tpep_dropoff_datetime) AS STRING) AS max_dropoff,

    -- 2. Identifiants et Codes
    CAST(MIN(COALESCE(VendorID, -1)) AS STRING) AS min_vendor, CAST(MAX(COALESCE(VendorID, -1)) AS STRING) AS max_vendor,
    CAST(MIN(COALESCE(RatecodeID, -1)) AS STRING) AS min_ratecode, CAST(MAX(COALESCE(RatecodeID, -1)) AS STRING) AS max_ratecode,
    CAST(MIN(COALESCE(payment_type, -1)) AS STRING) AS min_payment, CAST(MAX(COALESCE(payment_type, -1)) AS STRING) AS max_payment,
    CAST(MIN(COALESCE(PULocationID, -1)) AS STRING) AS min_puloc, CAST(MAX(COALESCE(PULocationID, -1)) AS STRING) AS max_puloc,
    CAST(MIN(COALESCE(DOLocationID, -1)) AS STRING) AS min_doloc, CAST(MAX(COALESCE(DOLocationID, -1)) AS STRING) AS max_doloc,

    -- 3. Métriques de trajet
    CAST(MIN(COALESCE(passenger_count, -1)) AS STRING) AS min_passengers, CAST(MAX(COALESCE(passenger_count, -1)) AS STRING) AS max_passengers,
    CAST(MIN(COALESCE(trip_distance, -1)) AS STRING) AS min_dist, CAST(MAX(COALESCE(trip_distance, -1)) AS STRING) AS max_dist,

    -- 4. Métriques financières
    CAST(MIN(COALESCE(fare_amount, -1)) AS STRING) AS min_fare, CAST(MAX(COALESCE(fare_amount, -1)) AS STRING) AS max_fare,
    CAST(MIN(COALESCE(extra, -1)) AS STRING) AS min_extra, CAST(MAX(COALESCE(extra, -1)) AS STRING) AS max_extra,
    CAST(MIN(COALESCE(mta_tax, -1)) AS STRING) AS min_mta, CAST(MAX(COALESCE(mta_tax, -1)) AS STRING) AS max_mta,
    CAST(MIN(COALESCE(tip_amount, -1)) AS STRING) AS min_tip, CAST(MAX(COALESCE(tip_amount, -1)) AS STRING) AS max_tip,
    CAST(MIN(COALESCE(tolls_amount, -1)) AS STRING) AS min_tolls, CAST(MAX(COALESCE(tolls_amount, -1)) AS STRING) AS max_tolls,
    CAST(MIN(COALESCE(improvement_surcharge, -1)) AS STRING) AS min_improvement, CAST(MAX(COALESCE(improvement_surcharge, -1)) AS STRING) AS max_improvement,
    CAST(MIN(COALESCE(total_amount, -1)) AS STRING) AS min_total, CAST(MAX(COALESCE(total_amount, -1)) AS STRING) AS max_total,
    CAST(MIN(COALESCE(congestion_surcharge, -1)) AS STRING) AS min_congestion, CAST(MAX(COALESCE(congestion_surcharge, -1)) AS STRING) AS max_congestion,
    CAST(MIN(COALESCE(airport_fee, -1)) AS STRING) AS min_airport, CAST(MAX(COALESCE(airport_fee, -1)) AS STRING) AS max_airport,

    -- 5. Flag
    CAST(MIN(COALESCE(store_and_fwd_flag, '-1')) AS STRING) AS min_flag, CAST(MAX(COALESCE(store_and_fwd_flag, '-1')) AS STRING) AS max_flag
  FROM `my-ba-journey.NYC_TAXI.stg_nyc_taxi_raw`
)

-- Assemblage vertical final
SELECT 'pickup_datetime' AS colonne, min_pickup AS valeur_min, max_pickup AS valeur_max FROM stats
UNION ALL SELECT 'dropoff_datetime', min_dropoff, max_dropoff FROM stats
UNION ALL SELECT 'VendorID', min_vendor, max_vendor FROM stats
UNION ALL SELECT 'RatecodeID', min_ratecode, max_ratecode FROM stats
UNION ALL SELECT 'payment_type', min_payment, max_payment FROM stats
UNION ALL SELECT 'PULocationID', min_puloc, max_puloc FROM stats
UNION ALL SELECT 'DOLocationID', min_doloc, max_doloc FROM stats
UNION ALL SELECT 'passenger_count', min_passengers, max_passengers FROM stats
UNION ALL SELECT 'trip_distance', min_dist, max_dist FROM stats
UNION ALL SELECT 'fare_amount', min_fare, max_fare FROM stats
UNION ALL SELECT 'extra', min_extra, max_extra FROM stats
UNION ALL SELECT 'mta_tax', min_mta, max_mta FROM stats
UNION ALL SELECT 'tip_amount', min_tip, max_tip FROM stats
UNION ALL SELECT 'tolls_amount', min_tolls, max_tolls FROM stats
UNION ALL SELECT 'improvement_surcharge', min_improvement, max_improvement FROM stats
UNION ALL SELECT 'total_amount', min_total, max_total FROM stats
UNION ALL SELECT 'congestion_surcharge', min_congestion, max_congestion FROM stats
UNION ALL SELECT 'airport_fee', min_airport, max_airport FROM stats
UNION ALL SELECT 'store_and_fwd_flag', min_flag, max_flag FROM stats
ORDER BY colonne;