drop database if exists data_digger;
create database data_digger;
use data_digger;

create table Customers (
    CustomerID int primary key,
    CustomerName varchar(100),
    Email varchar(100),
    RegistrationDate date
);

create table Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate date,
    TotalAmount decimal(10,2),
    foreign key (CustomerID) references Customers(CustomerID)
);

create table Employees (
    EmployeeID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Department varchar(50),
    HireDate date,
    Salary decimal(10,2)
);

insert into Customers
(CustomerID, CustomerName, Email, RegistrationDate)
values
(1, 'John Smith', 'john@email.com', '2022-03-15'),
(2, 'Nith Patel', 'nith@email.com', '2021-11-02'),
(3, 'Alice Brown', 'alice@email.com', '2023-01-10'),
(4, 'David Wilson', 'david@email.com', '2022-08-20');

insert into Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
values
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-05', 750.00),
(104, 3, '2023-08-10', 1200.00);

insert into Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
values
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 45000),
(2, 'Susan', 'Lee', 'HR', '2021-06-20', 55000),
(3, 'John', 'Smith', 'IT', '2019-03-10', 75000),
(4, 'Alice', 'Brown', 'Finance', '2022-09-05', 35000);

select
    o.OrderID,
    c.CustomerID,
    c.CustomerName,
    c.Email,
    o.OrderDate,
    o.TotalAmount
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID;

select
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID;

select
    o.OrderID,
    o.CustomerID,
    c.CustomerName,
    o.OrderDate,
    o.TotalAmount
from Customers c
right join Orders o
on c.CustomerID = o.CustomerID;

select
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID

union

select
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
from Customers c
right join Orders o
on c.CustomerID = o.CustomerID;

select distinct
    c.CustomerID,
    c.CustomerName
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
where o.TotalAmount > (
    select avg(TotalAmount)
    from Orders
);

select
    EmployeeID,
    FirstName,
    LastName,
    Salary
from Employees
where Salary > (
    select avg(Salary)
    from Employees
);

select
    OrderID,
    OrderDate,
    year(OrderDate) as OrderYear,
    month(OrderDate) as OrderMonth
from Orders;

select
    OrderID,
    OrderDate,
    curdate() as CurrentDate,
    datediff(curdate(), OrderDate) as DaysDifference
from Orders;

select
    OrderID,
    OrderDate,
    date_format(OrderDate, '%d-%b-%Y') as FormattedDate
from Orders;

select
    EmployeeID,
    concat(FirstName, ' ', LastName) as FullName
from Employees;

select
    CustomerID,
    CustomerName,
    replace(CustomerName, 'John', 'Jonathan') as UpdatedName
from Customers;

select
    EmployeeID,
    upper(FirstName) as UpperFirstName,
    lower(LastName) as LowerLastName
from Employees;

select
    CustomerID,
    trim(Email) as TrimmedEmail
from Customers;

select
    OrderID,
    OrderDate,
    TotalAmount,
    sum(TotalAmount) over (
        order by OrderDate, OrderID
        rows between unbounded preceding and current row
    ) as RunningTotal
from Orders;

select
    OrderID,
    TotalAmount,
    rank() over (
        order by TotalAmount desc
    ) as OrderRank
from Orders;

select
    OrderID,
    TotalAmount,
    case
        when TotalAmount > 1000 then 10
        when TotalAmount > 500 then 5
        else 0
    end as DiscountPercentage,
    round(
        TotalAmount * (
            1 - case
                when TotalAmount > 1000 then 0.10
                when TotalAmount > 500 then 0.05
                else 0
            end
        ), 2
    ) as FinalAmount
from Orders;

select
    EmployeeID,
    concat(FirstName, ' ', LastName) as FullName,
    Salary,
    case
        when Salary > 60000 then 'High'
        when Salary >= 40000 then 'Medium'
        else 'Low'
    end as SalaryCategory
from Employees;
