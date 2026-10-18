# University Course Management System

## Project Overview

The University Course Management System is a MySQL database project designed to manage university departments, students, courses, instructors, and student enrollments.

This project demonstrates essential SQL concepts, including database creation, table relationships, CRUD operations, joins, subqueries, aggregate functions, string functions, date functions, window functions, and conditional statements.

## Objectives

- Create and manage a relational database using MySQL.
- Design tables with primary keys and foreign keys.
- Insert, retrieve, update, and delete records.
- Retrieve data from multiple tables using joins.
- Apply aggregate functions and grouping operations.
- Use subqueries to solve database queries.
- Perform string and date manipulations.
- Implement window functions and CASE statements.
- Practice real-world database management operations.

## Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tool:** MySQL Workbench

## Database Name

`university_course_management`

## Database Tables

The project contains five tables.

### 1. Departments

Stores information about university departments.

| Column | Description |
|---|---|
| DepartmentID | Primary key identifying each department |
| DepartmentName | Name of the department |

### 2. Students

Stores student information.

| Column | Description |
|---|---|
| StudentID | Primary key identifying each student |
| FirstName | Student's first name |
| LastName | Student's last name |
| Email | Unique email address |
| BirthDate | Student's date of birth |
| EnrollmentDate | Date the student enrolled in the university |

### 3. Courses

Stores information about university courses.

| Column | Description |
|---|---|
| CourseID | Primary key identifying each course |
| CourseName | Name of the course |
| DepartmentID | Foreign key referencing Departments |
| Credits | Credit value of the course |

### 4. Instructors

Stores information about university instructors.

| Column | Description |
|---|---|
| InstructorID | Primary key identifying each instructor |
| FirstName | Instructor's first name |
| LastName | Instructor's last name |
| Email | Unique email address |
| DepartmentID | Foreign key referencing Departments |
| Salary | Instructor's salary |

### 5. Enrollments

Stores student enrollment records for different courses.

| Column | Description |
|---|---|
| EnrollmentID | Primary key identifying each enrollment |
| StudentID | Foreign key referencing Students |
| CourseID | Foreign key referencing Courses |
| EnrollmentDate | Date of course enrollment |

## Database Relationships

- One department can offer multiple courses.
- One department can have multiple instructors.
- One student can enroll in multiple courses.
- One course can have multiple enrolled students.
- The Enrollments table connects Students and Courses.

## SQL Concepts Implemented

### 1. Database and Table Creation
- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- Primary keys
- Foreign keys
- `NOT NULL`
- `UNIQUE`

### 2. CRUD Operations
- `INSERT` — Create records
- `SELECT` — Read records
- `UPDATE` — Modify records
- `DELETE` — Remove records

### 3. Filtering and Sorting
- `WHERE`
- `BETWEEN`
- `IN`
- `ORDER BY`
- `LIMIT`

### 4. Aggregate Functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`

### 5. Joins
- `INNER JOIN`
- `LEFT JOIN`

### 6. Grouping
- `GROUP BY`
- `HAVING`
- `COUNT(DISTINCT ...)`

### 7. Subqueries
- Nested subqueries
- `IN` operator
- Average-based comparisons
- Filtering using aggregated results

### 8. String Functions
- `CONCAT()`
- `UPPER()`

### 9. Date and Time Functions
- `YEAR()`
- `CURDATE()`
- `DATE_SUB()`
- `TIMESTAMPDIFF()`

### 10. Advanced SQL Concepts
- `CASE` statements
- Window functions
- Running totals
- `ROWS BETWEEN`
- `UNBOUNDED PRECEDING`
- Conditional classification of students

## Key Queries Implemented

The project includes queries to:

1. Find students enrolled after 2022.
2. Retrieve courses offered by the Mathematics department.
3. Count students enrolled in each course.
4. Find students enrolled in both SQL and Data Structures.
5. Find students enrolled in either SQL or Data Structures.
6. Calculate the average credits of courses.
7. Find the maximum salary of Computer Science instructors.
8. Count enrolled students in each department.
9. Display students with their corresponding courses using joins.
10. Find students enrolled in courses with more than 10 students.
11. Extract enrollment years.
12. Display instructor full names.
13. Calculate a running total of enrollments.
14. Classify students as Senior or Junior based on enrollment date.
15. Sort courses by credits.
16. Find courses with credits above the average.
17. Display student names in uppercase.
18. Find students born between 2000 and 2003.
19. Count enrollments by course and rank courses by enrollment count.
20. Find instructors earning above-average salaries.
21. Calculate student ages.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your database server.
3. Create a new SQL query tab.
4. Copy the project SQL code into the query editor.
5. Execute the script.
6. Review the output of the queries in the result grid.
7. Use `SHOW TABLES;` to verify that the tables have been created.

**Important:** The script begins by dropping the existing `university_course_management` database. Running it again will delete the existing database and recreate it, so back up any data you want to keep.

## Sample Data

The database includes sample records for:

- 3 departments
- 6 students
- 5 courses
- 4 instructors
- 13 initial enrollment records

Additional temporary records are inserted to demonstrate CRUD operations.

## Learning Outcomes

After completing this project, the learner will understand how to:

- Build a relational database from scratch.
- Establish relationships between tables.
- Maintain data integrity using keys and constraints.
- Retrieve and analyze information from multiple tables.
- Use aggregate functions, joins, and subqueries.
- Work with dates, strings, and conditional logic.
- Calculate running totals using window functions.
- Write SQL queries for common university management tasks.

## Conclusion

The University Course Management System demonstrates the practical application of MySQL concepts in a university database environment. It combines database design, data manipulation, relational queries, and advanced SQL operations into one project.

This project provides a foundation for developing more advanced database applications and improving SQL problem-solving skills.

## Author

**Name:** Your Name

**Project:** University Course Management System

**Technology:** MySQL