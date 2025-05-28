use datawarehouseanalytics;


-- Creating the tables and loading each file into its respective table

CREATE TABLE gold_dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date null,
	create_date date null);
    
TRUNCATE TABLE gold_dim_customers;

load data infile 'gold_dim_customers.csv' into table gold_dim_customers
FIELDs TERMINATed by ','
ignore 1 lines;
-- =============================================================================
CREATE TABLE gold_dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date);
    
TRUNCATE TABLE gold_dim_products;

load data infile 'gold_dim_products.csv' into table gold_dim_products
FIELDs TERMINATed by ','
ignore 1 lines;
-- =============================================================================
CREATE TABLE gold_fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int);

TRUNCATE TABLE gold_fact_sales;

load data infile 'gold_fact_sales.csv' into table gold_fact_sales
FIELDs TERMINATed by ','
ignore 1 lines;

