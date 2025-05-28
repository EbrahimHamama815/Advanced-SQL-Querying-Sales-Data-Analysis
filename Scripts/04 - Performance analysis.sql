use datawarehouseanalytics;

-- comparing yearly product sales to their average:
with yearly_product_sales as
(select 
	year(f.order_date) as order_year,
    p.product_name,
    sum(f.sales_amount) as sales
from gold_fact_sales f
left join gold_dim_products p on f.product_key = p.product_key
where f.order_date is not null
group by 1,2)

select 
	order_year,
    product_name,
    sales,
    round(avg(sales) over(partition by product_name)) as avg_sales,
    sales-round(avg(sales) over(partition by product_name)) as diff_avg,
    case 
		when sales-round(avg(sales) over(partition by product_name)) > 0 then "Above Average" 
        when sales-round(avg(sales) over(partition by product_name)) = 0 then "Average"
        else "Below Average" end as avg_change
from yearly_product_sales
order by 2,1;

-- comparing yearly product sales to their previous year (Year-over-Year Analysis):
with yearly_product_sales as
(select 
	year(f.order_date) as order_year,
    p.product_name,
    sum(f.sales_amount) as sales
from gold_fact_sales f
left join gold_dim_products p on f.product_key = p.product_key
where f.order_date is not null
group by 1,2)

select 
	order_year,
    product_name,
    sales,
    lag(sales) over(partition by product_name order by order_year) as prev_sales,
    sales-lag(sales) over(partition by product_name order by order_year) as diff_prev,
    case 
		when sales-lag(sales) over(partition by product_name order by order_year) > 0 then "Increase" 
        when sales-lag(sales) over(partition by product_name order by order_year) < 0 then "Decrease"
        else "No Change" end as prev_year_change
from yearly_product_sales
order by 2,1;