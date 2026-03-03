import pandas as pd
from google.cloud import bigquery
import pandas_gbq

# 1. Load the data 
# Note: Ensure the file is in the same folder as this script
print("Loading data from online_retail.xlsx...")
df = pd.read_excel('../data/online_retail.xlsx')

# 2. Basic Cleaning for Analytics
print("Cleaning data...")
# Remove rows with no CustomerID (essential for RFM analysis)
df = df.dropna(subset=['CustomerID'])

# Convert CustomerID to integer (removes the .0)
df['CustomerID'] = df['CustomerID'].astype(int)

# Filter out "Cancelled" orders (StockCodes starting with 'C')
# This ensures our Revenue metrics aren't skewed by returns
df = df[~df['InvoiceNo'].astype(str).str.startswith('C')]

# 3. BigQuery Configuration
# Replace 'your-project-id' with your actual Google Cloud Project ID
project_id = 'your-project-id' 
table_id = 'retail_analytics.raw_transactions'

# 4. Upload to BigQuery
print(f"Uploading {len(df)} cleaned rows to BigQuery...")

# Using 'replace' so you can run this script multiple times if needed
df.to_gbq(table_id, project_id=project_id, if_exists='replace')

print("🚀 Success! Data is now live in BigQuery.")
