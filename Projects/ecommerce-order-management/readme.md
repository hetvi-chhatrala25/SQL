# E-Commerce Order Management System

## Project Overview

The **E-Commerce Order Management System** is a MySQL-based database project designed to manage products, categories, customers, orders, payments, and shipping details.

The project demonstrates SQL concepts such as CRUD operations, filtering, sorting, aggregation, joins, subqueries, date and string functions, window functions, and CASE expressions.

## Objectives

- Manage products and product categories.
- Store customer information and retrieve order history.
- Create and track customer orders.
- Manage payment and shipping information.
- Update product stock when an order is placed.
- Delete orders that were cancelled more than 30 days ago.
- Analyze sales, revenue, product popularity, and customer spending.

## Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **IDE:** MySQL Workbench
- **Version Control:** Git and GitHub

## Database Name

```sql
ecommerce_management
```

## Database Schema

The database contains seven tables connected through primary keys and foreign keys.

### 1. Categories

Stores product category information.

| Column | Description |
|---|---|
| `category_id` | Primary key; automatically generated |
| `category_name` | Unique category name |

### 2. Products

Stores product details and available stock.

| Column | Description |
|---|---|
| `product_id` | Primary key; automatically generated |
| `name` | Product name |
| `category_id` | Foreign key referencing Categories |
| `price` | Product price |
| `stock_quantity` | Available stock |
| `added_date` | Date the product was added |

### 3. Customers

Stores customer information.

| Column | Description |
|---|---|
| `customer_id` | Primary key; automatically generated |
| `name` | Customer name |
| `email` | Customer email; unique when provided |
| `phone_number` | Customer contact number |
| `address` | Customer address |
| `registration_date` | Customer registration date |

### 4. Orders

Stores customer orders and their current status.

| Column | Description |
|---|---|
| `order_id` | Primary key; automatically generated |
| `customer_id` | Foreign key referencing Customers |
| `order_date` | Date and time of the order |
| `total_amount` | Total order value |
| `status` | Pending, Shipped, Delivered, or Cancelled |
| `cancelled_at` | Date and time the order was cancelled |

### 5. Order Items

Stores the products included in each order.

| Column | Description |
|---|---|
| `order_item_id` | Primary key; automatically generated |
| `order_id` | Foreign key referencing Orders |
| `product_id` | Foreign key referencing Products |
| `quantity` | Quantity ordered |
| `subtotal` | Total price for the item quantity |

### 6. Payments

Stores payment details for orders.

| Column | Description |
|---|---|
| `payment_id` | Primary key; automatically generated |
| `order_id` | Foreign key referencing Orders |
| `payment_date` | Date and time of payment |
| `payment_method` | Credit Card, PayPal, or UPI |
| `payment_status` | Paid, Pending, or Failed |

### 7. Shipping

Stores shipping and delivery information.

| Column | Description |
|---|---|
| `shipping_id` | Primary key; automatically generated |
| `order_id` | Foreign key referencing Orders; unique |
| `shipping_date` | Date the order was shipped |
| `delivery_date` | Date the order was delivered |
| `shipping_status` | Dispatched, In Transit, or Delivered |

## Entity Relationships

- One category can contain multiple products.
- One customer can place multiple orders.
- One order can contain multiple order items.
- One product can appear in multiple order items.
- One order can have associated payment records.
- One order can have at most one shipping record.

Foreign keys maintain referential integrity between related tables.

## Project Functionalities

### 1. CRUD Operations

- Insert new products, customers, and orders.
- Retrieve product, customer, and order details.
- Update product prices and customer addresses.
- Delete products that are not referenced by order items.

### 2. Order Management and Stock Control

- Place orders for customers.
- Check product stock before an order is placed.
- Automatically reduce stock after a successful order.
- Use transactions to prevent incomplete order operations.
- Track order statuses and cancellation dates.
- Delete cancelled orders older than 30 days along with their dependent records.

### 3. SQL Clauses and Operators

The project uses:

- `WHERE` to filter records.
- `HAVING` to filter grouped results.
- `LIMIT` to restrict query results.
- `ORDER BY` to sort data.
- `GROUP BY` to summarize data.
- `AND`, `OR`, and `NOT` to combine conditions.

### 4. Aggregate Functions

- `SUM()` calculates total revenue and spending.
- `AVG()` calculates average order value.
- `MAX()` identifies the highest order value.
- `MIN()` identifies the lowest order value.
- `COUNT()` counts orders, products, and payments.

### 5. Joins

The project demonstrates:

- `INNER JOIN` to retrieve products with category names.
- `LEFT JOIN` to retrieve customers and their orders.
- `RIGHT JOIN` to identify orders without shipping records.
- `FULL OUTER JOIN` functionality using `LEFT JOIN`, `RIGHT JOIN`, and `UNION` in MySQL.

### 6. Subqueries

- Find orders placed by recently registered customers.
- Identify the customer with the highest spending.
- Find products that have never been ordered.
- Compare product prices with the average product price.

### 7. Date and String Functions

Date functions:

- `DATE_FORMAT()`
- `DATEDIFF()`
- `YEAR()`
- `CURRENT_DATE`
- `DATE_SUB()`

String functions:

- `UPPER()`
- `LOWER()`
- `TRIM()`
- `CHAR_LENGTH()`
- `COALESCE()`
- `NULLIF()`

### 8. Window Functions

- `RANK()` ranks customers based on total spending.
- `DENSE_RANK()` ranks products based on units sold.
- `SUM() OVER()` calculates cumulative monthly revenue.
- `COUNT() OVER()` calculates the running order count.

### 9. CASE Expressions

Customer loyalty categories:

- **Gold:** Spending above ₹50,000.
- **Silver:** Spending from ₹20,000 to ₹50,000.
- **Bronze:** Spending below ₹20,000.

Product categories:

- **Best Seller:** More than 500 units sold.
- **Popular:** Between 200 and 500 units sold.
- **Regular:** Fewer than 200 units sold.

Order descriptions are also generated based on order status.

## Repository Structure

```text
ecommerce-order-management/
│
├── ecommerce_management.sql
└── README.md
```

## Installation and Execution

### Step 1: Clone the Repository

```bash
git clone <your-github-repository-url>
```

Replace the placeholder with your public GitHub repository URL.

### Step 2: Open MySQL Workbench

Open MySQL Workbench and connect to your MySQL server.

### Step 3: Open the SQL Script

Open `ecommerce_management.sql` in MySQL Workbench.

### Step 4: Execute the Script

Run the SQL script to create the database, tables, relationships, sample data, and queries.

**Important:** The script starts by dropping and recreating `ecommerce_management`. Back up any existing data in that database before running it.

## Sample Data

The project includes sample records for:

- Five product categories.
- Ten initial products and an additional USB Cable product.
- Six customers.
- Ten initial orders.
- Order items, payments, and shipping records.

## Expected Outcomes

After executing the project, users can:

- View and filter products.
- Retrieve customers and their order history.
- Analyze order and payment statuses.
- Calculate revenue and average order values.
- Identify popular products and customer spending rankings.
- Track shipping and delivery durations.
- Demonstrate automated stock updates during order placement.

## Learning Outcomes

This project provides practical experience with:

- Relational database design.
- Primary and foreign key constraints.
- MySQL CRUD operations.
- Joins and subqueries.
- Aggregate and window functions.
- Date and string manipulation.
- Transactions and stored procedures.
- Sales data analysis.

## Conclusion

The E-Commerce Order Management System demonstrates how MySQL can be used to organize e-commerce data, maintain relationships between business entities, manage order workflows, and analyze sales information using SQL.

## Author

**Hetvi Chhatrala**

A SQL learning project focused on relational database management and data analysis.
