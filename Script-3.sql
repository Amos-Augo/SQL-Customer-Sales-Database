create table customer_info(
customer_id int primary key,
full_name varchar(50), 
location varchar(50));

--Table 2

create table products(
product_id int primary key,
product_name varchar,
price float,
customer_id int,
foreign key (customer_id) references customer_info(customer_id)
);

--Table 3
create table sales(
sales_id int primary key,
total_sales float,
product_id int,
customer_id int,
foreign key (product_id) references products(product_id),
foreign key (customer_id) references customer_info(customer_id)
);

--Inserting data into Table 1
insert into customer_info(customer_id, full_name, location)
values
(1, 'James Mwangi', 'Rwanda'),
(2, 'Akello Kel', 'Amboseli'),
(3, 'Judy J', 'Nanyuki')

--select * from customer_info

--Inserting data into Table 2
insert into products (product_id, customer_id, product_name, price)
values
(1, 1, 'Laptop', 20000),
(2, 2, 'Mouse', 1500),
(3, 3, 'Charger', 4000);

--Inserting data into Table 3

insert into sales (sales_id, total_sales, product_id, customer_id)
values
(1, 300000, 1, 1),
(2, 450000, 2, 2),
(3, 100000, 3, 3);

select c.full_name, s.total_sales
from sales as s
join customer_info as c
on s.customer_id = c.customer_id;

select max(total_sales), product_id




--Which customers have made purchases, and what products did they buy?

select ci.customer_id, ci.full_name, p.product_name
from customer_info ci
join  products p
on ci.customer_id = p.customer_id;

--What is the total sales amount per customer?

select ci.full_name, SUM(s.total_sales) as customer_total
from customer_info ci 
join sales  s 
on ci.customer_id = s.customer_id 
group by ci.full_name
order by customer_total desc

--Which product generated the highest total sales?

SELECT p.product_name, s.total_sales
FROM products p
JOIN sales s ON p.product_id = s.product_id
ORDER BY s.total_sales DESC
LIMIT 1;

--Are there any customers who haenv't bought any products?

select ci.full_name, count(p.product_id) as total_products
from customer_info ci 
join products p 
on ci.customer_id = p.customer_id 
group by ci.full_name 
having count(p.product_id) = 0;

---Alt

select ci.full_name
from customer_info ci
left join sales s ON ci.customer_id = s.customer_id
where s.sales_id is null;


--Combining all three tables

select full_name, product_name, total_sales
from customer_info ci
join products p on ci.customer_id = p.customer_id 
join sales s on s.customer_id = ci.customer_id 
order by s.total_sales desc
limit 1;


















