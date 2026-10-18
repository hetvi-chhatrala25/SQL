# Data Digger — MySQL Project

## 📌 Project Overview

Data Digger is a SQL project designed to practice database creation, data manipulation, joins, subqueries, date functions, string functions, window functions, and conditional statements using MySQL.

The project uses three tables: `Customers`, `Orders`, and `Employees`.

## 🎯 Objectives

- Create and manage a relational database.
- Retrieve data using different types of joins.
- Apply subqueries to filter records.
- Work with date and string functions.
- Calculate running totals and rank orders.
- Use `CASE` statements for discounts and salary categorization.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tool:** MySQL Workbench

## 📂 Database Structure

Database name: `data_digger`

### 1. Customers Table

| Column | Data Type | Description |
|---|---|---|
| CustomerID | INT | Primary key |
| CustomerName | VARCHAR(100) | Customer's name |
| Email | VARCHAR(100) | Customer's email |
| RegistrationDate | DATE | Registration date |

### 2. Orders Table

| Column | Data Type | Description |
|---|---|---|
| OrderID | INT | Primary key |
| CustomerID | INT | Foreign key referencing Customers |
| OrderDate | DATE | Date of the order |
| TotalAmount | DECIMAL(10,2) | Total order amount |

### 3. Employees Table

| Column | Data Type | Description |
|---|---|---|
| EmployeeID | INT | Primary key |
| FirstName | VARCHAR(50) | Employee's first name |
| LastName | VARCHAR(50) | Employee's last name |
| Department | VARCHAR(50) | Department name |
| HireDate | DATE | Employee's joining date |
| Salary | DECIMAL(10,2) | Employee's salary |

## 📊 Sample Data

The project includes sample records for:

- 4 customers
- 4 orders
- 4 employees

The sample data supports practicing joins, subqueries, aggregate calculations, and conditional queries.

## 📚 SQL Concepts Covered

### 1. Joins

- **INNER JOIN:** Retrieves customers who have matching orders.
- **LEFT JOIN:** Retrieves all customers and their corresponding orders, if available.
- **RIGHT JOIN:** Retrieves all orders and their corresponding customers.
- **FULL OUTER JOIN:** Simulated using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`, because MySQL does not directly support `FULL OUTER JOIN`.

### 2. Subqueries

- Find customers whose individual orders exceed the average order amount.
- Find employees earning more than the average salary.

### 3. Date Functions

- `YEAR()` — Extracts the year from an order date.
- `MONTH()` — Extracts the month from an order date.
- `CURDATE()` — Returns the current date.
- `DATEDIFF()` — Calculates the difference between two dates.
- `DATE_FORMAT()` — Formats dates into a readable format.

### 4. String Functions

- `CONCAT()` — Combines first and last names.
- `REPLACE()` — Replaces part of a string.
- `UPPER()` — Converts text to uppercase.
- `LOWER()` — Converts text to lowercase.
- `TRIM()` — Removes leading and trailing spaces.

### 5. Window Functions

- `SUM() OVER()` — Calculates the running total of order amounts.
- `RANK() OVER()` — Ranks orders by total amount.

### 6. Conditional Statements

- `CASE` — Assigns discount percentages based on order amounts.
- `CASE` — Categorizes employee salaries as High, Medium, or Low.

## 📝 Queries Performed

1. Retrieve orders with customer details using INNER JOIN.
2. Retrieve all customers and their orders using LEFT JOIN.
3. Retrieve orders and customer details using RIGHT JOIN.
4. Retrieve all customers and orders using a FULL OUTER JOIN alternative.
5. Find customers with orders above the average order amount.
6. Find employees with above-average salaries.
7. Extract the year and month from order dates.
8. Calculate the number of days between order dates and the current date.
9. Format order dates as `DD-MMM-YYYY`.
10. Concatenate employee first and last names.
11. Replace `John` with `Jonathan` in customer names.
12. Convert first names to uppercase and last names to lowercase.
13. Remove leading and trailing spaces from email addresses.
14. Calculate the running total of order amounts.
15. Rank orders using the `RANK()` function.
16. Calculate discounts based on order amounts.
17. Categorize employee salaries using `CASE`.

## 💰 Discount Rules

| Order Amount | Discount |
|---|---:|
| Greater than 1000 | 10% |
| Greater than 500 and up to 1000 | 5% |
| 500 or below | 0% |

The project calculates the final order amount after applying the applicable discount.

## 👨‍💼 Salary Categories

| Salary | Category |
|---|---|
| Greater than 60000 | High |
| 40000 to 60000 | Medium |
| Below 40000 | Low |

These salary thresholds are examples used for practicing conditional logic.

## ▶️ How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your database server.
3. Create a new SQL script.
4. Copy the SQL queries into the script.
5. Execute the complete script in sequence.
6. Review the result grids produced by each query.

**Note:** The script begins by dropping the existing `data_digger` database. Running it again will delete the previous version of this database and recreate it with the sample data.

## 📌 Key Learnings

Through this project, I practiced relational database design, SQL joins, nested queries, date and string manipulation, window functions, and conditional logic. This project helped strengthen my understanding of MySQL through practical examples.

## 👩‍💻 Author

Created as a hands-on MySQL learning project.
