CREATE DATABASE supply_chain_analysis;
USE supply_chain_analysis;


SELECT COUNT(*)
FROM supply_chain;

-- Total Sale--
 SELECT ROUND(SUM(Sales),2) AS total_sales
 FROM supply_chain;

-- Total Profit--
SELECT ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain;

-- Average Delivery Days-- 
SELECT ROUND(AVG(`Delivery Days`),2) AS avg_delivery_days
 FROM supply_chain;
 
 -- Delay Percentage-- 
 SELECT ROUND(SUM(`Delayed`)/COUNT(*)*100,2) AS delay_percentage 
 FROM supply_chain;
 
 -- Top 10 countries with delay-- 
 SELECT `Order Country` ,
 COUNT(*) AS delayed_orders
 FROM supply_chain 
 WHERE `Delayed`=1
 GROUP BY `Order Country`
 ORDER BY delayed_orders DESC
 LIMIT 10;
 
 -- Shipping mode performance-- 
 SELECT `Shipping Mode` ,
 ROUND(AVG(`Delivery Days`),2)AS avg_delivery_days
 FROM supply_chain 
 GROUP BY `Shipping Mode`
 ORDER BY avg_delivery_days DESC;
 
 -- Sales by category-- 
 SELECT `Category Name`,
 ROUND(SUM(Sales),2) AS total_sales
 FROM supply_chain 
 GROUP BY `Category Name`
 ORDER BY total_sales DESC;
 
 -- Profit by category-- 
SELECT `Category Name`,
ROUND(SUM(`Order Profit Per Order`),2)AS total_profit
FROM supply_chain
GROUP BY `Category Name`
ORDER BY total_profit DESC;

-- Top Performance Region-- 
SELECT `Order Region`,ROUND(SUM(`Order Profit Per Order`),2) AS total_profit 
FROM supply_chain
GROUP BY `Order Region`
ORDER BY total_profit DESC;

-- Monthly Sales Trend-- 
SELECT `Order Year`,`Order Month`,
ROUND(SUM(Sales),2) AS monthly_sales
FROM supply_chain
GROUP BY `Order Year`,`Order Month`
ORDER BY `Order Year`,`Order Month`;

-- Shipping cost Vs Profit-- 
SELECT 
ROUND(AVG(`Benefit per order`),2)AS avg_benefits,
ROUND(AVG(`Order Profit Per Order`),2)AS avg_profit
FROM supply_chain;

-- Most delayed product category-- 
SELECT `Category Name`,
COUNT(*) AS delayed_orders
FROM supply_chain
WHERE `Delayed`=1
GROUP BY `Category Name`
ORDER BY delayed_orders DESC;

-- Region wise deleivery performance-- 
SELECT `Order Region`,
ROUND(AVG(`Delivery Days`),2) AS avg_delivery_days,
ROUND((SUM(`Delayed`)/COUNT(*))*100,2) AS delay_percentage
FROM supply_chain
GROUP BY `Order Region`
ORDER BY delay_percentage DESC;

-- Top loss making products-- 
SELECT `Product Name`,
ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;

-- Top products by sales-- 
SELECT `Product Name`,
ROUND(SUM(Sales),2) AS total_sales
FROM supply_chain
GROUP BY `Product Name`
Order BY total_sales DESC
LIMIT 10;

-- Customer segment analysis-- 
SELECT `Customer Segment`,
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY total_sales DESC;

-- Top sates by sales--
SELECT `Order State`,
ROUND(SUM(Sales),2) AS total_sales
FROM supply_chain
GROUP BY `Order State`
ORDER BY total_sales DESC
LIMIT 10;
 
-- Top market by profit-- 
SELECT Market,
ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain 
GROUP BY Market
ORDER BY total_profit DESC;

-- Average profit margin by category-- 
SELECT `Category Name`,
ROUND(AVG(`Profit Margin`),2) AS avg_profit_margin
FROM supply_chain 
GROUP BY `Category Name`
ORDER BY avg_profit_margin DESC;

-- Most frequent Orders products-- 
SELECT `Product Name`,
SUM(`Order Item Quantity`) AS total_quantity
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_quantity DESC
LIMIT 10;
 