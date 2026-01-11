-- =====================================================
-- Part-to-Whole Analysis
-- Objective:
-- Identify revenue contribution by product category
-- =====================================================

WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM dbo.gold.fact_sales f
    LEFT JOIN dbo.dim.products p
        ON f.product_key = p.product_key
    GROUP BY p.category
)

SELECT 
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND(
        CAST(total_sales AS FLOAT) / SUM(total_sales) OVER () * 100,
        2
    ) AS contribution_percentage
FROM category_sales
ORDER BY contribution_percentage DESC;

