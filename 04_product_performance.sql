-- =====================================================
-- Product Performance Analysis
-- Objective:
-- Compare product sales against historical average
-- and previous year performance
-- =====================================================

WITH yearly_sales AS (
    SELECT 
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM dbo.gold.fact_sales f
    LEFT JOIN dbo.dim.products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY YEAR(f.order_date), p.product_name
)

SELECT 
    order_year,
    product_name,
    current_sales,
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_from_avg,
    CASE 
        WHEN current_sales > AVG(current_sales) OVER (PARTITION BY product_name)
            THEN 'Above Average'
        ELSE 'Below Average'
    END AS avg_performance,
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS previous_year_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS yoy_difference,
    CASE 
        WHEN current_sales > LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year)
            THEN 'Increasing'
        WHEN current_sales < LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year)
            THEN 'Decreasing'
        ELSE 'No Change'
    END AS yoy_trend
FROM yearly_sales
ORDER BY product_name, order_year;

