with result as (
select 
    p.product_id,
    u.purchase_date,
    coalesce(u.units, 0) as units,
    p.price * coalesce(u.units, 0) as total_amt,
    sum(coalesce(u.units, 0)) over (partition by p.product_id) as total_quant
from 
    Prices p
    left join UnitsSold u on p.product_id = u.product_id 
    and u.purchase_date >= start_date 
    and u.purchase_date <= end_date
)
select 
    product_id, 
    round(coalesce(sum(total_amt) / nullif(total_quant, 0), 0), 2) as average_price
from 
    result
group by 
    product_id;
