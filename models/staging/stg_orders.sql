{{ config(materialized='view') }}

SELECT
    order_id,
    user_id,
    status,
    gender,
    TO_TIMESTAMP_NTZ(created_at, 'YYYY-MM-DD HH24:MI:SS') AS created_at,
    TO_TIMESTAMP_NTZ(returned_at, 'YYYY-MM-DD HH24:MI:SS') AS returned_at,
    TO_TIMESTAMP_NTZ(shipped_at, 'YYYY-MM-DD HH24:MI:SS') AS shipped_at,
    TO_TIMESTAMP_NTZ(delivered_at, 'YYYY-MM-DD HH24:MI:SS') AS delivered_at,
    num_of_item
FROM {{ source('elook_commerce', 'orders') }}
