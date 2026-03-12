SELECT 
 f.date_date,
 (f.operational_margin-c.ads_cost) as ads_margin,
 f.avg_basket as average_basket,
 f.operational_margin,
 c.ads_cost,
 c.ads_impression,
 c.ads_click as ads_clicks,
 f.quantity_sold as quantity,
 f.revenue,
 (f.revenue-f.purchase_cost) as margin,
 f.purchase_cost,
 f.shipping_fee,
 f.logcost as log_cost,
 f.ship_cost
FROM {{ref('finance_days')}} as f 
INNER JOIN {{ref('int_campaigns_day')}} as c 
ON f.date_date = c.date_date
order BY f.date_date desc

