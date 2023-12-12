SELECT count(*) FROM data_tutorial.pizza_sales;
USE data_tutorial;
SELECT * FROM pizza_sales;

-- 1) Total Revenue
Select * From pizza_sales;

SELECT sum(total_price) AS "Total Revenue"
FROM pizza_sales;

-- 2) Average Order Value
SELECT * FROM pizza_sales;

SELECT (sum(total_price) / count(distinct(order_id))) AS "Avg Order Value"
FROM pizza_sales;

-- 3) Total Pizza Sold
SELECT SUM(quantity) as "Total Pizza Sold" FROM pizza_sales;

-- 4) Total Orders Placed

SELECT count(distinct(order_id)) AS "Total Order Placed" from pizza_sales;

-- 5) Average Pizza Per order

SELECT round(sum(quantity)/ count(distinct(order_id)),2) AS "Avg Pizza Per Order" 
FROM pizza_sales;

-- B)Charts
-- 1) Daily Trend for Total Orders

SELECT dayname(order_date) as "order day", count(distinct(order_id)) as "Total Orders"
from pizza_sales
group by dayname(order_date);

-- 2) Hourly Trend
SELECT * FROM pizza_sales;

SELECT hour(order_time) as order_hours, count(distinct(order_id)) as Total_orders
from pizza_sales
group by hour(order_time);


-- 3) Percentage Of Sales by Pizza Category
SELECT 
    pizza_category, 
    round(sum(total_price),2) as Total_Sale,
    round(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE month(order_date) = 1),2 ) AS percentage
FROM 
    pizza_sales
WHERE month(order_date) = 1
GROUP BY 
    pizza_category;

SELECT * FROM pizza_sales;


-- 4) Percentage of Sales by Pizza Size

SELECT pizza_size, round(sum(total_price),2), round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as percent_sales
from pizza_sales
group by pizza_size
order by percent_sales desc;

-- 5) Total Pizza sold by pizza Category

SELECT pizza_category, sum(quantity) as Total_Pizza
from pizza_sales
group by pizza_category
order by Total_Pizza desc;

-- 6) Top 5 Best Seller by Total Pizzas Sold:

SELECT pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold DESC limit 5;


-- 7) Bottom 5 worst seller by Total Pizza Sold
SELECT pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold limit 5