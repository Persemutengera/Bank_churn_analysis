import pandas as pd
from pathlib import Path

# Load dataset
PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_FILE = PROJECT_DIR / "data" / "Churn_Modelling.csv"

df = pd.read_csv(DATA_FILE)

# Overall churn
print("OVERALL CHURN RATE")
print(f"{df['Exited'].mean() * 100:.2f}%")

# Churn by geography
print("\nCHURN BY GEOGRAPHY")
geo = df.groupby("Geography").agg(
    Customers=("CustomerId", "count"),
    Churned=("Exited", "sum"),
    Churn_Rate=("Exited", "mean")
)
geo["Churn_Rate"] *= 100
print(geo.sort_values("Churn_Rate", ascending=False).round(2))

# Churn by gender
print("\nCHURN BY GENDER")
gender = df.groupby("Gender").agg(
    Customers=("CustomerId", "count"),
    Churned=("Exited", "sum"),
    Churn_Rate=("Exited", "mean")
)
gender["Churn_Rate"] *= 100
print(gender.sort_values("Churn_Rate", ascending=False).round(2))

# Churn by active membership
print("\nCHURN BY ACTIVE MEMBERSHIP")
membership = df.groupby("IsActiveMember").agg(
    Customers=("CustomerId", "count"),
    Churned=("Exited", "sum"),
    Churn_Rate=("Exited", "mean")
)
membership["Churn_Rate"] *= 100
membership.index = membership.index.map({
    0: "Inactive",
    1: "Active"
})
print(membership.round(2))

# Churn by number of products
print("\nCHURN BY NUMBER OF PRODUCTS")
products = df.groupby("NumOfProducts").agg(
    Customers=("CustomerId", "count"),
    Churned=("Exited", "sum"),
    Churn_Rate=("Exited", "mean")
)
products["Churn_Rate"] *= 100
print(products.sort_values("Churn_Rate", ascending=False).round(2))
