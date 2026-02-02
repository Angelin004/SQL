create database college2;
use college2;
create table srm_course1(C_id int primary key,C_name varchar(20));
insert into srm_course1(c_id,c_name)
values
(101,'ECE'),
(102,'Mech'),
(103,'CSE');
select *from srm_course1;
create table  student_demo1(roll_number int,
name varchar(20)not null,
ph_number varchar(20),email varchar(40)not null,
course varchar(30),clg_course_id int,
constraint errorT primary key(roll_number),
constraint errorL unique (email),
constraint errorM check(length(ph_number)=10),
constraint errorE foreign key(clg_course_id),
references srm_course(c_id));

select * from student_demo

insert into employee_1(emp_id,emp_name,Mail_id,Phone_number,dep_name)
values(1,'Divya','divya@gmail.com','9888707814','HR');

insert into employee_1(emp_id,emp_name,Mail_id,Phone_number,dep_name)
values(2,'Edwin','edwin@gmail.com','9998705214','IT');
  
