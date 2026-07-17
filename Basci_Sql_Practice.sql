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
select *from  student where  name ="Jaydeep" ;


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



#8. JOINING =============================================
#INNERJOIN ===============================================
show databases;
use nit;
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Dept_ID INT
);
desc Employees;

CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);
desc Departments;

INSERT INTO Employees VALUES
(101, 'Abhishek', 1),
(102, 'Rahul', 2),
(103, 'Priya', 3),
(104, 'Neha', 2),
(105, 'Amit', 5);
select * from Employees;
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');
select *from Departments;

SELECT *
FROM Employees
INNER JOIN Departments
ON Employees.Emp_ID = Departments.Dept_ID;

select *from Employees left join Departments on Employees.Emp_ID = Departments.Dept_ID;
select *from Employees right join Departments on Employees.Emp_ID = Departments.Dept_ID;
select *from Employees cross join Departments;



#9.START TRANSACTION[ROLLBACK/COMMOT/SAVEPOINT]=============================================
#Always use START query for sql transaction

CREATE TABLE BankAccount (
    Account_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Balance DECIMAL(10,2)
);
desc BackAccount;
INSERT INTO BankAccount VALUES
(101, 'Abhishek', 50000.00),
(102, 'Rahul', 30000.00),
(103, 'Priya', 45000.00),
(104, 'Neha', 60000.00),
(105, 'Amit', 25000.00);
select *from BankAccount;

start transaction;
delete from BankAccount where Account_ID =101;
select *from BankAccount;



#ROLLBACK ===================================================
#Due to some mistake you enter wrong query and delated the records that’s why we will do
#ROLLBACK. If you delated any records from table once use rollback it will give original table.
#ROLLBACK will act link undo (ctrl+z)

rollback;
select *from BankAccount;


#COMMIT ========================================================
# Once user define COMMIT & then ROLLBACK will never work
start transaction;
insert into BankAccount values(106, "Samir" ,40000.00);
delete from BankAccount where Account_ID =106;

commit;

select *from BankAccount;

rollback;
select *from BankAccount;


#ROLLBACK IS NOT WORKING WHY . THAT’S WHY WE NEED TO WRITE 1ST IS start TRANSACTION
#Once user mention START TRANSACTION THEN ROLLBACK WILL WORK
#When user mention ROLLBACK will work.

start transaction;
select *from BankAccount;
insert into BankAccount values(106 ,"Salman", 50000.00);
delete from BankAccount where Account_id =106;

rollback;


#SAVEPOINT ==============================================
start transaction;
select *from BankAccount;

insert into BankAccount Values(106 ,"Salman", 50000.00);
savepoint kamal;

insert into BankAccount Values(107 ,"Sarukh", 50000.00);
savepoint kailash;

delete from BankAccount where Account_id = 107;

select *from BankAccount;

rollback to Kamal;
select *from BankAccount;


start transaction;
drop table Students;


CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);
desc Students;

INSERT INTO Students VALUES
(1,'kamal',8),
(2,'kamal',8),
(3,'kamal',8),
(4,'kamal',8),
(5,'kamal',8),
(6,'karan',1),
(7,'ravi',78),
(8,'kailash',12);
select *from Students;

start transaction;

insert into Students values(9 ,'Ram',45);
savepoint Kamal;

insert into Students values(10,'Ravi',90);
savepoint Kailash;

delete from Students where id =10;

select * from Students;

rollback to Kailash;
rollback to Kamal;
select * from Students;

# when we are rollback to the perticular feild then we are used Savepoint.




#10. DDL Command[CREATE/ALTER/DROP/TRUNCATE/RENAME]==================================================
# DDL (Data Definition Language) commands are used to define or modify the structure of database objects such as tables

drop table abhishek;
CREATE TABLE Abhishek (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);
desc Abhishek;

alter table Abhishek add Address varchar(50);
desc Abhishek;
 
alter table Abhishek drop Marks;
desc Abhishek;

rename table Abhishek to Abhi;
desc Abhi;

truncate table Abhi;
desc Abhi;


#DML (Data Manipulation Language) -[ALTER/SELECT/UPDATE/DELETE]
#DML commands are used to insert, update, delete, and retrieve data from tables.
CREATE TABLE DML (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);
desc DML;

INSERT INTO DML VALUES
(1,'Abhishek',90),
(2,'Rahul',85),
(3,'Priya',95);

select *from DML;
insert into DML values(4, 'Ravi',  99);
select *from DML;

update DML set Marks =92 where ID =2;
select *from DML;

delete from DML where ID =4;
select *from DML;



#DCL (Data Control Language) -[GRANT/REVOKE]
# DCL commands are used to control user permissions and access to the database.


#TCL (Transaction Control Language)-[Start Transaction/SAVEPOINT/ROLLBACK/COMMIT]
#TCL commands are used to manage transactions in a database. 

drop table TCL;
CREATE TABLE TCL(
    Account_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Balance DECIMAL(10,2)
);
desc TCL;


INSERT INTO TCL VALUES
(101,'Abhishek',50000),
(102,'Rahul',30000);

select * from TCL;
start transaction;

select * from TCL;
insert into TCL values (103 , 'Pritom', 40000);
savepoint Ravi;

insert into TCL values(104 ,'Padro',50000);
savepoint Ram;

delete from TCL where Account_ID =104;
select *from TCL;

rollback to Ram;
select * from TCL;



#PRIMARYKEY ==================================================
#Primary keys serve as unique identifiers for each row in a database table. Foreign keys link data in one table to the data in another table.

CREATE TABLE student1 (
    ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    age INT,
    CONSTRAINT pk_student PRIMARY KEY (ID, Name)
);
desc student1;


CREATE TABLE emp (
    ID int,
    Name VARCHAR(50),
    address varchar(30)
);
describe emp;
alter table emp add primary key (id);


# Remove Primarykey
alter table emp drop primary key;
desc emp;


# FOREIGN KEY ========================================
# we define for communication bitween two table.
start transaction;
drop table person;
create table person1(
personID int not null primary key,
name varchar(30),
age int
);
desc person1;


drop table personorder;
create table personorder(
orderid int not null primary key,
ordenumber int not null,
personID int ,foreign key(personID) references person1(personID)
);

desc personorder;
alter table personorder add primary key (ordernumber);

