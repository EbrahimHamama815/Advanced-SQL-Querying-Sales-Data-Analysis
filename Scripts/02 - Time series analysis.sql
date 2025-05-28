use datawarehouseanalytics;


 -- A yearly overview of sales
select 
    year(order_date) as order_year,
    sum(sales_amount) as total_sales,
    count(distinct customer_key) as total_customers,
    sum(quantity) as total_quantity_sold
from gold_fact_sales
where order_date is not null
group by 1
order by 1;
-- =============================================================================
 -- A monthly overview of sales to analyze seasonal behaviours
select 
    month(order_date) as order_month,
    sum(sales_amount) as total_sales,
    count(distinct customer_key) as total_customers,
    sum(quantity) as total_quantity_sold
from gold_fact_sales
where order_date is not null
group by 1
order by 1;
-- =============================================================================
-- A month-year overview to track change over time
select 
    date_format(order_date,'%Y-%m') as order_month_year,
    sum(sales_amount) as total_sales,
    count(distinct customer_key) as total_customers,
    sum(quantity) as total_quantity_sold
from gold_fact_sales
where order_date is not null
group by 1
order by 1;
