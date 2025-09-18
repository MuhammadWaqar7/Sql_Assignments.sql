-- Exercise 6: Assuming data in exercise#4
SELECT
    main_distance,
    COUNT(CASE WHEN age < 20 THEN 1 END) AS under_20,
    COUNT(CASE WHEN age BETWEEN 20 AND 29 THEN 1 END) AS age_20_29,
    COUNT(CASE WHEN age BETWEEN 30 AND 39 THEN 1 END) AS age_30_39,
    COUNT(CASE WHEN age BETWEEN 40 AND 49 THEN 1 END) AS age_40_49,
    COUNT(CASE WHEN age >= 50 THEN 1 END) AS over_50
FROM runner
GROUP BY main_distance
ORDER BY main_distance ASC;
