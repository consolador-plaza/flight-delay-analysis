-- ============================================
-- File: 01_data_preparation.sql
-- Description: Filter dataset to remove NULL departure delays
-- ============================================

SELECT *
FROM flights
WHERE departure_delay IS NOT NULL;