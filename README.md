# Task-6-Sales-Trend-Analysis-Using-Aggregations

In this project, I performed an end-to-end sales analysis using MySQL. Starting with a raw Sales.csv, I first cleaned the data by running UPDATE scripts to remove commas from the order_value_EUR column and convert it to a DECIMAL. Next, I transformed the text-based date column (in m/d/Y format) into a standard DATE type using STR_TO_DATE. With the data clean, I wrote an aggregate query to calculate total revenue and order volume, grouping by year and month name. Finally, I sorted the results using ORDER BY with year and monthname.
