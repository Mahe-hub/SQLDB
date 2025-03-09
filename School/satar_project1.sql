-- Create the dataBase
CREATE DATABASE SCHOOL;

-- Use the database
USE SCHOOL;

-- Create student table 
CREATE TABLE Student(
Id INT PRIMARY KEY,
Student_name VARCHAR(225),
Date_of_birth Date,
Gender Char(1),
Date_of_joining Date,
Email Varchar(225),
Academic_level INT,
Study_path varchar(225),
Cumulative_level INT
);

-- Create teacher table 
Create table Teacher(
Id INT PRIMARY KEY,
Teacher_name Varchar(225),
Date_of_birth Date,
Gender Char(1),
Email Varchar(225),
Office_number INT
);


-- Create Subjects table
Create table Subjects(
Id INT PRIMARY KEY,
Subject_name Varchar(225)
);


-- show all tables in School DB
Show tables from School ;

-- insert 30 students into student table 

Insert into student
values (1,'Hazzem','2000-01-01','M','2025-01-01','Hazzem@test.com',1,'Scientific',70),
       (2,'Ali','2000-02-01','M','2025-02-01','Ali@test.com',1,'Scientific',70),
       (3,'Hamzza','2001-03-25','M','2024-01-02','Hamzza@test.com',2,'Literary',60),
       (4,'Sara','2002-03-21','F','2024-02-01','Sara@test.com',2,'Literary',66),
       (5,'Jessy','2004-02-25','F','2025-03-01','Jessy@test.com',3,'Scientific',68),
       (6,'Marah','2004-02-24','F','2025-04-01','Marah@test.com',1,'Scientific',70),
       (7,'Salam','2003-06-09','F','2024-06-01','Rola@test.com',2,'Scientific',90),
       (8,'Sawsan','2003-05-24','F','2024-07-01','Sawsan@test.com',4,'Literary',95),
       (9,'Rami','2002-06-23','M','2023-08-01','Rami@test.com',5,'Literary',90),
       (10,'Motaz','2004-06-21','M','2023-09-01','Motaz@test.com',2,'Scientific',98),
       (11,'Majed','2004-06-21','M','2022-10-01','Majed@test.com',4,'Scientific',88),
       (12,'Zaher','2002-02-25','M','2022-11-01','Zaher@test.com',5,'Scientific',87),
       (13,'Fahed','2002-02-23','M','2021-12-01','Fahad@test.com',6,'Scientific',89),
       (14,'Amer','2002-02-23','M','2020-01-01','Amer@test.com',1,'Literary',90),
       (15,'Jad','2005-09-03','M','2020-02-03','Jad@test.com',2,'Literary',77),
       (16,'Ahmad','2005-09-03','M','2020-03-04','Jad@test.com',3,'Literary',75),
       (17,'Ameen','2006-10-04','M','2020-05-06','Ameen@test.com',4,'Scientific',89),
       (18,'Tarek','2004-12-31','M','2020-05-10','Tarek@test.com',5,'Scientific',88),
       (19,'Fadi','2005-11-25','M','2020-06-10','Fadi@test.com',6,'Scientific',89),
       (20,'Aziz','2003-10-24','M','2020-06-20','Aziz@test.com',1,'Literary',87),
       (21,'Suzazn','2002-09-11','F','2020-07-10','Suzazn@test.com',2,'Literary',67),
       (22,'Huda','2003-08-12','F','2020-08-10','Huda@test.com',4,'Literary',50),
       (23,'Nadia','2001-07-03','F','2021-09-10','Nadia@test.com',3,'Scientific',49),
       (24,'Salma','2000-06-15','F','2021-11-12','Salma@test.com',5,'Scientific',49),
       (25,'Reem','2001-05-25','F','2021-12-01','Reem@test.com',6,'Scientific',46),
       (26,'Nuhad','2002-06-22','F','2022-02-15','Nuhad@test.com',1,'Literary',49),
       (27,'Nancy','2001-04-23','F','2022-04-05','Nancy@test.com',2,'Literary',52),
       (28,'Bashar','2002-03-03','M','2022-05-15','Bashar@test.com',4,'Literary',53),
       (29,'Fouad','2001-06-09','M','2022-06-20','Fouad@test.com',3,'Scientific',42),
       (30,'Ziad','2002-08-25','M','2023-07-13','Ziad@test.com',5,'Scientific',41);
       


-- insert teacher into teachers table 
use school;
insert into teacher values
(1,'Ahmad','1980-12-01','M','Ahmad@test.com',1),
(2,'Muhmad','1980-01-30','M','Muhmad@test.com',1),
(3,'Jehad','1974-02-02','M','Jehad@test.com',2),
(4,'Ziad','1974-02-02','M','Ziad@test.com',2),
(5,'Fouad','1982-05-25','M','Fouad@test.com',3),
(6,'Samer','1979-06-03','M','Samer@test.com',3),
(7,'Tarek','1985-07-12','M','Tarek@test.com',4),
(8,'Ray','1986-08-12','M','Raymon@test.com',5),
(9,'Rasha','1990-09-12','F','Rasha@test.com',6),
(10,'Nagam','1991-11-11','F','Nagam@test.com',6)
;

-- insert subjects into subject table
insert into subjects values
(1,'Math'),
(2,'History'),
(3,'Chemistry'),
(4,'Science'),
(5,'Sport'),
(6,'Giography');

-- show all data into 3 tables 

Select * from student;
Select * from teacher;
Select * from subjects;

-- show student table data and order asc by student name 
Select * from student
order by student_name ;

-- show student table data and rename the student_name file to another name 
select id,student_name as first_name,date_of_birth,gender,date_of_joining,email,academic_level,study_path,cumulative_level
from student;
-- update one of the student's email
update student 
set email='Ali_a@test.com'
where id=2;

-- check the update 
select id,email
from student
where id=2;

-- update one of teacher's office
update teacher
set office_number=5
where id=1;
-- check the update
select id,office_number
from teacher
where id=1;

-- rename teacher table to teachers
alter table teacher
rename to teachers;
-- check the rename 
show tables from school;

/*----------------------------------------------------*/
select student_name,cumulative_level
from student 
where cumulative_level <60;