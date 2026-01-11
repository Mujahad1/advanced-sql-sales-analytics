-- =====================================================
-- Trend & Seasonality Analysis
-- Objective:
-- Analyze how sales and quantity evolve over time
-- =====================================================

-- Daily trend
SELECT 
    order_date,
    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_quantity
FROM dbo.gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_date
ORDER BY order_date;


-- Monthly / Yearly trend using DATETRUNC (Best Practice)
SELECT
    DATETRUNC(YEAR, order_date) AS order_year,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM dbo.gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR, order_date)
ORDER BY order_year;

