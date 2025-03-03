{{ config(materialized='view') }}

SELECT
    id AS order_item_id,
    order_id,
    user_id,
    product_id,
    inventory_item_id,
    status,
    TO_TIMESTAMP_NTZ(created_at, 'YYYY-MM-DD HH24:MI:SS') AS created_at,
    TO_TIMESTAMP_NTZ(shipped_at, 'YYYY-MM-DD HH24:MI:SS') AS shipped_at,
    TO_TIMESTAMP_NTZ(delivered_at, 'YYYY-MM-DD HH24:MI:SS') AS delivered_at,
    TO_TIMESTAMP_NTZ(returned_at, 'YYYY-MM-DD HH24:MI:SS') AS returned_at,
    sale_price
FROM {{ source('elook_commerce', 'order_items') }}
