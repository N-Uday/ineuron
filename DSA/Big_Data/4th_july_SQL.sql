create database sql_assignment
use sql_assignment;

-- 1st Question
select name, email_id 
from Employees;


-- 2nd Question
select *
from Customers
where city = 'New York';


-- 3rd Question
select * 
from Users
order by DateOfBirth desc;


-- 4th Question
select * 
from Users
order by RegistrationDate asc;


-- 5th Question
select name, position, salary 
from Employees
where salary = (select max(salary) from Employees);


-- 6th Question
select * from Customers
where Phone like '+1-___-___-____';


-- 7th Question
select name, sum(amount) as total_purchase_amount
from Orders
group by name
order by total_purchase_amount desc
limit 5;


-- 8th Question
select Category, 
       sum(sales_amount) as total_sales_amount, 
       (sum(sales_amount)/(select sum(sales_amount) from sales)) * 100 as percentageOfSales
from Sales
group by Category;


-- 9th Question
with temp as ( select customer_name, email_id, 
                      sum(amount) as total_purchase_amount
               from Orders
               group by customer_name, email_id)

select customer_name, email_id, total_purchase_amount
from temp
where total_purchase_amount = (select max(total_purchase_amount)
                               from temp);
         

