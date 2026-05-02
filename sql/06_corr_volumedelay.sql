-- ============================================
-- File: 06_corr_volumedelay.sql
-- Description: Compute correlation between flight volume and delay
-- ============================================

WITH hourly_stats AS (
    SELECT
        dep_hour,
        COUNT(*) AS total_flights,
        AVG(departure_delay) AS avg_delay
    FROM flights
    WHERE departure_delay IS NOT NULL
    GROUP BY dep_hour
)
SELECT
    (
        AVG(total_flights * avg_delay)
        - AVG(total_flights) * AVG(avg_delay)
    )
    /
    (
        STDEVP(total_flights) * STDEVP(avg_delay)
    ) AS correlation
FROM hourly_stats;
