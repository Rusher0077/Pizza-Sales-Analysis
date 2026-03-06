#  Pizza Sales Analysis

##  Project Overview
This project analyzes a pizza store's sales data using **SQL and Excel** to uncover key business insights and visualize performance through an interactive dashboard.

The goal of the project is to transform raw sales data into meaningful insights by calculating key performance indicators (KPIs), performing trend analysis, and presenting the results in a visually engaging Excel dashboard.

The analysis focuses on answering important business questions such as:

- How much revenue does the pizza store generate?
- When are the busiest ordering hours and days?
- Which pizza categories and sizes drive the most revenue?
- What are the best and worst performing pizzas?

---

##  Business Objectives

The project aims to:

- Measure overall business performance using key KPIs  
- Identify peak ordering times  
- Understand customer purchasing patterns  
- Analyze product performance across pizza categories and sizes  
- Identify top and bottom selling pizzas  

---

## Dataset

The dataset contains transaction-level pizza sales information including:

- `order_id`
- `pizza_name`
- `pizza_category`
- `pizza_size`
- `quantity`
- `order_date`
- `order_time`
- `unit_price`
- `total_price`

---

##   Tools Used

| Tool | Purpose |
|-----|------|
| **SQL Server / SSMS** | Data analysis and KPI calculation |
| **Excel** | Data visualization and dashboard creation |
| **Git & GitHub** | Version control and project portfolio |

---

##  Key Performance Indicators (KPIs)

The following KPIs were calculated using SQL queries (Check out the raw SQL files here: [Queries](Queries)) :

### 1. Total Revenue
Total sales generated from all pizza orders.

```sql
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;
```

### 2. Average Order Value
Average revenue generated per order.

```sql
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza_sales;
```

### 3. Total Pizzas Sold
Total number of pizzas sold across all orders.

```sql
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;
```

### 4. Total Orders
Total number of unique orders placed.

```sql
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;
```
### 5. Average Pizzas Per Order
Average number of pizzas purchased per order.

```sql
SELECT CAST(
       CAST(SUM(quantity) AS DECIMAL(10,2)) /
       CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))
       AS DECIMAL(10,2)
       ) AS Avg_Pizzas_per_order
FROM pizza_sales;
```
---

##   Trend Analysis

### 1. Daily Trend for Total Orders
Analyzes which days generate the highest number of orders.

```sql
SELECT DATENAME(DW, order_date) AS order_day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);
```

Insight
Orders are highest during Friday and Saturday evenings.

### 2. Hourly Trend for Orders
Identifies peak hours when customers place orders.

```sql
SELECT DATEPART(HOUR, order_time) AS order_hours,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);
```
### Insight
Peak ordering times occur around:
- **12 PM – 1 PM**
- **5 PM – 7 PM**

--- 

##  Sales Distribution Analysis

### 1. Percentage of Sales by Pizza Category
Indicates which pizza category earns the most sales

```sql
SELECT pizza_category,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 /
    (SELECT SUM(total_price) FROM pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
````

### Insight
The Classic category generates the highest share of sales, closely followed by Supreme category.

| pizza_category | PCT |
|----------------|------|
| Classic | 26.91% |
| Supreme | 25.46% |
| Chicken | 23.96% |
| Veggie | 23.68% |


### 2. Percentage of Sales by Pizza Size
Shows which pizza size generates the most revenue.
```sql
SELECT pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 /
    (SELECT SUM(total_price) FROM pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;
```

### Insight
Large size pizza earns the most sales

| pizza_size | PCT |
|------------|------|
| Large | 38.05% |
| Medium | 31.65% |
| Small | 29.06% |
| X-Large | 1.17% |
| XX-Large | 0.07% |

---

##  Product Performance Analysis

### 1. Top 5 Best Selling Pizzas

```sql
SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;
```

### Insight
- **The Classic Deluxe Pizza** generates the highest sales.


### 2. Bottom 5 Least Selling Pizzas

```sql
SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;
```

### Insight
- **The Brie Carre Pizza** has the lowest sales.

---

##  Excel Dashboard

The insights from SQL analysis were visualized in an interactive Excel dashboard.

Dashboard components include:

- KPI summary cards
- Daily order trend
- Hourly order trend
- Sales breakdown by pizza category
- Sales distribution by pizza size
- Top 5 best selling pizzas
- Bottom 5 least selling pizzas
- Interactive date filters

---

##  Dashboard Preview

![Pizza Sales Dashboard](dashboard.png)
---

##  Project Structure
```
Pizza-Sales-Analysis
│
├── Queries
│   └── SQL analysis queries
|
├── Dashboard
│   └── dashboard.png
|
├── pizza_sales.csv
│   └── dataset
│
├── Workbook.xlsx
│   └── Excel dashboard
│
├── PIZZA SALES SQL QUERIES.docx
│   └── documented queries
│
└── README.md
```
---

##  Key Insights

- **Total Revenue:** $817,860  
- **Total Orders:** 21,350  
- **Total Pizzas Sold:** 49,574  
- **Average Order Value:** $38.31  
- **Average Pizzas Per Order:** 2.32  

Additional insights:

- Friday and Saturday evenings are peak ordering times
- Large pizzas contribute the highest share of revenue
- Classic category pizzas generate the most sales
- The Classic Deluxe Pizza is the best-selling item

---

##  Author

### Pallab Dey

GitHub: https://github.com/Rusher0077
