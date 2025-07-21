# 🚘 Carvana Price Trends Analysis

This project explores used car price trends using publicly available data from Carvana.

The main objective is to visually explore price variations across car brands, models, and mileage levels, helping potential buyers and sellers better understand pricing behavior.

---

## 🧹 Data Cleaning & Preparation

The [original dataset](https://www.kaggle.com/datasets/ravishah1/carvana-predict-car-prices) contained various inconsistencies. Below are the key cleaning steps I applied:

- Removed rows with empty or null values.
- Converted text columns into categorical variables.
- Converted price and mileage columns into numerical types.
- Created new columns to extract information such as brand and model.
- Exported the cleaned dataset and uploaded it to Tableau Public for visualization.

Due to the type and volume of the data, all cleaning was done using **Google Sheets**. See the cleaned file at [cleaned data](Projects/Carvana_price_Analysis/Carvana_Data_Clean.csv).

---

## 📊 Dashboard Highlights

A preview of the dashboard is shown below.

- About **22,000 vehicles** were analyzed.
- The **average price** of the listed cars is approximately **$27,000 USD**.
- The **top 5 most listed brands** are:
  - Toyota
  - Nissan
  - Honda
  - Hyundai
  - Chevrolet
- **Tesla** is the most expensive brand on average. On the other end, **Hyundai** and **Kia** have the most affordable listings.

---

## 🔑 Key Insights

### **1. Inverse relationship between Price and Mileage**

There is a clear and consistent negative trend between price and mileage: the higher the mileage, the lower the vehicle’s price. This pattern is visible in the scatter plot.

### **2. Tesla and Lexus maintain high prices despite high mileage**

Unlike other brands, Tesla and Lexus tend to retain high prices even when their vehicles have significant mileage. This could be due to their perception as premium or luxury brands.

### **3. Price distribution varies significantly by brand**

Brands like **BMW** and **Mercedes-Benz** show a wide price distribution, likely due to the variety of models they offer across different segments.

---

## 🛠️ Tools Used

- **Google Sheets**: Data cleaning and preprocessing.
- **Tableau Public**: Dashboard creation and visualization.
- **Git**: Version control and project hosting.

![Dashboard preview](Projects/Carvana_price_Analysis/Dashboard_1.png
