with result as (
    select customer_id, min(order_date) as first_order
    from delivery
    group by customer_id
),
check_flag as (
    select r.customer_id, r.first_order, 
    (case when d.order_date=d.customer_pref_delivery_date then 1 else 0 end ) as immediate_flag
    from result r join delivery d
    on r.customer_id=d.customer_id
    and r.first_order = d.order_date
)
select round((sum(immediate_flag)*100/count(*)),2) as immediate_percentage
from check_flag