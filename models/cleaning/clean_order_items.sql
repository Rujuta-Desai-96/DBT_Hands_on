{{ config(materialized='table') }}

SELECT *
FROM {{ ref("stg_order_items_ranked") }}
WHERE rank = 1