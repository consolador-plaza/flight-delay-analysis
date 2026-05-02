-- ============================================
-- File: 05_hourly_aggregation.sql
-- Description: Aggregate flight volume and delay at hourly level
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
SELECT *
FROM hourly_stats;