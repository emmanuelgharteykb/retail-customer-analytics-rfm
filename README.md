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
- [ ] **Day 2:** Exploratory Data Analysis (EDA) & SQL Modeling
- [ ] **Day 3:** The RFM Engine (Segmentation Logic)
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

---

## 📂 Project Structure
```text
/scripts
  └── upload_retail_data.py   # Secure ETL script using Service Account keys
/sql
  └── (Coming Day 2)           # Descriptive Analysis queries
/data
  └── (Ignored)               # Raw .xlsx dataset
service_account.json          # (Ignored via .gitignore) Cloud Credentials
README.md
requirements.txt
