SELECT 
    rate_desc,
    COUNT(*) AS nb_courses,
    -- Calcul de l'écart moyen entre le total réel et la somme des parties
    ROUND(AVG(total_amount - (fare_amount + extra + mta_tax + tip_amount + tolls_amount + improvement_surcharge + congestion_surcharge)), 4) AS avg_delta,
    -- Pourcentage de lignes où le calcul est parfaitement exact
    ROUND(COUNTIF(ABS(total_amount - (fare_amount + extra + mta_tax + tip_amount + tolls_amount + improvement_surcharge + congestion_surcharge)) < 0.01) * 100 / COUNT(*), 2) AS pct_exact_match
FROM `my-ba-journey.NYC_TAXI.mrt_taxi_trips`
GROUP BY 1
ORDER BY nb_courses DESC;