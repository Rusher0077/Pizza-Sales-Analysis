select * from dbo.pizza_sales

-- Daily trend for total orders 
select datename(dw, order_date) as day_of_week, count(distinct order_id) as total_orders
from pizza_sales 
group by DATENAME(dw, order_date)

--Hourly trend for total orders
select datepart(HOUR, order_time) as hours, count(distinct order_id) as total_orders
from pizza_sales
group by datepart(HOUR, order_time)
order by hours

--Percentage of sales by pizza category
select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as percentage_of_total_revenue
from pizza_sales
group by pizza_category