-- ============================================
-- File: 08_distribution.sql
-- SQL Server Compatible Distribution Metrics
-- ============================================

WITH base AS (
    SELECT departure_delay
    FROM flights
    WHERE departure_delay IS NOT NULL
),

percentiles AS (
    SELECT DISTINCT
        PERCENTILE_CONT(0.50) 
            WITHIN GROUP (ORDER BY departure_delay)
            OVER () AS median_delay,

        PERCENTILE_CONT(0.90) 
            WITHIN GROUP (ORDER BY departure_delay)
            OVER () AS p90_delay,

        PERCENTILE_CONT(0.95) 
            WITHIN GROUP (ORDER BY departure_delay)
            OVER () AS p95_delay,

        PERCENTILE_CONT(0.99) 
            WITHIN GROUP (ORDER BY departure_delay)
            OVER () AS p99_delay
    FROM base
)

SELECT
    median_delay,
    p90_delay,
    p95_delay,
    p99_delay,
    (SELECT MAX(departure_delay) FROM base) AS max_delay
FROM percentiles;