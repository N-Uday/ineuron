select customer_id, count(*) as order_count
from Orders
group by customer_id
order by order_count desc;
