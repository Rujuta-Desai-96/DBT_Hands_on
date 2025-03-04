{{ config(materialized='view') }}

SELECT
    id AS product_id,
    cost,
    category,
    name,
    brand,
    retail_price,
    department,
    sku,
    distribution_center_id
FROM ELOOK_COMMERCE.DBT_RSANJAYDESAI.products
