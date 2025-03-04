-- WITH order_revenues AS (
--     SELECT
--         oi.user_id,
--         SUM(oi.sale_price) AS TotalAmountSpent
--     FROM
--         {{ ref('mart_order_items') }} oi
--     JOIN
--         {{ ref('mart_orders') }} o ON oi.order_id = o.order_id
--     WHERE
--         o.status NOT IN ('Cancelled', 'Returned') 
--         AND oi.status NOT IN ('Cancelled', 'Returned') 
--     GROUP BY
--         oi.user_id
-- )

-- SELECT
--     u.first_name AS FirstName,
--     u.last_name AS LastName,
--     r.TotalAmountSpent
-- FROM
--     order_revenues r
-- JOIN
--     {{ ref('mart_users') }} u ON r.user_id = u.id
-- ORDER BY
--     r.TotalAmountSpent DESC
-- LIMIT 5;


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

LIMIT 5


