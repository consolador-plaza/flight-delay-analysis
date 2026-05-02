-- ============================================
-- File: 04_timebased_delay_analysis.sql
-- Description: Analyze delay patterns across time segments
-- ============================================

SELECT
    CASE 
        WHEN dep_hour BETWEEN 0 AND 5 THEN 'Early Hours'
        WHEN dep_hour BETWEEN 6 AND 17 THEN 'Core Operations'
        WHEN dep_hour BETWEEN 18 AND 23 THEN 'Evening Peak'
    END AS segment,
    COUNT(*) AS total_flights,
    AVG(departure_delay) AS avg_delay,
    STDEVP(departure_delay) AS std_dev_delay
FROM flights
WHERE departure_delay IS NOT NULL
GROUP BY 
    CASE 
        WHEN dep_hour BETWEEN 0 AND 5 THEN 'Early Hours'
        WHEN dep_hour BETWEEN 6 AND 17 THEN 'Core Operations'
        WHEN dep_hour BETWEEN 18 AND 23 THEN 'Evening Peak'
    END;