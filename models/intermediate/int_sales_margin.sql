WITH sales AS (
    select *
from {{ ref('stg_raw__sales') }}
),
product AS (
    select * 
from {{ ref('stg_raw__product') }}
)
select 
 s.orders_id,
 s.products_id,
 s.quantity,
 s.revenue,
 s.date_date,
 p.purchase_price,
(s.quantity*p.purchase_price) AS purchase_cost,
(s.revenue-(s.quantity*p.purchase_price)) AS margin
from sales as s
LEFT JOIN product as p ON s.products_id = p.products_id
