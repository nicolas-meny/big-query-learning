WITH stats AS (
  -- Liste de toutes les colonnes numériques à auditer
  SELECT 'passenger_count' AS col, passenger_count AS val FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'trip_distance', trip_distance FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'fare_amount', fare_amount FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'extra', extra FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'mta_tax', mta_tax FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'tip_amount', tip_amount FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'tolls_amount', tolls_amount FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'improvement_surcharge', improvement_surcharge FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'total_amount', total_amount FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'congestion_surcharge', congestion_surcharge FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi` UNION ALL
  SELECT 'airport_fee', airport_fee FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi`
)
SELECT
    col AS colonne,
    COUNTIF(val IS NULL) AS nb_manquants,
    ROUND(COUNTIF(val IS NULL) / COUNT(*) * 100, 2) AS pct_manquants,
    APPROX_QUANTILES(val, 2)[OFFSET(1)] AS mediane,
    ROUND(STDDEV(val), 2) AS std_dev,
    ROUND(MIN(val), 2) AS min_reel,
    ROUND(MAX(val), 2) AS max_reel
FROM stats
GROUP BY colonne
ORDER BY colonne;