# SQL Pratcice part

show databases;
use nit;
create table student(
id int not null primary key,
NAME varchar(60),
ADDRESS varchar(50),
MARKS int);
 
 
 # 1.SELECT ===============================================
desc student;
insert into student(id,NAME,ADDRESS,MARKS) values(01,"Abhishek","Kamalasing",100);
select * from student;
insert into student values(02,"Kirtiman","Berhampur",99),(03,"Jaydeep","Maharastra",97),(04,"Ram","Bihar",95);
select * from student;

insert into student values(05,"lakshman","Jaypur",94);

select name,id from student;
select name,id,marks from student;
select name,marks from student;



#2.WHERE =====================================================
select *from student;
select *from student where id =01;
select *from student where id =02;
select *from student where id =03;
select *from student where id =04;
select *from  student where  name ="Abhishek";
select *from  student where  name ="Jaydeep" ;
select *from  student where  name ="Kirtiman";
select *from  student where  name ="Ram";


#3.ALTER [add/modify/drop/rename] ========================================================
select *from student;
ALTER TABLE student RENAME COLUMN id TO ID;
alter table student add GRADE varchar(40);
rename table student to std;

desc std;
show tables;
rename table std to student;
alter table student drop column GRADE;
desc student;


#4.UPDATE=====================================================
select *from student;
update student set MARKS =80 where ID =1;
update student set MARKS =75 where ID =2;
update student set name ="Ram" where ID =01;
update studenT set MARKS =95 where ID =01;
update student set ADDRESS ="Puri" where ID=1;
update student set MARKS = 68 where ID=3;
update student set MARKS =74 where ID =4;
update student set MARKS =69 where ID=5;


#5.DELETE ========================================
select * from student;
delete from student where id =5;
delete from student where id =4;


#6.FUNCTION ==========================================
 select sum(MARKS) from student;
 select avg(MARKS) from student;
 select count(MARKS) from student;
 select MAX(MARKS) from student;
 select MIN(MARKS) from student;
 select sum(ID) from student;
 select avg(ID) from student;
 
 
#7.WILD CHARACTER========================================
#Student name which start with a then you need to use wild card character
#Pull out the records of student name which start with a (‘a%’) & names which end with y then(’%y)
#Pull out
#name which start with a (‘a%’) 
#name which ends with a (‘%a’) 

-- Create the table
CREATE TABLE employee (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    employee VARCHAR(100),
    GRADE VARCHAR(40)
);
desc employee;

-- Insert the dataset
INSERT INTO employee (employee, GRADE) VALUES
('John Doe', 'A+'),
('Anna Smith', 'B'),
('James Miller', 'A'),
('Samantha Carter', 'B+'),
('Robert Wilson', 'C'),
('George Johnson', 'A-'),
('Taylor Taylor', 'B');

select *from employee;

select *from employee where employee like 'A%';
select *from employee where employee like 'R%';
select *from employee where employee like '%e';
select *from employee where employee like '%r';

#Pull out the records where second last alphabet is ‘s’ then use below query
select *from employee;
select *from employee where employee like '_a%';
select *from employee where employee like '_o%';
select *from employee where employee like '%e_';
select *from employee where employee like '%i_';



#INNERJOIN ===============================================












