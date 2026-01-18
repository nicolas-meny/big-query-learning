-- Dimension des Types de Paiement (Mise à jour 2025)
CREATE OR REPLACE TABLE `my-ba-journey.NYC_TAXI.dim_payments` AS
SELECT 0 AS payment_type_id, 'Flex Fare trip' AS payment_desc UNION ALL
SELECT 1, 'Credit card' UNION ALL
SELECT 2, 'Cash' UNION ALL
SELECT 3, 'No charge' UNION ALL
SELECT 4, 'Dispute' UNION ALL
SELECT 5, 'Unknown' UNION ALL
SELECT 6, 'Voided trip';