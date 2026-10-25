import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

# Locate the project and dataset
PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_FILE = PROJECT_DIR / "data" / "Churn_Modelling.csv"
OUTPUT_DIR = PROJECT_DIR / "python" / "outputs"

# Create output folder if it does not exist
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# Load dataset
df = pd.read_csv(DATA_FILE)

# Set up reusable chart formatting
plt.rcParams["figure.figsize"] = (9, 5)
plt.rcParams["axes.titlesize"] = 14
plt.rcParams["axes.labelsize"] = 11


# 1. Overall churn distribution
churn_counts = df["Exited"].value_counts().sort_index()
labels = ["Retained", "Churned"]

plt.figure()
plt.bar(labels, churn_counts.values)
plt.title("Bank Customer Churn Distribution")
plt.xlabel("Customer Status")
plt.ylabel("Number of Customers")

for i, value in enumerate(churn_counts.values):
    plt.text(i, value + 100, f"{value:,}", ha="center")

plt.tight_layout()
plt.savefig(OUTPUT_DIR / "01_churn_distribution.png", dpi=300)
plt.close()


# 2. Churn rate by geography
geo_churn = df.groupby("Geography")["Exited"].mean().mul(100)
geo_churn = geo_churn.sort_values(ascending=False)

plt.figure()
plt.bar(geo_churn.index, geo_churn.values)
plt.title("Customer Churn Rate by Geography")
plt.xlabel("Country")
plt.ylabel("Churn Rate (%)")

for i, value in enumerate(geo_churn.values):
    plt.text(i, value + 0.5, f"{value:.2f}%", ha="center")

plt.ylim(0, max(geo_churn.values) + 6)
plt.tight_layout()
plt.savefig(OUTPUT_DIR / "02_churn_by_geography.png", dpi=300)
plt.close()


# 3. Churn rate by gender
gender_churn = df.groupby("Gender")["Exited"].mean().mul(100)
gender_churn = gender_churn.sort_values(ascending=False)

plt.figure()
plt.bar(gender_churn.index, gender_churn.values)
plt.title("Customer Churn Rate by Gender")
plt.xlabel("Gender")
plt.ylabel("Churn Rate (%)")

for i, value in enumerate(gender_churn.values):
    plt.text(i, value + 0.5, f"{value:.2f}%", ha="center")

plt.ylim(0, max(gender_churn.values) + 6)
plt.tight_layout()
plt.savefig(OUTPUT_DIR / "03_churn_by_gender.png", dpi=300)
plt.close()


# 4. Churn rate by active membership
membership_churn = df.groupby("IsActiveMember")["Exited"].mean().mul(100)
membership_churn.index = membership_churn.index.map({
    0: "Inactive",
    1: "Active"
})

plt.figure()
plt.bar(membership_churn.index, membership_churn.values)
plt.title("Customer Churn Rate by Active Membership")
plt.xlabel("Membership Status")
plt.ylabel("Churn Rate (%)")

for i, value in enumerate(membership_churn.values):
    plt.text(i, value + 0.5, f"{value:.2f}%", ha="center")

plt.ylim(0, max(membership_churn.values) + 6)
plt.tight_layout()
plt.savefig(OUTPUT_DIR / "04_churn_by_membership.png", dpi=300)
plt.close()


print("Visualisations created successfully!")

print("\nSaved chart files:")
for file in sorted(OUTPUT_DIR.glob("*.png")):
    print(file)
