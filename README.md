# SQL-Customer-Sales-Database
This script demonstrates SQL operations such as sorting with ORDER BY and filtering grouped results using GROUP BY and HAVING. It uses sample product and customer data to show how to count related records and display only those meeting specific conditions (e.g., customers owning more than two products).

---
# Customer Sales Database Project

## Overview
This project contains an SQL script for creating and managing a simple customer sales database.  
The database consists of **three tables**:  
- `customer_info` – Stores customer details  
- `products` – Stores product details linked to customers  
- `sales` – Stores sales data linked to both customers and products  

The project also includes sample data insertion and several useful queries for reporting and analysis.

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

## Sample Data
The script includes example data for customers, products, and sales to help you test queries.

---

## Example Queries
The SQL script provides answers to common business questions such as:

1. **Which customers have made purchases and what products did they buy?**  
2. **What is the total sales amount per customer?**  
3. **Which product generated the highest total sales?**  
4. **Are there any customers who haven't bought any products?**  
5. **Combining all three tables to see customer, product, and sales details.**

---
## Solutions
-- Step 1: Create a sample customers table
-- This table stores basic customer details.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Step 2: Create a sample products table
-- This table stores product ownership, linked to customers by customer_id.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Step 3: Insert sample data into customers
INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

-- Step 4: Insert sample data into products
INSERT INTO products VALUES
(1, 'Laptop', 1),
(2, 'Phone', 1),
(3, 'Tablet', 1),
(4, 'Laptop', 2),
(5, 'Headphones', 2),
(6, 'Laptop', 3);

-- Step 5: Query to count how many products each customer owns
-- GROUP BY groups rows by customer_name.
-- COUNT(*) counts the number of products each customer has.
SELECT 
    c.customer_name,
    COUNT(p.product_id) AS product_count
FROM customers c
JOIN products p ON c.customer_id = p.customer_id
GROUP BY c.customer_name;

-- Output after Step 5:
-- Shows total products owned by each customer:
-- Alice    | 3
-- Bob      | 2
-- Charlie  | 1

-- Step 6: Apply HAVING to filter only customers with more than 2 products
SELECT 
    c.customer_name,
    COUNT(p.product_id) AS product_count
FROM customers c
JOIN products p ON c.customer_id = p.customer_id
GROUP BY c.customer_name
HAVING COUNT(p.product_id) > 2;

-- Output after Step 6:
-- Shows only customers with more than 2 products:
-- Alice    | 3

-- Step 7: Order results alphabetically by customer_name
SELECT 
    c.customer_name,
    COUNT(p.product_id) AS product_count
FROM customers c
JOIN products p ON c.customer_id = p.customer_id
GROUP BY c.customer_name
HAVING COUNT(p.product_id) > 2
ORDER BY c.customer_name ASC;

-- Output after Step 7:
-- Since only Alice qualifies, result is same but sorted order is maintained.

-- Step 8: Paginate results using OFFSET and FETCH NEXT
-- OFFSET skips a number of rows, FETCH NEXT limits the number of rows displayed.
SELECT 
    c.customer_name,
    COUNT(p.product_id) AS product_count
FROM customers c
JOIN products p ON c.customer_id = p.customer_id
GROUP BY c.customer_name
HAVING COUNT(p.product_id) > 0
ORDER BY c.customer_name ASC
OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY;

-- Output after Step 8:
-- Shows only the first 2 rows in alphabetical order:
-- Alice    | 3
-- Bob      | 2

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
