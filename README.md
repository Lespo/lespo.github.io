---
title: "[Your Name] - Data Analytics & Engineering Portfolio"
description: "Showcasing data solutions, ETL pipelines, and analytical insights"
---

# 👋 Hi, I'm [Your Name]  
**Data Engineer | Analytics Specialist | SQL & Python Developer**  
📍 [Your Location] | 📧 [Your Email] | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin)](https://linkedin.com/in/yourprofile) [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github)](https://github.com/yourusername)

---

## 🛠️ Technical Skills  
**Languages:**  
- SQL (Advanced)  
- Python (Pandas, PySpark)  
- R  

**Tools & Platforms:**  
- ETL/ELT: Apache Airflow, dbt, AWS Glue  
- Databases: PostgreSQL, BigQuery, Snowflake  
- Visualization: Tableau, Power BI, Looker  
- Cloud: AWS, GCP, Azure  

**Certifications:**  
- Google Data Engineer  
- AWS Certified Solutions Architect  
- Databricks Spark Developer  

---

## 📂 Featured Projects  

### 1. YouTube Analytics Pipeline ([Code](https://github.com/yourrepo/youtube-pipeline))  
**Tech Stack:** SQL Server, Python, Apache Airflow, Tableau  
- Built an end-to-end ETL pipeline to process 10M+ rows of UK YouTuber data  
- Cleaned channel names using `SUBSTRING` and `CHARINDEX` ([Example](https://yourportfolio.com/youtube-cleaning))  
- Created Tableau dashboards showing subscriber/view trends  

```sql
-- Sample cleaning query
SELECT 
  CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE)-1) AS channel_name,
  total_subscribers 
FROM top_uk_youtubers_2024;
