use datawarehouseanalytics;

-- Calculating running total sales over the whole time period (months)
select
	order_date,
    total_sales,
    sum(total_sales) over(order by order_date) as running_total_sales
from
(select date_format(order_date,"%Y-%m") as order_date, sum(sales_amount) as total_sales
from gold_fact_sales
where order_date is not null
group by 1
order by 1) t1;

-- Calculating running total sales for each year separately
select
	order_date,
    total_sales,
    sum(total_sales) over(partition by left(order_date,4) order by order_date) as running_total_sales
from
(select date_format(order_date,"%Y-%m") as order_date, sum(sales_amount) as total_sales
from gold_fact_sales
where order_date is not null
group by 1
order by 1) t1;

-- Calculating moving average of price monthly
select
	order_date,
    average_price,
    round(avg(average_price) over(order by order_date)) as moving_average_price
from
(select date_format(order_date,"%Y-%m") as order_date, round(avg(price)) as average_price
from gold_fact_sales
where order_date is not null
group by 1
order by 1) t1;