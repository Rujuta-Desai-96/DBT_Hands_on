

With 
o_items as 
( select order_id,
user_id,
status,
sale_price from {{ ref("mart_order_items") }}
),

u_users as(
    select First_Name,
    Last_Name,
    USER_ID
    from {{ ref("mart_users") }}
)

select u.First_Name,
u.last_name,
u.USER_ID,
SUM(o.sale_price) AS TotalAmountSpent 
from o_items o
JOIN u_users u
on u.user_id = o.user_id
WHERE o.status NOT IN ('Cancelled', 'Returned')

GROUP BY u.First_Name, u.Last_Name, u.USER_ID
ORDER BY SUM(o.sale_price) DESC



