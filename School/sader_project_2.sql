use School ;

-- create table contain all the students who their cumulative level greater than 90 
CREATE TABLE Toppers
Select * from Student
Where Cumulative_level > 90;

-- check the table 
Select * from Toppers;

-- create table contain all students who their cumulative level less than 60
Create TABLE Non_Passer
Select * from Student
Where Cumulative_level <60;
-- check if the table is created 
Show tables from school ;
-- check the records
select * from non_passer;

-- show all student who their name start with A
Select student_name
FROM student
Where Student_name Like 'A%';

-- show all student who their name is four letters
Select student_name
From student
Where student_name Like '____';

-- show the average of cumulative_level 
Select Avg(Cumulative_level) as 'Avgerage Cumulative Score'
From student;
-- show the maximum cumulative level 
Select Max(Cumulative_level) as 'Maximum Cumulative Score'
From student;

-- show the minmum cumulative level
Select Min(Cumulative_level) as 'Minmum Cumulative Score'
From Student;

-- show the students who cumulative score is 100 and Academic level is 6
Select Student_name, cumulative_level,Academic_level
from toppers
where cumulative_level = 100
AND Academic_level =6;

-- show all the student who their age between 15 to 16 and Academic_level =1
Select Student_name,ABS(date_format(sysdate(),'%Y')-date_format(DATE_OF_BIRTH,'%Y')) as 'Age'
from Student
where ABS(date_format(sysdate(),'%Y')-date_format(DATE_OF_BIRTH,'%Y')) between 15 AND 16
AND Academic_level =1;

-- show all students who their academic level is two
Select student_name,Academic_level
from student
where Academic_level=2;

-- show the distinct students study path
select distinct study_path
from student;

-- show the subject name in upper case
Select UPPER(subject_name)
From subjects;

-- show the average of cumulative_level 
Select round(Avg(Cumulative_level)) as 'Avgerage Cumulative Score'
From student;

-- replace f to female in gender
select replace(gender,"F","female") as 'Gender'
from Student;


select rpad(Gender,6,'emale')
from student
where gender='F';


-- replace m to male in gender

select replace(gender,"M","Male") as 'gender'
from student;

select rpad(gender,4,"ale")
from student
where gender='M';

-- update cumulative student score which less than 60 by adding 5 degree
 -- count the students who their cumulative_level less than 60
select count(cumulative_level) from student where cumulative_level <60;
-- update
Update student
set cumulative_level = (cumulative_level+5)
where cumulative_level <60;
-- check
select * from student where cumulative_level <60;


