SELECT
 DATE_TRUNC(date_date,MONTH) as datemonth,
 SUM(ads_margin) as ads_margin,
 AVG(average_basket) as average_basket,
 SUM(ads_impression) as ads_impression,
 SUM(ads_clicks) as ads_clicks,
 SUM(quantity) as quantity,
 SUM(revenue) as revenue,
 SUM(purchase_cost) as purchase_cost,
 SUM(margin) as margin,
 SUM(shipping_fee) as shipping_fee,
 SUM(log_cost) as log_cost,
 SUM(ship_cost) as ship_cost
from {{ref("finance_campaigns_day")}}  
GROUP BY datemonth
ORDER BY datemonth desc