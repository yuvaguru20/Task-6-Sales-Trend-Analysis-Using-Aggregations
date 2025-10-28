create database task6;
use task6;

-- 1. Remove the commas from the text , Because it changes the datatype
UPDATE sales
SET `order_value_EUR` = REPLACE(`order_value_EUR`, ',', '');

-- 2. Change the column type from text (VARCHAR) to a number (DECIMAL)
ALTER TABLE sales
MODIFY COLUMN `order_value_EUR` DECIMAL(10, 2);

-- 1. Convert the text date (in m/d/Y format) into MySQL's standard DATE format
UPDATE sales
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- 2. Change the column type from text (VARCHAR) to DATE
ALTER TABLE sales
MODIFY COLUMN `date` DATE;

SELECT
    -- a. Use EXTRACT(MONTH FROM order_date) for month (and year) and Use MONTHNAME function for month name
    EXTRACT(YEAR FROM `date`) AS order_year,EXTRACT(MONTH FROM `date`) AS order_month_num,MONTHNAME(`date`) AS order_month,

    -- c. Use SUM() for revenue
    SUM(`order_value_EUR`) AS total_revenue,

    -- d. COUNT(DISTINCT order_id) for volume
    COUNT(DISTINCT order_id) AS order_volume

FROM
    sales 

-- f. Limit results for specific time periods 
WHERE
    `date` BETWEEN '2019-01-01' AND '2020-07-31'

-- b. GROUP BY year/month
GROUP BY
    order_year,order_month_num,
    order_month

-- e. Use ORDER BY for sorting
ORDER BY
    order_year,
    order_month_num;