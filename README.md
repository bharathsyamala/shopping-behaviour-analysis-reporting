# Shopping Behaviour Analysis Reporting


## Objective

This project analyzes customer shopping behavior using a PostgreSQL-based data warehouse and Tableau dashboards for business performance monitoring and decision support. It builds on my prior [SQL Data Warehouse Engineering](https://github.com/bharathsyamala/sql-data-warehouse-engineering/) project, which implements a Medallion (Bronze–Silver–Gold) architecture to transform raw CRM and ERP data into analytics-ready datasets.

Access the dashboard here - [Shopping Behaviour Analysis]{https://public.tableau.com/views/ShoppingBehaviourAnalysis_17676763770250/ExecutiveSummary?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link}


## Dashboard Scope

The reporting layer was planned to include three dashboards:

### 1. Executive Summary Dashboard (Completed)
- Revenue and order volume trends
- Geographic performance by country
- Delivery performance (On-Time vs Delayed)
- Estimated revenue loss from delayed deliveries

<img width="1849" height="801" alt="Executive Summary (1)" src="https://github.com/user-attachments/assets/757f3b89-ed07-4819-827f-1b3faf7a4a68" />


### 2. Product Research Dashboard (Planned)
- Product and category-level performance
- Pricing and cost analysis
- Sales contribution by product line

### 3. Consumer Pattern Analysis Dashboard (Planned)
- Customer purchase behavior
- Order frequency and basket analysis
- Temporal and regional buying patterns


## Data Foundation

- Source data (CRM and ERP) is provided as CSV files and loaded into PostgreSQL.
- All data cleaning, standardization, and business-rule enforcement is handled in SQL.
- The Gold layer exposes analytics-ready views consumed directly by Tableau.

The repository includes:

- SQL scripts for database setup and transformations
- Cleaned datasets used for dashboard development
- Tableau workbook for the Executive Summary dashboard


## Tools & Technologies

**PostgreSQL** – Data warehouse and transformations
**SQL** – Data cleansing, aggregation, and business logic
**Tableau** – Data visualization and KPI reporting


## Notes

This repository is designed to be reproducible and extensible.

Additional dashboards can be developed directly on top of the existing Gold-layer views without modifying the underlying data model.

