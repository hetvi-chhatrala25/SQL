# 🛒 Data Digger — E-Commerce Store SQL Project

## 📌 Project Overview

**Data Digger** is a practical SQL project designed to gain hands-on experience in managing a MySQL database for an E-Commerce Store.

The project focuses on creating and managing relational tables, manipulating data using CRUD operations, applying SQL clauses and operators, performing aggregate calculations, and establishing relationships using primary keys and foreign keys.

## 🎯 Objectives

- Understand database creation and table management.
- Perform CRUD operations: Create, Read, Update, and Delete.
- Work with primary keys and foreign keys.
- Retrieve, filter, sort, and manipulate data using SQL queries.
- Apply aggregate functions such as `SUM()`, `COUNT()`, `MAX()`, `MIN()`, and `AVG()`.
- Use subqueries and joins to retrieve related information.
- Analyze product sales, order details, and customer information.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **Tool:** MySQL Workbench

## 🗂️ Database Structure

The project consists of four relational tables.

### 1. Customers

Stores customer information.

| Column | Data Type | Description |
|---|---|---|
| CustomerID | INT | Primary key |
| Name | VARCHAR(100) | Customer name |
| Email | VARCHAR(100) | Unique email address |
| Address | VARCHAR(255) | Customer address |

### 2. Products

Stores product information.

| Column | Data Type | Description |
|---|---|---|
| ProductID | INT | Primary key |
| ProductName | VARCHAR(100) | Product name |
| Price | DECIMAL(10,2) | Product price |
| Stock | INT | Available stock |

### 3. Orders

Stores customer order information.

| Column | Data Type | Description |
|---|---|---|
| OrderID | INT | Primary key |
| CustomerID | INT | Foreign key referencing Customers |
| OrderDate | DATE | Date of the order |
| TotalAmount | DECIMAL(10,2) | Total order amount |

### 4. OrderDetails

Stores individual product details for each order.

| Column | Data Type | Description |
|---|---|---|
| OrderDetailID | INT | Primary key |
| OrderID | INT | Foreign key referencing Orders |
| ProductID | INT | Foreign key referencing Products |
| Quantity | INT | Quantity ordered |
| SubTotal | DECIMAL(10,2) | Subtotal for the order detail |

## 🔗 Database Relationships

- **Customers → Orders:** One customer can place multiple orders.
- **Orders → OrderDetails:** One order can contain multiple order-detail records.
- **Products → OrderDetails:** One product can appear in multiple order-detail records.

Primary keys uniquely identify records, while foreign keys maintain relationships between tables.

## 📋 Project Requirements and SQL Operations

### 1. Customers Table

- Insert at least five sample customers.
- Retrieve all customer details.
- Update a customer's address.
- Retrieve a customer using `CustomerID`.
- Display customers whose name is `'Alice'`.
- Delete a customer using `CustomerID`.

### 2. Products Table

- Insert at least five sample products.
- Retrieve all products sorted by price in descending order using `ORDER BY`.
- Update the price of a specific product.
- Delete a product if it is out of stock and is not referenced by existing order details.
- Retrieve products priced between ₹500 and ₹2,000 using `BETWEEN`.
- Find the most expensive product using `MAX()`.
- Find the cheapest product using `MIN()`.

### 3. Orders Table

- Insert at least five sample orders.
- Retrieve all orders made by a specific customer.
- Update an order's total amount.
- Delete an order using `OrderID`.
- Retrieve orders placed within the last 30 days.
- Find the highest order amount using `MAX()`.
- Find the lowest order amount using `MIN()`.
- Calculate the average order amount using `AVG()`.

### 4. OrderDetails Table

- Insert at least five sample order-detail records.
- Retrieve all details for a specific order.
- Calculate total revenue using `SUM()`.
- Retrieve the top three most ordered products using `JOIN`, `GROUP BY`, `ORDER BY`, and `LIMIT`.
- Count order-detail records for a specific product using `COUNT()`.
- Calculate the total units sold for a specific product using `SUM(Quantity)`.

## 🧠 SQL Concepts Covered

| Concept | Purpose |
|---|---|
| `CREATE DATABASE` | Creates a database |
| `CREATE TABLE` | Creates database tables |
| `INSERT INTO` | Adds records |
| `SELECT` | Retrieves records |
| `UPDATE` | Modifies existing records |
| `DELETE` | Removes records |
| `WHERE` | Filters records |
| `ORDER BY` | Sorts query results |
| `BETWEEN` | Filters values within a range |
| `MAX()` and `MIN()` | Find maximum and minimum values |
| `SUM()` | Calculates totals |
| `COUNT()` | Counts records |
| `AVG()` | Calculates averages |
| Subqueries | Use the result of one query inside another |
| `JOIN` | Combines related tables |
| `GROUP BY` | Groups records for aggregate calculations |
| `LIMIT` | Restricts the number of returned rows |
| Primary Key | Uniquely identifies each record |
| Foreign Key | Establishes relationships between tables |

## 📊 Sample Data

The project includes:

- **5 customers:** Alice, Rahul, Priya, Amit, and Neha.
- **5 products:** Keyboard, Mouse, Headphones, Monitor, and USB Drive.
- **5 orders:** Sample orders associated with different customers.
- **6 order-detail records:** Product quantities and subtotals associated with orders.

Order dates are generated relative to the current date using MySQL date arithmetic, allowing the last-30-days query to be demonstrated.

## 🚀 How to Run the Project

1. Install and open MySQL Workbench.
2. Connect to your MySQL server.
3. Open a new SQL query tab.
4. Copy the SQL code from the project script.
5. Execute the script from top to bottom.
6. View the query results in the result grid.
7. Use `SHOW TABLES;` and `DESCRIBE table_name;` to verify the database structure.

**Important:** The script begins with `DROP DATABASE IF EXISTS data_digger;`. Running it again deletes and recreates the project database, including its existing data. Use this only when you intend to reset the project.

## 📈 Expected Outcomes

After completing this project, you will be able to:

- Create and manage a relational database.
- Perform essential data manipulation operations.
- Retrieve and analyze customer, product, and order information.
- Calculate revenue and sales quantities.
- Identify the most expensive and cheapest products.
- Find the most frequently ordered products.
- Understand relationships between multiple tables using joins and foreign keys.

## 🏁 Conclusion

The **Data Digger** project demonstrates the practical application of SQL in an E-Commerce Store environment. It combines database design, CRUD operations, filtering, sorting, aggregate functions, subqueries, and joins to manage and analyze structured data.

This project strengthens foundational SQL skills and provides a starting point for more advanced database management and data analysis projects.