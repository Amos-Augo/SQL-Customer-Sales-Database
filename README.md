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

```sql
-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    customer_id INT
);

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

--Create the sales table
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
## Database Schema

### 1. `customer_info`
| Column       | Data Type      | Description                   |
|--------------|---------------|-------------------------------|
| customer_id  | INT (PK)      | Unique ID for each customer   |
| full_name    | VARCHAR(50)   | Customer's full name          |
| location     | VARCHAR(50)   | Customer's location           |

### 2. `products`
| Column       | Data Type      | Description                              |
|--------------|---------------|------------------------------------------|
| product_id   | INT (PK)      | Unique ID for each product               |
| product_name | VARCHAR       | Name of the product                      |
| price        | FLOAT         | Price of the product                     |
| customer_id  | INT (FK)      | Links to `customer_info.customer_id`     |

### 3. `sales`
| Column       | Data Type      | Description                              |
|--------------|---------------|------------------------------------------|
| sales_id     | INT (PK)      | Unique ID for each sale                  |
| total_sales  | FLOAT         | Total sale amount                        |
| product_id   | INT (FK)      | Links to `products.product_id`           |
| customer_id  | INT (FK)      | Links to `customer_info.customer_id`     |

---
## Script Overview
The queries in this script:
1. **Retrieve sales details with sorting by total sales**  
2. **List products with customer locations**  
3. **Display sales with price information**  
4. **Count the number of products owned by each customer**  

For each query, comments explain what happens and the nature of the output.

---

## SQL Script

```sql
-- 1. Show sales_id, product_name, and full_name for every sale, 
--    ordered by total_sales in descending order.
--    Output: Each row represents a sale, showing the product sold,
--    the customer who bought it, and the sale amount ranking from highest to lowest.
SELECT s.sales_id, p.product_name, c.full_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.total_sales DESC;

-- 2. List all products along with their customer's location,
--    sorted by location then product name.
--    Output: Each row shows a product and the buyer's location,
--    grouped by location and then alphabetically by product.
SELECT p.product_name, c.location
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY c.location, p.product_name;

-- 3. Display all sales with product_name, price, and full_name,
--    ordered by price from highest to lowest.
--    Output: Shows each product sold, its price, and the buyer's name,
--    sorted to highlight the most expensive sales first.
SELECT p.product_name, s.price, c.full_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.price DESC;

-- 4. Count how many products each customer owns,
--    and only show customers with more than 2 products.
--    Output: Shows the customer name and how many unique products
--    they have purchased, filtering to show only customers with 3 or more products.
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
