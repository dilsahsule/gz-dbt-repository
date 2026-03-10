SELECT
 o.date_date as date_date,
 COUNT(DISTINCT o.orders_id) as nb_transactions,
 ROUND(SUM(o.revenue),2) as revenue,
 ROUND(SUM(o.revenue)/ COUNT(DISTINCT o.orders_id),2) as avg_basket,
 ROUND(SUM(o.operational_margin),2) as operational_margin,
 ROUND(SUM(o.purchase_cost),2) as purchase_cost,
 ROUND(SUM(o.shipping_fee),2) as shipping_fee,
 ROUND(SUM(o.logcost),2) as logcost,
 SUM(o.quantity) as quantity_sold
from {{ ref("int_orders_operational")}} as o
GROUP BY o.date_date
ORDER BY o.date_date desc