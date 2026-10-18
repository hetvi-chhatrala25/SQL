create database university_course_management;
use university_course_management;

create table Departments (
    DepartmentID int primary key,
    DepartmentName varchar(100) not null
);

create table Students (
    StudentID int primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100) unique,
    BirthDate date,
    EnrollmentDate date
);

create table Courses (
    CourseID int primary key,
    CourseName varchar(100) not null,
    DepartmentID int,
    Credits int,
    foreign key (DepartmentID)
        references Departments(DepartmentID)
);

create table Instructors (
    InstructorID int primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100) unique,
    DepartmentID int,
    Salary decimal(10,2),
    foreign key (DepartmentID)
        references Departments(DepartmentID)
);

create table Enrollments (
    EnrollmentID int primary key,
    StudentID int,
    CourseID int,
    EnrollmentDate date,
    foreign key (StudentID)
        references Students(StudentID),
    foreign key (CourseID)
        references Courses(CourseID)
);

insert into Departments values
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

insert into Students values
(1, 'John', 'Doe', 'john.doe@univ.com', '2000-01-15', '2022-05-01'),
(2, 'Jane', 'Smith', 'jane.smith@univ.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Shah', 'rahul.shah@univ.com', '2002-03-10', '2023-06-15'),
(4, 'Priya', 'Patel', 'priya.patel@univ.com', '2001-07-20', '2024-01-10'),
(5, 'Amit', 'Verma', 'amit.verma@univ.com', '2000-11-12', '2020-07-01'),
(6, 'Sara', 'Khan', 'sara.khan@univ.com', '2003-09-05', '2025-02-01');

insert into Courses values
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Calculus', 2, 4),
(104, 'Linear Algebra', 2, 3),
(105, 'Classical Mechanics', 3, 4);

insert into Instructors values
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 75000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 68000.00),
(3, 'David', 'Brown', 'david.brown@univ.com', 1, 82000.00),
(4, 'Neha', 'Patel', 'neha.patel@univ.com', 3, 70000.00);

insert into Enrollments values
(1, 1, 101, '2022-08-01'),
(2, 2, 101, '2022-08-05'),
(3, 3, 101, '2023-07-01'),
(4, 4, 101, '2024-02-01'),
(5, 5, 101, '2020-08-01'),
(6, 1, 102, '2022-08-02'),
(7, 2, 102, '2022-08-06'),
(8, 3, 102, '2023-07-02'),
(9, 6, 102, '2025-02-05'),
(10, 1, 103, '2023-01-10'),
(11, 4, 103, '2024-02-05'),
(12, 5, 104, '2021-01-15'),
(13, 6, 105, '2025-02-10');

insert into Departments
values (99, 'Temporary Department');

select * from Departments;

update Departments
set DepartmentName = 'Updated Department'
where DepartmentID = 99;

-- delete from Departments where DepartmentID = 99;

insert into Students values
(99, 'Test', 'Student', 'test99@univ.com', '2000-01-01', '2025-01-01');

select * from Students;

update Students
set Email = 'updated99@univ.com'
where StudentID = 99;

-- delete from Students where StudentID = 99;

insert into Courses values
(199, 'Temporary Course', 1, 3);

select * from Courses;

update Courses
set Credits = 4
where CourseID = 199;

-- delete from Courses where CourseID = 199;

insert into Instructors values
(99, 'Test', 'Instructor', 'test99@univ.com', 1, 50000.00);

select * from Instructors;

update Instructors
set Salary = 55000.00
where InstructorID = 99;

-- delete from Instructors where InstructorID = 99;

insert into Enrollments values
(99, 1, 101, '2025-03-01');

select * from Enrollments;

update Enrollments
set EnrollmentDate = '2025-03-15'
where EnrollmentID = 99;

-- delete from Enrollments where EnrollmentID = 99;

select *
from Students
where EnrollmentDate >= '2023-01-01';

select c.CourseID,
       c.CourseName,
       c.Credits
from Courses c
inner join Departments d
    on c.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Mathematics'
limit 5;

select c.CourseID,
       c.CourseName,
       count(distinct e.StudentID) as TotalStudents
from Courses c
inner join Enrollments e
    on c.CourseID = e.CourseID
group by c.CourseID, c.CourseName
having count(distinct e.StudentID) > 3;

select s.StudentID,
       s.FirstName,
       s.LastName
from Students s
inner join Enrollments e
    on s.StudentID = e.StudentID
inner join Courses c
    on e.CourseID = c.CourseID
where c.CourseName in (
    'Introduction to SQL',
    'Data Structures'
)
group by s.StudentID, s.FirstName, s.LastName
having count(distinct c.CourseName) = 2;

select distinct s.StudentID,
       s.FirstName,
       s.LastName
from Students s
inner join Enrollments e
    on s.StudentID = e.StudentID
inner join Courses c
    on e.CourseID = c.CourseID
where c.CourseName in (
    'Introduction to SQL',
    'Data Structures'
);

select avg(Credits) as AverageCredits
from Courses;

select max(i.Salary) as MaximumSalary
from Instructors i
inner join Departments d
    on i.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Computer Science';

select d.DepartmentID,
       d.DepartmentName,
       count(distinct e.StudentID) as TotalStudents
from Departments d
left join Courses c
    on d.DepartmentID = c.DepartmentID
left join Enrollments e
    on c.CourseID = e.CourseID
group by d.DepartmentID, d.DepartmentName;

select s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseName,
       e.EnrollmentDate
from Students s
inner join Enrollments e
    on s.StudentID = e.StudentID
inner join Courses c
    on e.CourseID = c.CourseID;

select s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseName
from Students s
left join Enrollments e
    on s.StudentID = e.StudentID
left join Courses c
    on e.CourseID = c.CourseID;

select distinct s.StudentID,
       s.FirstName,
       s.LastName
from Students s
where s.StudentID in (
    select e.StudentID
    from Enrollments e
    where e.CourseID in (
        select CourseID
        from Enrollments
        group by CourseID
        having count(distinct StudentID) > 10
    )
);

select StudentID,
       FirstName,
       LastName,
       EnrollmentDate,
       year(EnrollmentDate) as EnrollmentYear
from Students;

select InstructorID,
       concat(FirstName, ' ', LastName) as InstructorName,
       Email
from Instructors;

select EnrollmentID,
       StudentID,
       CourseID,
       EnrollmentDate,
       count(*) over (
           order by EnrollmentDate, EnrollmentID
           rows between unbounded preceding and current row
       ) as RunningTotal
from Enrollments;

select StudentID,
       FirstName,
       LastName,
       EnrollmentDate,
       case
           when EnrollmentDate < date_sub(
               curdate(), interval 4 year
           )
           then 'Senior'
           else 'Junior'
       end as StudentStatus
from Students;

select *
from Courses
order by Credits desc;

select count(*) as TotalStudents
from Students;

select CourseName, Credits
from Courses
where Credits > (
    select avg(Credits)
    from Courses
);

select StudentID,
       upper(concat(FirstName, ' ', LastName)) as FullName
from Students;

select *
from Students
where BirthDate between '2000-01-01' and '2003-12-31';

select c.CourseName,
       count(e.EnrollmentID) as TotalEnrollments
from Courses c
left join Enrollments e
    on c.CourseID = e.CourseID
group by c.CourseID, c.CourseName
order by TotalEnrollments desc;

select c.CourseID,
       c.CourseName,
       d.DepartmentName,
       c.Credits
from Courses c
inner join Departments d
    on c.DepartmentID = d.DepartmentID;

select min(Salary) as MinimumSalary
from Instructors;

select InstructorID,
       FirstName,
       LastName,
       Salary
from Instructors
where Salary > (
    select avg(Salary)
    from Instructors
);

select StudentID,
       FirstName,
       LastName,
       timestampdiff(year, BirthDate, curdate()) as Age
from Students;

show tables;

select * from Departments;
select * from Students;
select * from Courses;
select * from Instructors;
select * from Enrollments;