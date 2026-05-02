-- ============================================
-- File: 03_time_segmentation.sql
-- Description: Categorize flights into time-based operational segments
-- ============================================

SELECT
    *,
    CASE 
        WHEN dep_hour BETWEEN 0 AND 5 THEN 'Early Hours'
        WHEN dep_hour BETWEEN 6 AND 17 THEN 'Core Operations'
        WHEN dep_hour BETWEEN 18 AND 23 THEN 'Evening Peak'
    END AS time_segment
FROM flights
WHERE departure_delay IS NOT NULL;