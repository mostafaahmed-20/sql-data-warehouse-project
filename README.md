# Data Warehouse and analytics project serves PowerBi usecase.

### Welcome to the Project

## 📌 Project Overview
This project focuses on building a robust Data Warehouse (DWH) using SQL to transform raw operational data into an analytical format. The final structure is optimized for Power BI reporting, following the Star Schema methodology to ensure high performance and ease of use for business intelligence.

🛠 Tech Stack
Database: SQL Server
Modeling: Star Schema (Fact and Dimension tables)
Visualization: Power BI
Language: SQL

## 🏗 Data Warehouse Architecture

The project follows the standard ETL process to move data from source to the warehouse:
Staging Layer: Raw data import with minimal changes.
Transformation Layer: Cleaning data, handling nulls, and creating surrogate keys.
Presentation Layer (DWH): Final Fact and Dimension tables ready for Power BI.

## 📐 Data Modeling (Star Schema)

To optimize Power BI performance, the warehouse is structured as follows:
Fact Tables: * Fact_Sales: Contains metrics like quantity, revenue, and discount.
Dimension Tables: * Dim_Products: Product details and categories.
Dim_Customers: Demographics and locations.
Dim_Date: Custom calendar for time-intelligence calculations (YTD, MoM).
Dim_Stores: Branch locations and managers.

## 🚀 Key SQL Features Implemented

Data Cleaning: Used COALESCE and CASE statements to handle missing values.
Date Dimension: A script to generate a continuous date table for better time-series analysis in Power BI.
Views: Created specific SQL Views to simplify the connection for Power BI users.

## 📊 Power BI Integration

The DWH is designed to support the following insights:
Customer Behavior.
Product Performance.
Sales Trend.
Product Analysis: Profitability per category.
تك وتضيفهم للبوست:

💡 Key Insights from the Project:
Revenue Concentration: Discovering that the Bikes category is the primary revenue driver, accounting for over 96% of total sales (approximately $28.32M).

Market Performance: Identified the United States and Australia as the top-performing markets, contributing nearly $18.3M in combined sales.

Growth Trajectory: Successfully tracked a massive profit surge, with a 122.7% increase compared to the previous year, highlighting a strong upward growth trend.

## 🙋‍♂️ About Me
Hi There! i'am Mostafa, a passionate Data Engineer and Analytics Specialist with a strong focus on building scalable data architectures and transforming raw data into actionable business insights.

My expertise lies in bridging the gap between technical data engineering (ETL, Data Warehousing, SQL) and strategic data analytics (Power BI, Data Modeling). I enjoy designing efficient database schemas and optimizing data pipelines to ensure high-performance reporting and storytelling.
