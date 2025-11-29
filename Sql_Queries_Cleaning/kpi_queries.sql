-- Total Sales
SELECT SUM(transaction_amount) AS total_sales
FROM balaji_sales;


-- Total Orders
SELECT COUNT(order_id) AS total_orders
FROM balaji_sales;


-- Total Quantity Sold
SELECT SUM(quantity) AS total_quantity
FROM balaji_sales;


-- Average Order Value
SELECT 
    SUM(transaction_amount) * 1.0 / COUNT(order_id) AS avg_order_value
FROM balaji_sales;


-- Best Selling Item (by revenue)
SELECT TOP 1 
    item_name,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY item_name
ORDER BY total_sales DESC;


-- Quantity Sold of the Best Item
SELECT TOP 1
    item_name,
    SUM(quantity) AS total_quantity
FROM balaji_sales
GROUP BY item_name
ORDER BY total_quantity DESC;


-- Sales by Item Type
SELECT 
    item_type,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY item_type;


-- Orders by Time of Day
SELECT 
    time_of_sale,
    COUNT(order_id) AS total_orders
FROM balaji_sales
GROUP BY time_of_sale;


-- Daily Sales Trend
SELECT 
    CONVERT(date, date) AS sale_date,
    SUM(transaction_amount) AS daily_sales
FROM balaji_sales
GROUP BY CONVERT(date, date)
ORDER BY sale_date;
