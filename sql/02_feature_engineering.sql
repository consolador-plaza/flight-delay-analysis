-- ============================================
-- File: 02_feature_engineering.sql
-- Description: Extract departure hour from HHMM format
-- ============================================

-- Option 1 Derived column (used for analysis)

SELECT 
    ,
    FLOOR(departure_time  100) AS dep_hour
FROM flights;


-- Option 2 Persist column (used in actual workflow)

ALTER TABLE flights
ADD dep_hour INT;

UPDATE flights
SET dep_hour = FLOOR(departure_time  100);