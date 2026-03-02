select * from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizza_per_order from pizza_sales