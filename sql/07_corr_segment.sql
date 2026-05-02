-- ============================================
-- File: 07_corr_segment.sql
-- Description: Compute correlation by time segment
-- ============================================

WITH hourly_stats AS (
    SELECT
        dep_hour,
        COUNT(*) AS total_flights,
        AVG(departure_delay) AS avg_delay
    FROM flights
    WHERE departure_delay IS NOT NULL
    GROUP BY dep_hour
),
segmented AS (
    SELECT *,
        CASE 
            WHEN dep_hour BETWEEN 0 AND 5 THEN 'Early Hours'
            WHEN dep_hour BETWEEN 6 AND 17 THEN 'Core Operations'
            WHEN dep_hour BETWEEN 18 AND 23 THEN 'Evening Peak'
        END AS segment
    FROM hourly_stats
)
SELECT
    segment,
    (
        AVG(total_flights * avg_delay)
        - AVG(total_flights) * AVG(avg_delay)
    )
    /
    (
        STDEVP(total_flights) * STDEVP(avg_delay)
    ) AS correlation
FROM segmented
GROUP BY segment;