# 🛒 E-Commerce Sales Analytics Dashboard

## 📌 Project Overview

End-to-end data analytics project using the Brazilian E-Commerce Public Dataset by Olist.

The project covers data cleaning, exploratory data analysis, SQL-based business analysis, and an interactive Power BI dashboard to uncover insights around sales, customers, payments, and product performance.

## 🎯 Objective

To analyze e-commerce transaction data and answer key business questions:

- What are the revenue trends over time?
- Which product categories generate the most sales?
- Which states drive the most sales?
- What payment methods are most frequently used?
- How satisfied are customers based on review scores?

## 🛠️ Tools & Technologies

- *Python* (Pandas, NumPy, Matplotlib, Seaborn) — Data Cleaning & EDA
- *MySQL* — SQL Analysis
- *Power BI* — Interactive Dashboard & Visualization
- *Jupyter Notebook* — Analysis Documentation

## 📂 Dataset

*Brazilian E-Commerce Public Dataset by Olist*
Source: Kaggle
The dataset contains 9 relational tables covering orders, customers, products, payments, reviews, sellers, geolocation, and product categories.

## 🔍 Project Workflow

1. *Data Cleaning* — Handled missing values, duplicates, and data type conversions using Python.
2. *Exploratory Data Analysis* — Performed univariate analysis, bivariate analysis, correlation analysis, and outlier detection.
3. *SQL Analysis* — Used aggregations, multi-table JOINs, subqueries, and window functions to answer business questions.
4. *Dashboard Development* — Built an interactive Power BI dashboard with KPIs, filters, and visualizations.

## 🐍 Python Analysis

### Analysis Performed

- Data loading and inspection
- Data cleaning
- Missing value analysis
- Duplicate checking
- Univariate analysis
- Bivariate analysis
- Correlation analysis
- Outlier analysis
- Sales and customer analysis
- Data visualization

## 🗄️ SQL Analysis

### SQL Skills

- SELECT
- COUNT, SUM, AVG
- GROUP BY
- ORDER BY
- LIMIT
- Multi-table JOINs
- Subqueries
- Window Functions
- RANK()

The SQL analysis includes payment analysis, product category analysis, seller performance, and order/review analysis. 1

## 📊 Power BI Dashboard

The Power BI dashboard provides an interactive view of:

- Total Sales
- Total Orders
- Total Customers
- Average Order Value
- Average Review Score
- Monthly Sales Trend
- Top Product Categories
- Top States
- Payment Method Distribution
- Customer Distribution Across Brazil

## 📈 Key Insights

- Total Payment Value: *₹1,60,08,872.12*
- Credit Card accounted for *73.92% of payment transactions*
- *São Paulo (SP)* was the top-performing state
- Average Review Score: *4.09/5*
- Peak Sales Month: *November 2017*
- Repeat Customer Rate: *3.12%*
- cool_stuff was the highest-revenue product category in the SQL analysis. 2

## 📁 Repository Structure

```text
Olist-Ecommerce-Data-Analysis/
│
├── README.md
│
├── Python/
│   └── Ecommerce_Analysis.ipynb
│
├── SQL/
│   └── olist_ecommerce_queries_final_with_results.sql
│
├── PowerBI/
│   └── Olist_Sales_Dashboard.pbix
│
└── Dashboard/
    └── dashboard.png
