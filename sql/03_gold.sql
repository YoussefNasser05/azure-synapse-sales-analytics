create schema gold;


create view gold.vu_sales
AS
select 
   order_id ,
   order_date ,
   customer ,
   product ,
   category ,
   quantity ,
   unit_price ,
   Total_Amount,
   year(order_date) as 'year'
from silver.sales

CREATE view gold.kpis
AS
select 
sum(Total_Amount) as 'Total_revenue',
COUNT(DISTINCT order_id) as 'Total_order',
SUM(quantity) as 'Total_quantity',
COUNT(DISTINCT customer) as 'Total_customers'
from gold.vu_sales

select * from gold.kpis

CREATE view gold.sales_per_year
AS
select 
year,
sum(Total_Amount) as 'Total_revenue'
from gold.vu_sales
group by year

select * from gold.sales_per_year

CREATE view gold.sales_per_customer
AS
select 
customer,
sum(Total_Amount) as 'Total_revenue'
from gold.vu_sales
group by customer

select * from gold.sales_per_customer

CREATE view gold.sales_per_product
AS
select 
product,
sum(Total_Amount) as 'Total_revenue'
from gold.vu_sales
where product <> 'UNKNOWN'
group by product

select * from gold.sales_per_product







