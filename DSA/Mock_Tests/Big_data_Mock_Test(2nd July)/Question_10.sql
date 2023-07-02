select customer_id, sum(amount) as total_amount
from Purchases
group by customer_id
order by total_amount desc
limit 5;
