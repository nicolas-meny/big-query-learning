CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.dim_zones` AS
SELECT
  CAST(zone_id AS INT64) AS LocationID, -- On convertit en chiffre pour la jointure
  zone_name,
  borough,
  zone_geom -- Optionnel, mais utile si tu veux faire des cartes plus tard
FROM
  `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom`;