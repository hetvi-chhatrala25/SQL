drop database if exists data_digger;
create database data_digger;
use data_digger;

create table Customers (
    CustomerID int primary key,
    Name varchar(100) not null,
    Email varchar(100) unique,
    Address varchar(255)
);

create table Products (
    ProductID int primary key,
    ProductName varchar(100) not null,
    Price decimal(10,2) not null,
    Stock int not null
);

create table Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate date,
    TotalAmount decimal(10,2),
    foreign key (CustomerID) references Customers(CustomerID)
);

create table OrderDetails (
    OrderDetailID int primary key,
    OrderID int,
    ProductID int,
    Quantity int,
    SubTotal decimal(10,2),
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Products(ProductID)
);

insert into Customers (CustomerID, Name, Email, Address)
values
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'Rahul', 'rahul@gmail.com', 'Rajkot'),
(3, 'Priya', 'priya@gmail.com', 'Surat'),
(4, 'Amit', 'amit@gmail.com', 'Vadodara'),
(5, 'Neha', 'neha@gmail.com', 'Jamnagar');

insert into Products (ProductID, ProductName, Price, Stock)
values
(101, 'Keyboard', 750.00, 20),
(102, 'Mouse', 500.00, 0),
(103, 'Headphones', 1500.00, 15),
(104, 'Monitor', 8500.00, 10),
(105, 'USB Drive', 800.00, 30);

insert into Orders (OrderID, CustomerID, OrderDate, TotalAmount)
values
(201, 1, curdate() - interval 2 day, 1500.00),
(202, 2, curdate() - interval 5 day, 1500.00),
(203, 3, curdate() - interval 10 day, 2400.00),
(204, 1, curdate() - interval 40 day, 8500.00),
(205, 4, curdate() - interval 1 day, 2250.00);

insert into OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal)
values
(1, 201, 101, 2, 1500.00),
(2, 202, 103, 1, 1500.00),
(3, 203, 105, 3, 2400.00),
(4, 204, 104, 1, 8500.00),
(5, 205, 101, 1, 750.00),
(6, 205, 103, 1, 1500.00);

select * from Customers;

update Customers
set Address = 'Mumbai'
where CustomerID = 1;

select * from Customers
where Name = 'Alice';

select * from Customers
where CustomerID = 1;

select * from Products;

select * from Products
order by Price desc;

update Products
set Price = 900.00
where ProductID = 101;

select * from Products
where Price between 500 and 2000;

select max(Price) as MostExpensivePrice
from Products;

select min(Price) as CheapestPrice
from Products;

select *
from Products
where Price = (
    select max(Price)
    from Products
);

select *
from Products
where Price = (
    select min(Price)
    from Products
);

select * from Orders;

select * from Orders
where CustomerID = 1;

update Orders
set TotalAmount = 1800.00
where OrderID = 201;

select * from Orders
where OrderDate >= curdate() - interval 30 day
and OrderDate <= curdate();

select max(TotalAmount) as HighestOrderAmount
from Orders;

select min(TotalAmount) as LowestOrderAmount
from Orders;

select avg(TotalAmount) as AverageOrderAmount
from Orders;

select * from OrderDetails;

select * from OrderDetails
where OrderID = 201;

select sum(SubTotal) as TotalRevenue
from OrderDetails;

select
    p.ProductID,
    p.ProductName,
    sum(od.Quantity) as TotalQuantityOrdered
from OrderDetails od
join Products p
    on od.ProductID = p.ProductID
group by p.ProductID, p.ProductName
order by TotalQuantityOrdered desc
limit 3;

select count(*) as TimesSold
from OrderDetails
where ProductID = 101;

select sum(Quantity) as TotalUnitsSold
from OrderDetails
where ProductID = 101;

select
    c.CustomerID,
    c.Name,
    o.OrderID,
    o.OrderDate,
    p.ProductName,
    od.Quantity,
    p.Price,
    od.SubTotal
from Customers c
join Orders o
    on c.CustomerID = o.CustomerID
join OrderDetails od
    on o.OrderID = od.OrderID
join Products p
    on od.ProductID = p.ProductID
order by o.OrderID;

delete from OrderDetails
where OrderID = 202;

delete from Orders
where OrderID = 202;

delete from Products
where Stock = 0
and not exists (
    select 1
    from OrderDetails
    where OrderDetails.ProductID = Products.ProductID
);

delete from OrderDetails
where OrderID in (
    select OrderID
    from Orders
    where CustomerID = 1
);

delete from Orders
where CustomerID = 1;

delete from Customers
where CustomerID = 1;

select * from Customers;
select * from Products;
select * from Orders;
select * from OrderDetails;

show tables;

describe Customers;
describe Products;
describe Orders;
describe OrderDetails;