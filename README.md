# Business Intelligence Project

## Overview
This project focuses on Business Intelligence (BI) development for an online clothing sales company. The project includes data modeling, data warehouse design, KPI implementation, dashboards using Tableau, and statistical analysis using R. The goal is to provide data-driven insights to support business decision-making.

## Project Components
### 1. Data Warehouse Design
- **ERD Diagram**: Shows relationships between entities.
- **Data Warehouse Schema**: Includes dimension tables (Customers, Products, Dates, Delivery Companies) and fact tables (Order Details, Reviews).
- **Hierarchies & Calculated Fields**: Age groups, price categories, delivery speed, etc.

### 2. KPI Implementation
- **Revenue Target Achievement**: Tracks revenue growth compared to the previous year.
- **Order Growth Rate**: Monitors changes in the number of orders across quarters.
- **Customer Retention Rate**: Identifies repeat customers.
- **Shipping Performance**: Evaluates on-time deliveries.

### 3. Dashboards (Tableau)
#### **Tactical Management Dashboard**
- Order trends by quarter.
- Discount trends by month.
- Revenue trends throughout the year.
- Orders by weekday vs. weekend.
- Quarterly order growth comparison.

#### **Strategic Management Dashboard**
- Revenue by city and gender.
- Average discount by age and gender.
- Number of orders per city.
- KPI: Percentage of returning customers.
- Filters for year, month, and age group.

#### **Executive Dashboard**
- **KPI Summary**: VIP customers, orders above $300, returning customers, on-time deliveries.
- **Revenue by Time**: Drill-down functionality for different time periods.
- **Product Sales by Category**: Includes average review rating and number of reviews.
- **Orders by Delivery Company**: Cost and quantity analysis.
- **Top Cities by Revenue**.
- **Best-Selling Products**: Sorted by popularity, including average rating.

### 4. OLAP Analysis
- Pivot table for revenue breakdown by product type and customer type (VIP/Regular).
- Stacked bar chart for new vs. returning customer orders by year.
- Dual-axis chart for delayed deliveries vs. total orders over time.
- Analysis filters: city, product color, shipping company.

### 5. Statistical Analysis (R)
#### **Hypothesis 1: Returning vs. New Customer Spending**
- **Test Used**: Two-sample T-test.
- **Result**: Returning customers spend significantly more than new customers.

#### **Hypothesis 2: Price vs. Sales Volume**
- **Test Used**: Pearson Correlation.
- **Result**: No significant correlation between item price and sales quantity.

#### **Hypothesis 3: Revenue Distribution Over Time**
- **Test Used**: Kruskal-Wallis test.
- **Result**: Significant differences in revenue distribution across 2020-2023.

## Tools Used
- **Tableau**: Dashboard visualization.
- **R**: Statistical analysis and hypothesis testing.
- **Excel**: Data manipulation and warehouse structuring.
- **SQL**: Querying and managing the data warehouse.

## How to Use This Repository
1. Open the Tableau dashboard files to explore the visualized data insights.
2. Run the provided R scripts to replicate the statistical analysis.
3. Refer to the data warehouse schema and documentation for database structure understanding.

## Connecting To My Profile On Public.Tableau:
https://public.tableau.com/app/profile/noam.ganim/vizzes
