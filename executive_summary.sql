-- 1. summary - aggregate of 5 years
-- total revenues
-- total sales
-- total orders

select 
    'EUR ' || to_char(sum(sales), 'FM999,999,999') as "Total Revenue",
    to_char(sum(quantity), 'FM999,999,999') as "Total Units Sold",
    to_char(count(order_number), 'FM999,999,999') as "Total Orders"
from gold.fact_sales2;


-- 2. plots - for 5 years
-- yearly sales/revenues

SELECT
    extract(year from order_date) as "Year",
    'EUR ' || to_char(sum(sales), 'FM999,999,999') as "Yearly Revenue",
    to_char(sum(quantity), 'FM999,999,999') as "Total Units Sold",
    to_char(count(order_number), 'FM999,999,999') as "Total Orders"
from gold.fact_sales2
where extract(year from order_date) is not NULL
GROUP BY extract(year from order_date);


-- revenues by category subcategory

SELECT
    p.category,
    p.sub_category,
    'EUR ' || to_char(sum(sales), 'FM999,999,999') as "Yearly Revenue" 
from gold.fact_sales2 s
    join gold.dim_products p on s.product_id=p.product_id
GROUP BY p.category, p.sub_category
ORDER BY p.category, p.sub_category;


SELECT
    p.category,
    'EUR ' || to_char(sum(sales), 'FM999,999,999') as "Yearly Revenue" 
from gold.fact_sales2 s
    join gold.dim_products p on s.product_id=p.product_id
GROUP BY p.category
ORDER BY p.category;


SELECT
    p.sub_category,
    'EUR ' || to_char(sum(sales), 'FM999,999,999') as "Yearly Revenue" 
from gold.fact_sales2 s
    join gold.dim_products p on s.product_id=p.product_id
where s.order_date BETWEEN '2012-01-01' and '2012-12-31'
GROUP BY p.sub_category
ORDER BY p.sub_category;


-- revenues by age group

with X as (
    SELECT
        customer_key,
        birth_date,
        (to_date('2014-01-01', 'yyyy-mm-dd') - birth_date)/365 as age 
    from gold.dim_customers
)
, Y as (
    SELECT
        DISTINCT x.customer_key,
        CASE 
            WHEN x.age>=0 and x.age<=30 THEN  '0-30'
            WHEN x.age>=31 and x.age<=35 THEN  '31-35'
            WHEN x.age>=36 and x.age<=40 THEN  '36-40'
            WHEN x.age>=41 and x.age<=45 THEN  '41-45'
            WHEN x.age>=46 and x.age<=50 THEN  '46-50'
            WHEN x.age>=51 and x.age<=55 THEN  '51-55'
            WHEN x.age>=56 and x.age<=60 THEN  '55-60'
            WHEN x.age>=61 and x.age<=65 THEN  '61-65'
            WHEN x.age>=65 and x.age<=70 THEN  '65-70'
            WHEN x.age>=71 and x.age<=75 THEN  '71-75'
            WHEN x.age>=76 THEN  'Senior Citizens'
            ELSE  'N/A'
        END as age_class
    from X
)
SELECT
    y.age_class,
    to_char(sum(s.quantity), 'FM999,999') as total_units_sold
from Y y
    join gold.fact_sales2 s on s.customer_key=y.customer_key
-- where order_date BETWEEN '2013-01-01' and '2013-12-31'
GROUP BY y.age_class
order BY y.age_class;


-- revenues by country

SELECT
    c.country,
    'EUR ' || to_char(sum(s.sales), 'FM999,999,999') as revenue_by_country,
    to_char(sum(s.quantity), 'FM999,999,999') as units_sold_in_country,
    to_char(count(s.order_number), 'FM999,999,999') as no_of_orders_by_country
from gold.fact_sales2 s
join gold.dim_customers c on c.customer_key=s.customer_key
GROUP BY c.country;
