-- Airport performance metrics
WITH base AS (
    SELECT
        origin_airport,
        departure_delay
    FROM flights
    WHERE departure_delay IS NOT NULL
),
aggregated AS (
    SELECT
        origin_airport,
        COUNT(*) AS total_flights,
        AVG(departure_delay) AS avg_delay,
        STDEVP(departure_delay) AS std_dev_delay,
        SUM(CASE WHEN departure_delay > 60 THEN 1 ELSE 0 END) * 1.0 
            / COUNT(*) AS severe_delay_ratio
    FROM base
    GROUP BY origin_airport
),
percentiles AS (
    SELECT
        origin_airport,
        PERCENTILE_CONT(0.95) 
            WITHIN GROUP (ORDER BY departure_delay) AS p95_delay
    FROM base
    GROUP BY origin_airport
)
SELECT
    a.origin_airport,
    a.total_flights,
    a.avg_delay,
    a.std_dev_delay,
    a.severe_delay_ratio,
    p.p95_delay
FROM aggregated a
JOIN percentiles p
    ON a.origin_airport = p.origin_airport
WHERE a.total_flights >= 10000
ORDER BY a.avg_delay DESC;