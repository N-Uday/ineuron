-- 1.Dimension Table: Products

-- product_id (Primary Key)
-- product_name
-- category
-- brand
-- price
-- Dimension Table: Customers

-- customer_id (Primary Key)
-- customer_name
-- city
-- state
-- country
-- Dimension Table: Time

-- date_id (Primary Key)
-- date
-- year
-- month
-- day
-- Fact Table: Sales

-- sale_id (Primary Key)
-- product_id (Foreign Key referencing Products.product_id)
-- customer_id (Foreign Key referencing Customers.customer_id)
-- date_id (Foreign Key referencing Time.date_id)
-- sales_amount

-- 2. 

-- Create the Sales fact table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    date_id INT,
    sales_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (date_id) REFERENCES Time(date_id)
);

-- Populate the Sales fact table with sample data
INSERT INTO Sales (product_id, customer_id, date_id, sales_amount)
VALUES
    (1, 1, 1, 1000.00),
    (2, 2, 1, 1500.00),
    (3, 1, 2, 800.00),
    (4, 3, 2, 1200.00);

-- Retrieve total sales amount for each product
SELECT p.product_name, SUM(s.sales_amount) AS total_sales_amount
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- Retrieve total sales amount for each customer in a specific month
SELECT c.customer_name, SUM(s.sales_amount) AS total_sales_amount
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Time t ON s.date_id = t.date_id
WHERE t.month = 'January'
GROUP BY c.customer_name;

-- Retrieve the top-selling products
SELECT p.product_name, SUM(s.sales_amount) AS total_sales_amount
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales_amount DESC
LIMIT 5;
