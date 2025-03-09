use school;
-- Create table Teacher-student
Create table Teacher_Students
(
 Teacher_id INT ,
 Student_id INT,
 foreign key(Teacher_id)references teachers(Id),
 foreign key(Student_id)references student(Id)
);
/* Realtionship is 
  Teacher teach more than one student
  student teach by more than one teacher
  */
insert into Teacher_Students values
(1,1),
(1,2),
(1,3),
(1,1),
(2,1),
(3,1);

select * from Teacher_Students;

/* Create table teacher_Subjectts
   where the realtionship is 
   teacher tech one subject
   subject teach by more than one teacher */
   
   Create table Teacher_Student(
    Teacher_id INT,
    Subject_id INT,
    Foreign key(Teacher_id)references Teachers(Id),
    Foreign key(Subject_id)references subjects(Id)
    );
    
    insert into Teacher_Student values
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (2,2),
    (2,3);
    
    Select * from Teacher_Student;
    
    /*Create table student_subject
     student study more than one subject 
     subject study by more than one student*/
     
     Create table student_subject(
      Student_id INT,
      Subject_id INT,
      foreign key(Student_id)references student(Id),
      foreign key(Subject_id)references subjects(Id)
     );
     
     insert into  student_subject values
     (1,1),
     (1,2),
     (2,1),
     (2,2);
     
     /* create procdure show name the students and name of subject 
        they study */
     DELIMITER //   
	 Create procedure student_info ()
     Begin
     Select student_name,subject_name
     from student inner join student_subject
     on student.Id = student_subject.Student_id
     inner join subjects
     on student_subject.Subject_id = subjects.Id;
     End;
     
	-- call the procedure
    call student_info;
    
    /* create view contain name of teacher,number of office
      and name of subject it teach */
      
	
    Create view teacher_info
    AS
    select Teacher_name,office_number,subject_name
    from teachers inner join teacher_student
    on teachers.Id = teacher_student.Teacher_id
    inner join subjects
    on teacher_student.Subject_id = Subjects.Id;
    
    -- call the view
    SELECT * FROM  teacher_info;
    -- Drop the view
    Drop view teacher_info;
	
    /* create index on students table on student name to make searching
      operation more faster*/
      
	Create index student_name_idx on
    student(Student_name);
    
    -- show the index
    show indexes from student;
    
    -- drop the index
    drop index student_name_idx on student ;
