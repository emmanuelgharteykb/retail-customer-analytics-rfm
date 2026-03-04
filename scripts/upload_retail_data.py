import pandas as pd
from google.oauth2 import service_account
import pandas_gbq
import os
import sys

# --- 1. CONFIGURATION ---
# Your updated Project ID
PROJECT_ID = 'retail-analytics-project-101' 
TABLE_ID = 'retail_analytics.raw_transactions'

# Define absolute paths to prevent "File Not Found" errors
BASE_DIR = os.path.expanduser('~/retail-customer-analytics-rfm')
KEY_PATH = os.path.join(BASE_DIR, 'service_account.json')
DATA_PATH = os.path.join(BASE_DIR, 'data/online_retail.xlsx')

# --- 2. AUTHENTICATION ---
if not os.path.exists(KEY_PATH):
    print(f"❌ ERROR: Key file not found at {KEY_PATH}")
    sys.exit(1)

print("🔐 Authenticating using service_account.json...")
credentials = service_account.Credentials.from_service_account_file(KEY_PATH)

# --- 3. LOAD & CLEAN DATA ---
try:
    print(f"📂 Loading data...")
    df = pd.read_excel(DATA_PATH, engine='openpyxl')
    
    print(f"🧹 Cleaning {len(df)} rows...")
    df = df.dropna(subset=['CustomerID'])
    df['CustomerID'] = df['CustomerID'].astype(int)
    df = df[~df['InvoiceNo'].astype(str).str.startswith('C')]
    
    # --- 4. UPLOAD ---
    print(f"🚀 Uploading to BigQuery: {PROJECT_ID}...")
    df.to_gbq(
        TABLE_ID, 
        project_id=PROJECT_ID, 
        if_exists='replace', 
        credentials=credentials,
        progress_bar=True
    )
    print("✅ Success! Data is live in BigQuery.")

except Exception as e:
    print(f"❌ Error: {e}")
