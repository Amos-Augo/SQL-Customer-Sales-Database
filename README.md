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
