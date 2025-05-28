use datawarehouseanalytics;


-- Which category contribute to the most overall sales
select 
	category,
    sum(sales_amount) as sales,
    concat(round((sum(sales_amount)*100)/(select sum(sales_amount) from gold_fact_sales),2),"%") as sales_percentage
from gold_fact_sales f
left join gold_dim_products p on p.product_key = f.product_key
group by 1
order by 2 desc;