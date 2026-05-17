create schema bronze;


create table bronze.sales
(
order_id varchar(50),
order_date varchar(50),
customer varchar(50),
product varchar(50),
category varchar(50),
quantity varchar(50),
unit_price varchar(50),
Total_Amount varchar(50)
)

select * from bronze.sales

copy into bronze.sales
from 'https://<your-storage-account>.dfs.core.windows.net/datalake/sales.csv'
WITH
(
file_type = 'csv',
firstrow = 2,
fieldterminator = ',',
rowterminator = '0x0A'
) 