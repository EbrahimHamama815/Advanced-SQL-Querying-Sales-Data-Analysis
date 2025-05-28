use datawarehouseanalytics;

/*
============================================================
Product Report
============================================================
Purpose:
 - This report consolidates key product metrics and behaviors.

Highlights:
 1. Gathers essential fields such as product name, category, subcategory, and cost.
 2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
 3. Aggregates product-level metrics:
    - total orders
    - total sales
    - total quantity sold
    - total customers (unique)
    - lifespan (in months)
 4. Calculates valuable KPIs:
    - recency (months since last sale)
    - average order revenue (AOR)
    - average monthly revenue
============================================================
*/


create view gold_report_products as
with base_query as
-- getting essential fields
(select 
	f.order_number,
    f.order_date,
    f.customer_key,
    f.sales_amount,
    f.quantity,
    p.product_key,
    p.product_name,
    p.category,
    p.subcategory,
    p.cost
 from gold_fact_sales f
 left join gold_dim_products p on p.product_key = f.product_key
 where order_date is not null),
 
 product_aggregation as
 -- performing the necessary aggregations
 (select
	product_key,
    product_name,
    category,
    subcategory,
    cost,
	timestampdiff(month,min(order_date),max(order_date)) as lifespan_in_months,
    max(order_date) as last_sale_date,
    count(distinct order_number) as total_orders,
    count(distinct customer_key) as total_customers,
    sum(sales_amount) as total_sales,
    sum(quantity) as total_quantity,
    round(avg(cast(sales_amount as float)/nullif(quantity,0)),1) as avg_selling_price
from base_query
group by 1,2,3,4,5)

-- segmenting products by revenue, and calculating some important KPIs
select 
	product_key,
    product_name,
    category,
    subcategory,
    cost,
    last_sale_date,
    timestampdiff(month, last_sale_date, curdate()) as recency_in_months,
    case
		when total_sales > 50000 then "High-Performer"
        when total_sales >= 10000 then "Mid-Range"
        else "Low-Performer" 
	end as product_segment,
    lifespan_in_months,
    total_orders,
    total_customers,
	total_sales,
    total_quantity,
    avg_selling_price,
    case
		when total_orders = 0 then 0
        else total_sales/total_orders
	end as avg_order_revenue,
    case
		when lifespan_in_months = 0 then total_sales
        else total_sales/lifespan_in_months
	end as avg_monthly_revenue
from product_aggregation;

