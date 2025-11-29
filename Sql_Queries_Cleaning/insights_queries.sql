-- Top 10 Items by Revenue
SELECT TOP 10
    item_name,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY item_name
ORDER BY total_sales DESC;


-- Top 10 Items by Quantity
SELECT TOP 10
    item_name,
    SUM(quantity) AS total_quantity
FROM balaji_sales
GROUP BY item_name
ORDER BY total_quantity DESC;


-- Payment Mode Split
SELECT 
    transaction_type,
    COUNT(order_id) AS total_orders,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY transaction_type;


-- Monthly Orders
SELECT
    YEAR(CONVERT(date, date)) AS sale_year,
    MONTH(CONVERT(date, date)) AS sale_month,
    COUNT(order_id) AS monthly_orders
FROM balaji_sales
GROUP BY YEAR(CONVERT(date, date)), MONTH(CONVERT(date, date))
ORDER BY sale_year, sale_month;


-- Day of Week Performance
SELECT 
    DATENAME(WEEKDAY, CONVERT(date, date)) AS weekday_name,
    COUNT(order_id) AS total_orders
FROM balaji_sales
GROUP BY DATENAME(WEEKDAY, CONVERT(date, date))
ORDER BY total_orders DESC;
