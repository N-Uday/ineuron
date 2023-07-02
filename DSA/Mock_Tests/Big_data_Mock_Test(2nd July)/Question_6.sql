select * from Customers
where age > 25 and
customer_id in (select customer_id from Purchases
                group by customer_id
                having count(*) >= 1);
