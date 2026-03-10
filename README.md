# 📊 Retail Customer Analytics: RFM Segmentation Pipeline

## 📌 Project Overview
This project is an end-to-end **Data Analytics & BI Pipeline** designed to transform raw e-commerce transaction data into actionable business strategy. By analyzing over 500,000 rows of historical sales data, this pipeline identifies high-value customer segments using the **RFM (Recency, Frequency, Monetary)** framework.

The goal is to move beyond "descriptive" charts and provide "prescriptive" insights—identifying which customers are loyal "Champions" and which are "At Risk" of churning.

## 🛠️ Tech Stack
* **Infrastructure:** Google Cloud Platform (Compute Engine VM)
* **Data Ingestion:** Python (Pandas, OpenPyXL, Pandas-GBQ)
* **Cloud Warehouse:** Google BigQuery (SQL)
* **Security:** GCP IAM & Service Accounts
* **BI Visualization:** Looker Studio / Power BI (Coming Soon)

## 📈 5-Day Roadmap
- [x] **Day 1: Data Ingestion & Cloud Environment Setup** (Completed)
- [x] **Day 2:** Exploratory Data Analysis (EDA) & SQL Modeling (Completed)
- [x] **Day 3:** The RFM Engine (Segmentation Logic) (Completed)
- [ ] **Day 4:** Live Dashboard Development
- [ ] **Day 5:** Insights, Documentation & Case Study

---

## 🛠 Technical Skills Demonstrated (Day 1)

### 🛰️ Batch ETL & Data Hygiene
* **Data Pre-processing:** Engineered a Python script to handle a large-scale (.xlsx) dataset, implementing logic to remove null `CustomerIDs` and filter out "Cancelled" transactions.
* **Schema Enforcement:** Managed data type conversion (e.g., float to integer for IDs) to ensure high-performance joins in the cloud warehouse.
* **Cloud Ingestion:** Successfully streamed **541,909 rows** of cleaned data directly into **Google BigQuery** (`retail_analytics.raw_transactions`).

### ☁️ Cloud Infrastructure & DevOps
* **IAM & Security:** Configured **Service Account** authentication using JSON keys, adhering to the principle of least privilege by assigning the `BigQuery Admin` role.
* **Headless Environment Setup:** Managed Python dependencies and environment variables on a remote Linux VM (`bondzie@devops`).
* **Advanced Troubleshooting:** Resolved complex cloud-native hurdles, including:
    * **Invalid JWT Signatures:** Debugged authentication token issues.
    * **System Time Synchronization:** Used `timedatectl` to sync VM clocks for secure API handshakes.
    * **403 Access Denied:** Troubleshot BigQuery API permissions and dataset accessibility.

## 🛠 Technical Skills Demonstrated (Day 2)
### 🔍 Business Intelligence & Data Auditing
* **Data Integrity Validation:** Executed SQL audit scripts in BigQuery to verify 0% null `CustomerIDs` and confirm date ranges (Dec 2010 – Dec 2011).
* **KPI Baseline Engineering:** Calculated core business metrics including Total Revenue (~£891k), Unique Customers (4,339), and Average Order Value (£480).
* **Trend Analysis:** Identified a 104% revenue surge in Q4 (November peak), providing critical context for "Recency" weighting in the upcoming model.

### 📈 Retention & Behavioral Analytics
* **Frequency Distribution:** Mapped the "Loyalty Gap," revealing that 34% of the base are one-time shoppers, while a high-value "Elite" group of **1.2% have 10+ orders.**
* **Churn Identification:** Quantified "Single-Purchase Churn" as a primary business risk, setting the stage for targeted re-engagement strategies in Day 3.

### 📂 Professional SQL Version Control
* **Modular Scripting:** Organized analytical queries into a numbered sequence (`01_data_audit`, `02_executive_kpi_summary`, `03_monthly_sales_trends`, and `04_customer_loyalty_baseline`) for reproducible research.
* **Documentation:** Implemented header comments and descriptive aliases in SQL to ensure team-wide readability.

## 🛠 Technical Skills Demonstrated (Day 3)
### 🧠 Algorithmic Customer Scoring
* **Feature Engineering:** Developed a multi-step SQL pipeline to calculate **Recency** (days since last purchase), **Frequency** (total unique orders), and **Monetary** (total spend) per customer.
* **Statistical Bucketing:** Implemented the `NTILE(5)` window function to distribute the customer base into five equal quintiles, assigning scores from 1 (lowest) to 5 (highest).
* **RFM Cell Generation:** Used string concatenation to create unique behavioral IDs (e.g., '555' for Champions, '111' for Lost) for granular targeting.

### 💰 Revenue Contribution Analysis
* **The Pareto Check:** Engineered a contribution query that revealed a high revenue concentration: **7.97% of customers (Loyal Customers) generate 43.76% of total revenue.**
* **Aggregated Business Logic:** Used CTEs (`WITH clauses`) to compare segment-specific metrics against global store totals in a single execution.
* **Data-Driven Strategy:** Identified the "Loyal Customers" segment (346 customers) responsible for almost **£4 million** in revenue, providing a clear target for high-ROI loyalty marketing.
---

## 📂 Project Structure
```text
/scripts
  └── upload_retail_data.py   # Secure ETL script using Service Account keys
/sql
  ├── 01_data_audit.sql                   # Verification of data hygiene
  ├── 02_executive_kpi_summary.sql        # High-level KPI calculations
  ├── 03_monthly_sales_trend.sql          # Monthly revenue and order growth
  ├── 04_loyalty_baseline.sql             # Distribution of purchase frequency
  ├── 05_rfm_model_generation.sql         # Scoring every single customer on a scale of 1-5
  └── 06_customer_loyalty_count.sql       # Knowing total number of loyal customers with revenue they generate
/data
  └── (Ignored)               # Raw .xlsx dataset
service_account.json          # (Ignored via .gitignore) Cloud Credentials
README.md
requirements.txt
