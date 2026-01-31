CREATE DATABASE sql_project1;
use sql_project1;


DROP TABLE IF EXISTS retail_sales; 

CREATE TABLE retai_saies (
 transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT

)


SELECT * FROM retai_saies;

SELECT *
FROM retai_saies
where sale_date IS NULL
	or 
    sale_date IS NULL
    or
    sale_time IS null;


DELETE FROM retai_saies
WHERE 
sale_date IS NULL
	or 
    sale_date IS NULL
    or
    sale_time IS null;


-----

-- DATA EXPLORATION

-- --HOW AMNY SALES WE Have

SELECT COUNT(*)  as total_sale FROM retai_saies  ;

-- how many unique customar we have-- 


SELECT COUNT(DISTINCT customer_id) AS total_sale
FROM retai_saies;


SELECT DISTINCT category
FROM retai_saies;



-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM retai_saies
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT *
FROM retai_saies
WHERE category = 'Clothing'
    AND sale_date BETWEEN '2022-11-01' AND '2022-11-30'
    AND quantity >= 4;
    

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT * FROM retail_sales;

SELECT category , SUM(total_sale) ,COUNT(*) as total_orders
FROM retail_sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT * FROM retail_sales;

SELECT ROUND(AVG(age) , 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_sales
WHERE total_sale  > 1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category, gender,count(*) AS transgection
FROM retail_sales
GROUP BY category, gender
ORDER BY transgection DESC;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sales
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT * FROM retail_sales;

SELECT customer_id , SUM(total_sale ) as total_sale
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT category , COUNT(DISTINCT customer_id) as customer
FROM retail_sales
GROUP BY category ;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;







