use datawarehouseanalytics;


-- Segment products into cost ranges and count how many products fall into each segment
with product_segments as 
(select 
	product_key,
    product_name,
    cost,
    case 
		when cost < 100 then "Below 100$"
		when cost between 100 and 500 then "100$-500$"
        when cost between 500 and 1000 then "500$-1000$"
        else "Above 1000$" 
	end as cost_range
from gold_dim_products)

select cost_range, count(product_key) as total_products
from product_segments
group by 1
order by 2 desc;
-- =============================================================================
-- group customers into three segments based on their spending behaviours
-- 		VIP: customers with at least 12 months of history and spending more than 5000$
-- 		Regular: customers with at least 12 months of history and spending 5000$ or less
-- 		New: customers with less than 12 months of history 
with spending as
(select 
	c.customer_key,
    sum(f.sales_amount) as total_spending,
    min(f.order_date) as first_order,
    max(f.order_date) as last_order,
    timestampdiff(month,min(f.order_date),max(f.order_date)) as lifespan
from gold_fact_sales f
left join gold_dim_customers c on f.customer_key = c.customer_key
group by 1),

customer_segments as 
(select 
	customer_key,
    total_spending,
    lifespan,
    case 
		when lifespan >= 12 and total_spending > 5000 then "VIP"
        when lifespan >= 12 and total_spending < 5000 then "Regular"
        else "New" 
	end as customer_category
from spending)

select customer_category, count(customer_key) as total_customers
from customer_segments
group by 1;