create schema silver;


drop table silver.sales


create table silver.sales
(
order_id int,
order_date date,
customer varchar(50),
product varchar(50),
category varchar(50),
quantity FLOAT,
unit_price FLOAT,
Total_Amount float
)

select * from silver.sales
select * from bronze.sales

select *
from bronze.sales
where order_id is null


insert into silver.sales
select 
--order_id
-- cast and conver , convert datatype
cast(order_id as int) as order_id,

--order_date
--because there is null, he cant convert it so we put condition ( isnull )
--try_convert and cast diffrence is try convert will put null if there is values thats cant convert it and continue the code
--                                                            cast(isnull(order_date , '01-10-2026') as date) as order_date,
--                                                            try_convert(date , isnull(order_date , '01-10-2026')) order_date
--so to vanish all the null we use case end
CASE
     when try_convert(date, order_date) is not null then  try_convert(date, isnull(order_date , '01-10-2026'))
     else '01-10-2026'
end as order_date,

--customer
--trim deletes spaces
upper(trim(isnull(customer, 'unknown'))) as customer,

--product
upper(trim(isnull(product, 'unknown'))) as product,

--category
--all values are elecrtonics no diffrenece but some values are missing or have letters so add all values as electronics
'Electronics' as category,

--quantity
--some are negative so convert to positive so use abs function
abs(cast(quantity as FLOAT)) as quantity,

--unit_price
ABS(ISNULL(try_cast(unit_price as FLoat), 0)) as unit_price,

--Total_Amount
abs(ISNULL(try_cast(unit_price as float), 0)) * abs(cast(quantity as FLOAT)) as Total_Amount





from bronze.sales 


select * from silver.sales






