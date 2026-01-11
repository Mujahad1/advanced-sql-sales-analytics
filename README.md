# Advanced SQL Sales Analytics

## Project Overview
This project focuses on analyzing sales data using advanced SQL techniques to
derive actionable business insights. The analysis covers time-based trends,
cumulative growth, product performance, and revenue contribution to support
data-driven decision-making.

The project is structured to reflect real-world analytics workflows used in
industry.

---

## Tech Stack
- SQL Server
- Advanced SQL
- Window Functions
- Star Schema Data Model

---

## Data Model
The dataset follows a star schema design:

- fact_sales  
  Stores transactional sales data such as sales_amount, quantity, order_date,
  customer_key, and product_key.

- dim_products  
  Stores product attributes such as product_name and category.

This structure enables efficient and scalable analytical queries.

---

## Problem Statement
Business stakeholders require insights into:
- How sales evolve over time
- Whether the business is growing or declining
- Which products perform above or below expectations
- Which categories contribute most to total revenue

This project addresses these questions using structured SQL analysis.

---

## Analyses Performed

### 1. Trend and Seasonality Analysis
- Analyzed sales and quantity over time
- Aggregated data at daily, monthly, and yearly levels
- Used DATETRUNC() for accurate time-based grouping

### 2. Cumulative Growth Analysis
- Calculated running total of sales using window functions
- Evaluated long-term business growth patterns

### 3. Moving Average Analysis
- Applied moving averages to smooth short-term fluctuations
- Identified underlying sales trends

### 4. Product Performance Analysis
- Analyzed yearly sales performance by product
- Compared current sales with historical average and previous year sales
- Used window functions such as AVG() and LAG()

### 5. Part-to-Whole Analysis
- Calculated category-wise revenue contribution
- Determined percentage share of each category in total sales

---

## Key Business Outcomes
- Identified long-term sales growth patterns
- Detected seasonality and demand cycles
- Highlighted high-performing and declining products
- Quantified revenue contribution by category
- Enabled data-driven strategic decision-making

---

## Performance and Best Practices
- Indexed date columns for faster time-based queries
- Used DATETRUNC() instead of string-based date formatting for better performance
- Leveraged window functions to ensure scalable analytics

---

## Repository Structure
