-- Create table for Balaji Fast Food Sales Dataset

CREATE TABLE balaji_sales (
    order_id INT,
    date VARCHAR(20),
    item_name VARCHAR(100),
    item_type VARCHAR(50),
    item_price INT,
    quantity INT,
    transaction_amount INT,
    transaction_type VARCHAR(20),
    received_by VARCHAR(10),
    time_of_sale VARCHAR(20)
);
