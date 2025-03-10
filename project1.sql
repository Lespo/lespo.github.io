/*

Run data quality checks

1. Check the count of the youtube channels which should be equal 100
2. Data needs 4 fields
3. Channel name = String, other columns = Numeric
4. Duplicate count check(unique records)

*/

-- Row count check

SELECT COUNT(*) as No_Of_Rows
FROM view_uk_youtubers_2024

-- Column Count Check

SELECT 
	COUNT(*) 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtubers_2024'

-- Data Quality Check

SELECT COLUMN_NAME, DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtubers_2024'

-- Duplicate count check

SELECT channel_name,
	COUNT(*) as duplicate_count
FROM view_uk_youtubers_2024
GROUP BY channel_name
HAVING COUNT(*) > 1
