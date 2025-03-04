-- models/staging/stg_order_items_ranked.sql
{{ config(materialized="table") }}

select
    *,
    row_number() over (
        partition by order_id, product_id order by created_at_tz desc
    ) as rank
from {{ ref("stg_order_items_TZ") }}
