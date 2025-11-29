-- 1. Convert date column into SQL date format (DD-MM-YYYY, MM/DD/YYYY → DATE)

UPDATE balaji_sales
SET date = 
    CASE 
        WHEN date LIKE '%-%-%' 
            THEN CONVERT(VARCHAR(10), TRY_CONVERT(DATE, date, 105), 23)
        ELSE CONVERT(VARCHAR(10), TRY_CONVERT(DATE, date, 101), 23)
    END;


-- 2. Replace NULL transaction_type values with 'Online'

UPDATE balaji_sales
SET transaction_type = 'Online'
WHERE transaction_type IS NULL;


-- 3. Standardize time_of_sale entries (optional cleanup)

UPDATE balaji_sales
SET time_of_sale = 
    CASE 
        WHEN time_of_sale LIKE '%Morning%' THEN 'Morning'
        WHEN time_of_sale LIKE '%Afternoon%' THEN 'Afternoon'
        WHEN time_of_sale LIKE '%Evening%' THEN 'Evening'
        WHEN time_of_sale LIKE '%Night%' THEN 'Night'
        WHEN time_of_sale LIKE '%Midnight%' THEN 'Midnight'
        ELSE time_of_sale
    END;
