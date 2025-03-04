with
p_product as(
select product_id,
category
from {{ ref("mart_products") }}
),

o_items as(
select product_id,
sale_price
from {{ ref("mart_order_items") }}
WHERE status NOT IN ('Cancelled','Returned')
)

select category, sum(sale_price) as TOTAL_REVENUE
FROM p_product 
JOIN o_items 
on p_product.product_id = o_items.product_id

GROUP BY p_product.category
ORDER BY sum(sale_price) DESC
LIMIT 5


