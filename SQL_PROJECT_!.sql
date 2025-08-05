-- sql Reatil sales anaylyis - P1
create database sql_project_1;
use sql_project_1;

-- create table 
create table Retail_sales1 (
transactions_id int primary key,
	sale_date date,
	sale_time time,
	customer_id	int,
    gender varchar (25),
	age	int,
    category varchar (15),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float
    );
    use sql_project_1;


 -- data exploration --
 
 -- how many sales we have ?
 select count( * ) as total_sales from Retail_sales1;
 
 -- how many customers we have ?
 select count(customer_id) as total_customers from retail_sales1;

-- how many unique customers we have ?
 select count( distinct customer_id) as total_customers from retail_sales1;
 
 -- how many unique category we have ?
  select distinct category as total_customers from retail_sales1;
  
  
  -- Data Analyis & Business Key Problems & Answers -- 
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
select * 
from Retail_sales1
 where
sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from retail_sales1 where category = "clothing" 
and 
quantiy = 4
and 
date_format(sale_date, '%Y-%m');

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category ?
select 
category, 
sum(total_sale ) as net_slaes 
from retail_sales1
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category?
select 
avg(age) as avg_cust
from retail_sales1
where
category = 'beauty';

--  Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000?
select transactions_id
from 
retail_sales1
where 
total_sale > "1000"; 

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category?
select category, gender, count(*) as total_trans
from retail_sales1
group by
category,gender
order by
category;

--  Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year?
select 
year(sale_date) as year,
month(sale_date) as month,
avg(total_sale) as avg_sale
from retail_sales1
group by
year,month
order by
year, avg_sale desc;

select * from retail_sales1;

 -- Write a SQL query to find the number of unique customers who purchased items from each category?
 select category, count(distinct customer_id) as unique_cust from retail_sales1 group by category;
 
 
 -- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)?
  SELECT
  CASE
    WHEN HOUR(sale_time) <= 12 THEN 'Morning'
    WHEN HOUR(sale_time) > 12 AND HOUR(sale_time) <= 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(*) AS quantiy
FROM retail_sales1
GROUP BY
  CASE
    WHEN HOUR(sale_time) <= 12 THEN 'Morning'
    WHEN HOUR(sale_time) > 12 AND HOUR(sale_time) <= 17 THEN 'Afternoon'
    ELSE 'Evening'         
  END;
  
--   end of project