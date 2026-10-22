drop database if exists ecommerce_management;
create database ecommerce_management;
use ecommerce_management;

create table categories (
    category_id int primary key auto_increment,
    category_name varchar(100) not null unique
);

create table products (
    product_id int primary key auto_increment,
    name varchar(150) not null,
    category_id int,
    price decimal(10,2) not null,
    stock_quantity int not null default 0,
    added_date date default (current_date),
    foreign key (category_id) references categories(category_id),
    check (price >= 0),
    check (stock_quantity >= 0)
);

create table customers (
    customer_id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(150) unique,
    phone_number varchar(20),
    address varchar(255),
    registration_date date default (current_date)
);

create table orders (
    order_id int primary key auto_increment,
    customer_id int not null,
    order_date datetime default current_timestamp,
    total_amount decimal(12,2) not null default 0,
    status enum('Pending', 'Shipped', 'Delivered', 'Cancelled')
        default 'Pending',
    foreign key (customer_id) references customers(customer_id),
    check (total_amount >= 0)
);

create table order_items (
    order_item_id int primary key auto_increment,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    subtotal decimal(12,2) not null,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id),
    check (quantity > 0),
    check (subtotal >= 0)
);

create table payments (
    payment_id int primary key auto_increment,
    order_id int not null,
    payment_date datetime default current_timestamp,
    payment_method enum('Credit Card', 'PayPal', 'UPI') not null,
    payment_status enum('Paid', 'Pending', 'Failed') default 'Pending',
    foreign key (order_id) references orders(order_id)
);

create table shipping (
    shipping_id int primary key auto_increment,
    order_id int not null unique,
    shipping_date date,
    delivery_date date,
    shipping_status enum('Dispatched', 'In Transit', 'Delivered')
        default 'Dispatched',
    foreign key (order_id) references orders(order_id)
);

insert into categories (category_name) values
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Accessories');

insert into products
(name, category_id, price, stock_quantity, added_date)
values
('Laptop', 1, 65000, 20, '2026-01-10'),
('Smartphone', 1, 30000, 35, '2026-02-15'),
('Headphones', 1, 2500, 100, '2026-03-01'),
('T-Shirt', 2, 800, 150, '2026-03-10'),
('Jeans', 2, 1800, 80, '2026-04-01'),
('SQL Book', 3, 650, 200, '2026-04-15'),
('Mixer Grinder', 4, 3500, 40, '2026-05-01'),
('Smart Watch', 5, 4500, 60, '2026-05-10'),
('Keyboard', 1, 1200, 75, '2026-06-01'),
('Mouse', 1, 700, 0, '2026-06-15');

insert into customers
(name, email, phone_number, address, registration_date)
values
('Ishaan Sharma', 'ishaan@email.com', '9876500007', 'Mumbai', '2023-04-12'),
('Sanya Iyer', 'sanya@email.com', '9876500008', 'Chennai', '2021-11-05'),
('Arjun Nair', 'arjun@email.com', '9876500009', 'Bengaluru', '2024-07-19'),
('Kavya Reddy', 'kavya@email.com', '9876500010', 'Hyderabad', '2022-09-01'),
('Aditya Verma', null, '9876500011', 'Delhi', '2025-01-15'),
('Riya Banerjee', 'riya@email.com', '9876500012', 'Kolkata', '2025-05-22');

insert into orders
(customer_id, order_date, total_amount, status)
values
(1, '2026-05-01 10:30:00', 67500, 'Delivered'),
(2, '2026-05-12 14:00:00', 33000, 'Delivered'),
(1, '2026-06-05 11:15:00', 4300, 'Shipped'),
(3, '2026-06-20 16:45:00', 1800, 'Pending'),
(4, '2026-07-02 12:00:00', 650, 'Delivered'),
(2, '2026-07-15 09:30:00', 4500, 'Shipped'),
(3, '2026-08-10 18:00:00', 30000, 'Delivered'),
(1, '2026-09-01 13:30:00', 2500, 'Pending'),
(5, '2026-09-15 15:00:00', 800, 'Cancelled'),
(4, '2026-10-01 10:00:00', 65000, 'Delivered');

insert into order_items
(order_id, product_id, quantity, subtotal)
values
(1, 1, 1, 65000),
(1, 3, 1, 2500),
(2, 2, 1, 30000),
(2, 9, 1, 1200),
(2, 6, 2, 1300),
(3, 8, 1, 4500),
(4, 5, 1, 1800),
(5, 6, 1, 650),
(6, 8, 1, 4500),
(7, 2, 1, 30000),
(8, 3, 1, 2500),
(9, 4, 1, 800),
(10, 1, 1, 65000);

insert into payments (order_id, payment_method, payment_status)
values
(1, 'Credit Card', 'Paid'),
(2, 'UPI', 'Paid'),
(3, 'UPI', 'Paid'),
(4, 'PayPal', 'Pending'),
(5, 'UPI', 'Paid'),
(6, 'Credit Card', 'Paid'),
(7, 'UPI', 'Paid'),
(8, 'PayPal', 'Paid'),
(9, 'UPI', 'Failed'),
(10, 'Credit Card', 'Paid');

insert into shipping
(order_id, shipping_date, delivery_date, shipping_status)
values
(1, '2026-05-02', '2026-05-05', 'Delivered'),
(2, '2026-05-13', '2026-05-16', 'Delivered'),
(3, '2026-06-06', null, 'In Transit'),
(5, '2026-07-03', '2026-07-06', 'Delivered'),
(6, '2026-07-16', null, 'In Transit'),
(7, '2026-08-11', '2026-08-14', 'Delivered'),
(10, '2026-10-02', '2026-10-05', 'Delivered');

insert into products (name, category_id, price, stock_quantity)
values ('USB Cable', 1, 350, 100);

select * from products;

select *
from products
where name like '%Laptop%';

update products
set price = 62000
where product_id = 1;

update customers
set address = 'Mumbai'
where customer_id = 1;

delete from products
where product_id = 11
and not exists (
    select 1
    from order_items
    where order_items.product_id = products.product_id
);

select *
from orders
where order_date >= current_date - interval 6 month;

select *
from products
order by price desc
limit 5;

select c.customer_id, c.name, count(o.order_id) as total_orders
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
having count(o.order_id) > 3;

select *
from products
where price > 1000;

select c.category_name, sum(oi.subtotal) as category_revenue
from categories c
join products p on c.category_id = p.category_id
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.status <> 'Cancelled'
group by c.category_id, c.category_name
having sum(oi.subtotal) > 10000
order by category_revenue desc;

select o.*
from orders o
join payments p on o.order_id = p.order_id
where o.status = 'Pending'
and p.payment_status = 'Paid';

select *
from products
where stock_quantity > 0;

select c.customer_id, c.name, c.registration_date
from customers c
where c.registration_date >= '2023-01-01'
or exists (
    select 1
    from orders o
    where o.customer_id = c.customer_id
    and o.status <> 'Cancelled'
    group by o.customer_id
    having sum(o.total_amount) > 10000
);

select *
from products
order by price desc;

select c.customer_id, c.name, count(o.order_id) as total_orders
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
order by total_orders desc;

select c.category_name, sum(oi.subtotal) as total_revenue
from categories c
join products p on c.category_id = p.category_id
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.status <> 'Cancelled'
group by c.category_id, c.category_name;

select sum(total_amount) as total_revenue
from orders
where status <> 'Cancelled';

select avg(total_amount) as average_order_value,
       max(total_amount) as highest_order_value,
       min(total_amount) as lowest_order_value,
       count(*) as total_orders
from orders
where status <> 'Cancelled';

select p.product_id, p.name, sum(oi.quantity) as units_sold
from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.status <> 'Cancelled'
group by p.product_id, p.name
order by units_sold desc
limit 1;

select p.product_id, p.name, c.category_name, p.price
from products p
inner join categories c on p.category_id = c.category_id;

select c.customer_id, c.name, o.order_id, o.total_amount
from customers c
left join orders o on c.customer_id = o.customer_id
order by c.customer_id;

select o.order_id, o.status, s.shipping_id, s.shipping_status
from shipping s
right join orders o on s.order_id = o.order_id
where s.shipping_id is null;

select c.customer_id, c.name, o.order_id, o.total_amount
from customers c
left join orders o on c.customer_id = o.customer_id
union
select c.customer_id, c.name, o.order_id, o.total_amount
from customers c
right join orders o on c.customer_id = o.customer_id;

select c.*
from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

select o.order_id, c.name, c.email,
       o.order_date, o.total_amount, o.status
from orders o
inner join customers c on o.customer_id = c.customer_id;

select o.order_id, o.status,
       p.payment_method, p.payment_status,
       s.shipping_status, s.delivery_date
from orders o
left join payments p on o.order_id = p.order_id
left join shipping s on o.order_id = s.order_id;

select *
from orders
where customer_id in (
    select customer_id
    from customers
    where registration_date >= '2023-01-01'
);

select c.customer_id, c.name,
       sum(o.total_amount) as total_spending
from customers c
join orders o on c.customer_id = o.customer_id
where o.status <> 'Cancelled'
group by c.customer_id, c.name
having sum(o.total_amount) >= all (
    select spending
    from (
        select sum(total_amount) as spending
        from orders
        where status <> 'Cancelled'
        group by customer_id
    ) as customer_spending
);

select p.*
from products p
where not exists (
    select 1
    from order_items oi
    where oi.product_id = p.product_id
);

select *
from products
where price > (select avg(price) from products);

select date_format(order_date, '%Y-%m') as order_month,
       count(*) as total_orders
from orders
group by date_format(order_date, '%Y-%m')
order by order_month;

select order_id, shipping_date, delivery_date,
       datediff(delivery_date, shipping_date) as delivery_days
from shipping
where shipping_date is not null
and delivery_date is not null;

select order_id,
       date_format(order_date, '%d-%m-%Y') as formatted_order_date
from orders;

select *
from orders
where date(order_date) = current_date;

select *
from orders
where year(order_date) = year(current_date);

select product_id, upper(name) as product_name
from products;

select customer_id, trim(name) as customer_name
from customers;

select customer_id, name,
       coalesce(nullif(trim(email), ''), 'Not Provided') as email
from customers;

select *
from products
where lower(name) like '%phone%';

select upper(trim(name)) as customer_name
from customers;

select name, char_length(name) as name_length
from products;

with customer_spending as (
    select c.customer_id, c.name,
           coalesce(sum(
               case
                   when o.status <> 'Cancelled' then o.total_amount
                   else 0
               end
           ), 0) as total_spending
    from customers c
    left join orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.name
)
select customer_id, name, total_spending,
       rank() over (order by total_spending desc) as spending_rank
from customer_spending;

with monthly_revenue as (
    select date_format(order_date, '%Y-%m') as order_month,
           sum(total_amount) as monthly_revenue
    from orders
    where status <> 'Cancelled'
    group by date_format(order_date, '%Y-%m')
)
select order_month, monthly_revenue,
       sum(monthly_revenue) over (
           order by order_month
           rows between unbounded preceding and current row
       ) as cumulative_revenue
from monthly_revenue
order by order_month;

select order_id, order_date, customer_id,
       count(*) over (
           order by order_date, order_id
           rows between unbounded preceding and current row
       ) as running_order_count
from orders
order by order_date, order_id;

select p.product_id, p.name,
       sum(oi.quantity) as units_sold,
       dense_rank() over (order by sum(oi.quantity) desc) as product_rank
from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.status <> 'Cancelled'
group by p.product_id, p.name;

with customer_spending as (
    select c.customer_id, c.name,
           coalesce(sum(
               case
                   when o.status <> 'Cancelled' then o.total_amount
                   else 0
               end
           ), 0) as total_spending
    from customers c
    left join orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.name
)
select customer_id, name, total_spending,
       case
           when total_spending > 50000 then 'Gold'
           when total_spending >= 20000 then 'Silver'
           else 'Bronze'
       end as loyalty_status
from customer_spending
order by total_spending desc;

select p.product_id, p.name,
       coalesce(sum(
           case
               when o.status <> 'Cancelled' then oi.quantity
               else 0
           end
       ), 0) as units_sold,
       case
           when coalesce(sum(
               case
                   when o.status <> 'Cancelled' then oi.quantity
                   else 0
               end
           ), 0) > 500 then 'Best Seller'
           when coalesce(sum(
               case
                   when o.status <> 'Cancelled' then oi.quantity
                   else 0
               end
           ), 0) >= 200 then 'Popular'
           else 'Regular'
       end as product_category
from products p
left join order_items oi on p.product_id = oi.product_id
left join orders o on oi.order_id = o.order_id
group by p.product_id, p.name
order by units_sold desc;

select order_id, total_amount, status,
       case
           when status = 'Cancelled' then 'Order Cancelled'
           when status = 'Delivered' then 'Order Completed'
           when status = 'Shipped' then 'In Delivery'
           else 'Awaiting Processing'
       end as order_description
from orders;

select o.order_id, c.name, p.payment_method, p.payment_status
from payments p
join orders o on p.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where p.payment_status in ('Pending', 'Failed');

select o.order_id, c.name, o.status, s.shipping_status
from orders o
join customers c on o.customer_id = c.customer_id
left join shipping s on o.order_id = s.order_id
where o.status <> 'Cancelled'
and (s.shipping_id is null or s.shipping_status <> 'Delivered');

update payments
set payment_status = 'Paid'
where payment_id = 4;

update shipping
set shipping_status = 'Delivered',
    delivery_date = current_date
where shipping_id = 3;

update orders
set status = 'Delivered'
where order_id = 3;

select p.payment_method,
       count(*) as payment_count,
       sum(o.total_amount) as order_value
from payments p
join orders o on p.order_id = o.order_id
where p.payment_status = 'Paid'
and o.status <> 'Cancelled'
group by p.payment_method
order by order_value desc;

select c.category_name, sum(oi.quantity) as total_units_sold
from categories c
join products p on c.category_id = p.category_id
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.status <> 'Cancelled'
group by c.category_id, c.category_name
order by total_units_sold desc;

select product_id, name, stock_quantity
from products
where stock_quantity < 10
order by stock_quantity asc;

select c.customer_id, c.name,
       count(o.order_id) as total_orders,
       coalesce(sum(
           case
               when o.status <> 'Cancelled' then o.total_amount
               else 0
           end
       ), 0) as total_spending,
       max(o.order_date) as latest_order_date
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
order by total_spending desc;

select o.order_id, o.total_amount,
       coalesce(sum(oi.subtotal), 0) as calculated_total
from orders o
left join order_items oi on o.order_id = oi.order_id
group by o.order_id, o.total_amount
order by o.order_id;

show tables;