-- =====================================================
-- Running Total & Moving Average Analysis
-- Objective:
-- Smooth sales trends and reduce short-term volatility
-- =====================================================

SELECT 
    order_year,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_year) AS running_total,
    AVG(avg_price) OVER (ORDER BY order_year) AS moving_avg_price
FROM (
    SELECT 
        DATETRUNC(YEAR, order_date) AS order_year,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM dbo.gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(YEAR, order_date)
) t
ORDER BY order_year;

