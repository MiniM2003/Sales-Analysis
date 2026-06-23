select * from sales_analysis.sales ;

-- Total Sales 
select round(sum(sales),2) as Total_Sales
from sales_analysis.sales ;

-- Total Profit 
select round(sum(profit),2) as Total_Profit
from sales_analysis.sales ;

-- Total Orders
select count(`order id`) Total_Count
from sales_analysis.sales;

-- Profit Margin 
select round((sum(profit)/sum(sales)*100),2) Profit_Margin
from sales_analysis.sales ;

-- Profit by Region
select region , round(sum(profit),2) as Profit
from sales_analysis.sales
group by region ;

-- Sales by Category
select category,round(sum(sales),2) as Sales
from sales_analysis.sales 
group by category;

-- Top 10 Customer
select `Customer Name` , round(sum(sales),2) as Sales
from  sales_analysis.sales 
group by `Customer Name`
order by sales desc
limit 10 ;

SHOW COLUMNS FROM sales_analysis.sales;

-- Top States 
select state , round(sum(profit),2) as Profit
from sales_analysis.sales 
group by state
order by Profit desc
limit 5;

-- sales and profit by sub category 
select `Sub-Category` ,
        round(sum(sales),2) as Sales ,
        round(sum(profit),2) as Profit
from sales_analysis.sales
group by `Sub-Category`    
order by Sales desc , Profit desc;

-- Top 8 selling products
select `product name` ,
        round(sum(sales),2) as Total_Sales
from sales_analysis.sales  
group by `product name` 
order by Total_Sales desc
limit 8;

-- Loss making products
SELECT *
FROM (
    SELECT 
        `product name`,
        ROUND(SUM(profit), 2) AS Total_Profit
    FROM sales_analysis.sales
    GROUP BY `product name`
) t
WHERE Total_Profit < 0
ORDER BY Total_Profit;

-- Loss making sub category
select `Sub-Category` ,
        round(sum(profit),2) Total_Profit
from sales_analysis.sales
group by `Sub-Category`
having Total_Profit < 0
order by Total_Profit  ;
         
-- Sales and profit by Segment
select segment ,
	   round(sum(sales),2) as Total_Sales ,
	   round(sum(profit),2) as Total_Profit
from sales_analysis.sales
group by segment
order by Total_Sales desc , Total_profit desc ;       
		
-- yearly sales
select Year ,
       round(sum(sales),2) as Sales ,
       round(sum(profit),2) as Profit
from sales_analysis.sales
group by Year 
order by Year ;

-- Monthly trends
select Month ,
       round(sum(sales),2) as Sales ,
       round(sum(profit),2) as Profit
from sales_analysis.sales
group by Month
order by Month ;

-- Discount impact on Profit
select category,
	   round(sum(sales),2) as Sales ,
       round(avg(Discount),2) as Avg_Discount ,
       round(sum(profit),2) as Profit
from sales_analysis.sales
group by category ;
       
-- Highest Profit Margin Category wise
SELECT 
    category,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin
FROM sales_analysis.sales
GROUP BY category
ORDER BY Profit_Margin DESC;

-- cumulative sales
SELECT `Order Date`,
       SUM(Sales) AS Daily_Sales,
	   round(
       SUM(SUM(Sales)) OVER(ORDER BY `Order Date`) , 2 
       )AS Running_Total
FROM sales_analysis.sales
GROUP BY `Order Date`;

