select * from balaji_sales;

-- ✅ TOTAL SALES (₹)
SELECT SUM(transaction_amount) AS total_sales
FROM balaji_sales;

-- ✅ TOTAL ORDERS
SELECT COUNT(order_id) AS total_orders
FROM balaji_sales;

-- ✅ TOTAL QUANTITY SOLD
SELECT SUM(quantity) AS total_quantity_sold
FROM balaji_sales;

-- ✅ AVERAGE ORDER VALUE (AOV)
SELECT 
    SUM(transaction_amount) * 1.0 / COUNT(order_id) AS avg_order_value
FROM balaji_sales;

-- ✅ SALES BY ITEM TYPE (Fastfood vs Beverages)
SELECT 
    item_type,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY item_type;

-- ✅ BEST-SELLING ITEM (By Revenue)
SELECT TOP 1
    item_name,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY item_name
ORDER BY total_sales DESC;

-- ✅ SALES TREND OVER TIME (Daily)
SELECT 
    CONVERT(date, date, 105) AS sale_date,
    SUM(transaction_amount) AS daily_sales
FROM balaji_sales
GROUP BY CONVERT(date, date, 105)
ORDER BY sale_date;

-- ✅ ORDERS PER MONTH
SELECT 
    YEAR(CONVERT(date, date, 105)) AS sale_year,
    MONTH(CONVERT(date, date, 105)) AS sale_month,
    COUNT(order_id) AS monthly_orders
FROM balaji_sales
GROUP BY 
    YEAR(CONVERT(date, date, 105)),
    MONTH(CONVERT(date, date, 105))
ORDER BY sale_year, sale_month;

-- ✅ SALES BY TIME OF DAY
SELECT 
    time_of_sale,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY time_of_sale
ORDER BY total_sales DESC;

-- ✅ TOP 10 ITEMS BY SALES
SELECT TOP 10
    item_name,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY item_name
ORDER BY total_sales DESC;

-- ✅ TOP ITEMS BY QUANTITY SOLD
SELECT 
    item_name,
    SUM(quantity) AS total_quantity
FROM balaji_sales
GROUP BY item_name
ORDER BY total_quantity DESC;

-- ✅ SALES BY TRANSACTION TYPE (Cash vs Online)
SELECT 
    transaction_type,
    SUM(transaction_amount) AS total_sales
FROM balaji_sales
GROUP BY transaction_type;

-- ✅ AVERAGE ORDER VALUE BY PAYMENT MODE
SELECT 
    transaction_type,
    AVG(transaction_amount) AS avg_order_value
FROM balaji_sales
GROUP BY transaction_type;

-- ✅ SALES BY STAFF (received_by)
SELECT 
    received_by,
    SUM(transaction_amount) AS total_sales,
    COUNT(order_id) AS total_orders
FROM balaji_sales
GROUP BY received_by;

-- ✅ HEATMAP: ITEM SALES BY TIME OF DAY
SELECT 
    item_name,
    time_of_sale,
    SUM(quantity) AS total_quantity
FROM balaji_sales
GROUP BY item_name, time_of_sale
ORDER BY item_name, time_of_sale;
