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
FROM {{ source('elook_commerce', 'products') }}
