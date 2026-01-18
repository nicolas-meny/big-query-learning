-- Dimension des Prestataires (Mise à jour 2025)
CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.dim_vendors` AS
SELECT 1 AS vendor_id, 'Creative Mobile Technologies, LLC' AS vendor_name UNION ALL
SELECT 2, 'Curb Mobility, LLC' UNION ALL
SELECT 6, 'Myle Technologies Inc' UNION ALL
SELECT 7, 'Helix';