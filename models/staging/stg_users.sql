{{ config(materialized='view') }}

SELECT
    id AS user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    street_address,
    postal_code,
    city,
    country,
    latitude,
    longitude,
    traffic_source,
    TO_TIMESTAMP_NTZ(created_at, 'YYYY-MM-DD HH24:MI:SS') AS created_at
FROM {{ source('elook_commerce', 'users') }}
