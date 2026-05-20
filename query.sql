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
 
 
