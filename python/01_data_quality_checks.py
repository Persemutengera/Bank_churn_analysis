import pandas as pd
from pathlib import Path

# Locate the project and dataset
PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_FILE = PROJECT_DIR / "data" / "Churn_Modelling.csv"

# Load the dataset
df = pd.read_csv(DATA_FILE)

print("=" * 50)
print("BANK CUSTOMER CHURN - DATA QUALITY REPORT")
print("=" * 50)

# 1. Dataset size
print(f"\nTotal records: {len(df):,}")
print(f"Total columns: {len(df.columns)}")

# 2. Column names
print("\nColumn names:")
print(df.columns.tolist())

# 3. Missing values
print("\nMissing values per column:")
print(df.isnull().sum())

# 4. Duplicate records
print(f"\nDuplicate rows: {df.duplicated().sum()}")
print(
    "Duplicate Customer IDs:",
    df["CustomerId"].duplicated().sum()
)

# 5. Churn distribution
print("\nChurn distribution (0 = Retained, 1 = Churned):")
print(df["Exited"].value_counts().sort_index())

# 6. Overall churn rate
churn_rate = df["Exited"].mean() * 100
print(f"\nOverall churn rate: {churn_rate:.2f}%")

# 7. Numeric summary
print("\nNumeric summary:")
print(df.describe())

print("\nData quality checks completed successfully.")
