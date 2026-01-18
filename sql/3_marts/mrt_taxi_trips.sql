CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.mrt_taxi_trips` AS

WITH base_trips AS (
  -- On récupère notre table Silver
  SELECT * FROM `my-ba-journey.NYC_TAXI.int_nyc_taxi_refined`
),

joined_data AS (
  -- On assemble toutes nos briques ici
  SELECT
    -- Infos temporelles
    f.tpep_pickup_datetime,
    f.tpep_dropoff_datetime,
    
    -- Jointures sur les dimensions
    v.vendor_name,
    p.payment_desc,
    r.rate_desc,
    
    -- Double jointure sur les zones (Départ / Arrivée)
    pz.zone_name AS pickup_zone,
    pz.borough AS pickup_borough,
    dz.zone_name AS dropoff_zone,
    dz.borough AS dropoff_borough,
    
    -- Faits (Mesures)
    f.passenger_count,
    f.trip_distance,
    f.fare_amount,
    f.tip_amount,
    f.total_amount,

    f.extra,
    f.mta_tax,
    f.tolls_amount, 
    f.improvement_surcharge,
    f.congestion_surcharge,
    f.airport_fee

  FROM base_trips f
  LEFT JOIN `my-ba-journey.NYC_TAXI.dim_vendors` v ON f.VendorID = v.vendor_id
  LEFT JOIN `my-ba-journey.NYC_TAXI.dim_payments` p ON f.payment_type = p.payment_type_id
  LEFT JOIN `my-ba-journey.NYC_TAXI.dim_rate_codes` r ON f.RatecodeID = r.rate_code_id
  LEFT JOIN `my-ba-journey.NYC_TAXI.dim_zones` pz ON f.PULocationID = pz.LocationID
  LEFT JOIN `my-ba-journey.NYC_TAXI.dim_zones` dz ON f.DOLocationID = dz.LocationID
)

-- Création de la table finale Gold
SELECT * FROM joined_data;