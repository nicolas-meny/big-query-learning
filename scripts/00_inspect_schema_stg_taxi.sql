SELECT 
    column_name, 
    data_type, 
    is_nullable
FROM `my-ba-journey.NYC_TAXI.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'stg_nyc_taxi_raw';