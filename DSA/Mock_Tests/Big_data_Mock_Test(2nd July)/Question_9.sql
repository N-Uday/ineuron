select category_name, avg(price) as average_price
from Products
group by category_name;
