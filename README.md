# 📊 Retail Customer Analytics: RFM Segmentation Pipeline

## 📌 Project Overview
This project is an end-to-end **Data Analytics & BI Pipeline** designed to transform raw e-commerce transaction data into actionable business strategy. By analyzing over 500,000 rows of historical sales data, this pipeline identifies high-value customer segments using the **RFM (Recency, Frequency, Monetary)** framework.

The goal is to move beyond "descriptive" charts and provide "prescriptive" insights—identifying which customers are loyal "Champions" and which are "At Risk" of churning.



## 🛠️ Tech Stack
* **Data Ingestion:** Python (Pandas, OpenPyXL)
* **Cloud Warehouse:** Google BigQuery (SQL)
* **Data Transformation:** SQL (Window Functions & CTEs)
* **BI Visualization:** Looker Studio / Power BI

## 🚀 Key Analytics Features
* **Batch ETL:** Automated cleaning of 500k+ rows, handling missing values and transaction anomalies.
* **Customer Segmentation:** SQL-driven logic to score customers based on purchase behavior.
* **Business Strategy:** Data-driven recommendations for marketing and retention.

## 📈 5-Day Roadmap
- [x] **Day 1: Data Ingestion & Environment Setup** (Current)
- [ ] **Day 2:** Exploratory Data Analysis (EDA) & SQL Modeling
- [ ] **Day 3:** The RFM Engine (Segmentation Logic)
- [ ] **Day 4:** Live Dashboard Development
- [ ] **Day 5:** Insights, Documentation & Case Study

---

## 🛠 Technical Skills Demonstrated (Day 1)

### 🛰️ Batch ETL & Data Hygiene
* **Data Pre-processing:** Engineered a Python script to handle a large-scale (.xlsx) dataset, implementing logic to remove null `CustomerIDs` and filter out "Cancelled" transactions.
* **Schema Enforcement:** Managed data type conversion (e.g., float to integer for IDs) to ensure high-performance joins in the cloud warehouse.
* **Cloud Ingestion:** Utilized `pandas-gbq` to stream cleaned data directly into a **Google BigQuery** dataset (`retail_analytics`).

---

## 📂 Project Structure
```text
/scripts
  └── upload_retail_data.py   # ETL script for ingestion
/sql
  └── (Coming Day 2)           # Descriptive Analysis queries
/data
  └── (Ignored)               # Raw .xlsx dataset
README.md
requirements.txt
