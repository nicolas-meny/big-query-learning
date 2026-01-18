CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.dim_zones` AS
SELECT
  CAST(zone_id AS INT64) AS LocationID,
  zone_name,
  borough,
  zone_geom
FROM
  `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom`
-- On s'assure de ne prendre qu'une ligne unique par ID
QUALIFY ROW_NUMBER() OVER(PARTITION BY zone_id ORDER BY zone_name) = 1;