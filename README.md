# Data Portfolio


This is my portfolio website


# SQL Data Processing: UK Top YouTubers 2024

This document transcribes all SQL queries, results, and system messages from the provided screenshots (1.png to 6.png).

---

## 1. Database Creation (`1.png`)
**SQL Query:**
```sql
CREATE DATABASE YouTube_db;
USE YouTube_db;

SELECT 
  NOMBRE,  
  total_subscribers,  
  total_videos,  
  total_views  
FROM top_uk_youtubers_2024;

SELECT 
  CHARINDEX('@', NOMBRE) AS position_of_at, 
  NOMBRE 
FROM top_uk_youtubers_2024;

SELECT 
  CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1 ) AS VARCHAR(100)) AS channel_name,
  total_subscribers,
  total_videos,
  total_views
FROM top_uk_youtubers_2024;
