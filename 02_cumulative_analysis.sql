-- =====================================================
-- Cumulative Sales Analysis
-- Objective:
-- Evaluate long-term business growth using running totals
-- =====================================================

SELECT 
    order_month,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_month) AS running_total
FROM (
    SELECT 
        DATETRUNC(MONTH, order_date) AS order_month,
        SUM(sales_amount) AS total_sales
    FROM dbo.gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(MONTH, order_date)
) t
ORDER BY order_month;

