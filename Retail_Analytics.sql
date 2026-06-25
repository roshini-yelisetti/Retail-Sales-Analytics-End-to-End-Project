USE superstore_db;

-- View First 10 Records

SELECT *
FROM `sample_ superstore`
LIMIT 10;

-- Total Revenue Generated

SELECT
ROUND(SUM(Sales),2) AS Total_Revenue
FROM `sample_ superstore`;

-- Total Number of Orders

SELECT
COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM `sample_ superstore`;

-- Monthly Revenue Trend

SELECT
YEAR(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Year,
MONTH(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Month,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY Year, Month
ORDER BY Year, Month;

-- Monthly Order Volume

SELECT
YEAR(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Year,
MONTH(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Month,
COUNT(DISTINCT `Order ID`) AS Order_Count
FROM `sample_ superstore`
GROUP BY Year, Month
ORDER BY Year, Month;

-- Top 5 Months by Sales

SELECT
YEAR(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Year,
MONTH(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Month,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY Year, Month
ORDER BY Revenue DESC
LIMIT 5;

-- Region Wise Revenue

SELECT
Region,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY Region
ORDER BY Revenue DESC;

-- Top States By Sales

SELECT
State,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

-- Category Wise Sales

SELECT
Category,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY Category
ORDER BY Revenue DESC;

-- Sub Category Wise Sales

SELECT
`Sub-Category`,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY `Sub-Category`
ORDER BY Revenue DESC;

-- Profit By Category

SELECT
Category,
ROUND(SUM(Profit),2) AS Profit
FROM `sample_ superstore`
GROUP BY Category
ORDER BY Profit DESC;

-- Top Selling Products

SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore`
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

-- Customer Segment Revenue

SELECT
Segment,
ROUND(SUM(Sales),2) AS Revenue
FROM `sample_ superstore` 
GROUP BY Segment
ORDER BY Revenue DESC;

SHOW FULL TABLES IN superstore_db
WHERE TABLE_TYPE = 'VIEW';

DROP VIEW IF EXISTS sales_summary;

CREATE VIEW sales_summary AS
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM `sample_ superstore`
GROUP BY Category;



