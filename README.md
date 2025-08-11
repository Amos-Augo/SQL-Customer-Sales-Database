# SQL Customer Sales Database Project
This script demonstrates SQL operations such as sorting with ORDER BY and filtering grouped results using GROUP BY and HAVING. It uses sample product and customer data to show how to count related records and display only those meeting specific conditions (e.g., customers owning more than two products).

---

## Overview
The database consists of **three tables**:  
- `customer_info` – Stores customer details  
- `products` – Stores product details linked to customers  
- `sales` – Stores sales data linked to both customers and products  

The project also includes sample data insertion and several useful queries for reporting and analysis.

---
## 1. Create Tables
Create the products table:
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);
```
Create the customers table:

```sql
CREATE TABLE customer_info (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    location VARCHAR(50)
);
```
Create the sales table:
```sql
CREATE TABLE sales(
   sales_id INT PRIMARY KEY,
   total_sales FLOAT,
   product_id INT,
   customer_id INT,
   FOREIGN KEY (product_id) REFERENCES products(product_id),
   FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);
```
---
## 2. Insert Data
Insert products:
```sql
INSERT INTO products (product_id, product_name, price, customer_id) VALUES
(101, 'Laptop', 1200.00, 1),
(102, 'Phone', 800.00, 1),
(103, 'Tablet', 600.00, 2),
(104, 'Monitor', 300.00, 2),
(105, 'Keyboard', 50.00, 2),
(106, 'Mouse', 30.00, 3),
(107, 'Headphones', 150.00, 3),
(108, 'Webcam', 100.00, 3),
(109, 'Printer', 200.00, 4),
(110, 'Desk Lamp', 40.00, 4);
```
Insert customers:
```sql
INSERT INTO customer_info (customer_id, customer_name, location)
VALUES
(1, 'Alex Morgan', 'Evergreen'),
(2, 'Taylor Brooks', 'Lakeside'),
(3, 'Jordan Lee', 'Mapleton'),
(4, 'Casey Bennett', 'Oakridge');

```
Insert sales:
```sql
INSERT INTO sales (sales_id, total_sales, product_id, customer_id) VALUES
(1, 1200.00, 101, 1),  
(2, 800.00, 102, 1),  
(3, 600.00, 103, 2),   
(4, 300.00, 104, 2),   
(5, 50.00, 105, 2),   
(6, 30.00, 106, 3),    
(7, 150.00, 107, 3),  
(8, 100.00, 108, 3),   
(9, 200.00, 109, 4),   
(10, 40.00, 110, 4); 
```

---
## Queries Overview
The queries in this script:
1. **Retrieve sales details with sorting by total sales**  
2. **List products with customer locations**  
3. **Display sales with price information**  
4. **Count the number of products owned by each customer**  

For each query, comments explain what happens and the nature of the output.

---

## SQL Queries

1. Show `sales_id`, `product_name`, and `customer_name` for every sale, ordered by `total_sales` in descending order.
   Output: Each row represents a sale, showing the product sold, the customer who bought it, and the sale amount ranking from highest to lowest.

```sql
SELECT s.sales_id, p.product_name, c.customer_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.total_sales DESC;
```
Output:

sales_id | product_name | customer_name
---------+--------------+---------------
3        | Laptop       | John Doe
1        | Phone        | John Doe
5        | Tablet       | Jane Smith
4        | Monitor      | Jane Smith
2        | Keyboard     | Jane Smith
7        | Mouse        | Michael Brown
8        | Headphones   | Michael Brown
6        | Webcam       | Michael Brown
9        | Printer      | Emily Davis
10       | Desk Lamp    | Emily Davis

2. List all products along with their customer's location, sorted by `location` then `product_name`.
   Output: Each row shows a product and the buyer's location, grouped by location and then alphabetically by product.

```sql
SELECT p.product_name, c.location
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY c.location, p.product_name;
```
3. Display all sales with `product_name`, `price`, and `full_name`, ordered by `price` from highest to lowest.
   Output: Shows each product sold, its price, and the buyer's name, sorted to highlight the most expensive sales first.

```sql
SELECT p.product_name, s.price, c.full_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.price DESC;
```
4. Count how many products each customer owns, and only show customers with more than 2 products.
   Output: Shows the customer name and how many unique products they have purchased, filtering to show only customers with 3 or more products.

```sql
SELECT c.full_name, COUNT(DISTINCT p.product_id) AS product_count
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.full_name
HAVING COUNT(DISTINCT p.product_id) > 2;
```
---

## How to Use
1. Open your SQL environment (MySQL, PostgreSQL, etc.).
2. Copy and paste the SQL script into your query editor.
3. Run the script to create tables and insert sample data.
4. Execute the queries to view results.

---

## Technologies Used
- **SQL** (Structured Query Language)
- Works with any SQL database (MySQL, PostgreSQL, SQLite, etc.)

---

## License
This project is open-source and available under the MIT License.
