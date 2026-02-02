create table studentK(id int,student_name varchar(10));
insert into studentK(id,student_name)
values (1,'	Kaniya'),
(2,'Indhu'),
(3,'Mercy');
select * from studentK;

create table courseA(id int,course varchar(10));
insert into courseA(id,course)
values (1,'java'),
(2,'python'),
(4,'C');
select * from courseA;

select * from studentK s,courseA c
where K.id=A.id;

select K.student_name,A.course from studentA K
left join courseA A
on K.id=A.id;

select K.student_name,A.course 
from studentA s,courseA c
on K.id=A.id(+);


select K.student_name,A.course from studentA K
right join courseA c
on s.id=c.id;

select s.student_name,c.course from studentK s
full outer join courseB c
on s.id=c.id;

select * from studentK s
cross join courseA c;


create table employee_manager1
(emp_id int, 
first_name varchar(30),
email_id varchar(50),
manager_id int
);

insert into employee_manager1(emp_id, 
first_name ,
email_id ,
manager_id) 
values
(1,'Nandhu','nandhu@123',1),
(1,'Lipika','lipi@123',1),
(1,'Priya','priya@123',1);

select * from employee_manager1;

select e.emp_id,e.first_name,
m.emp_id as manager_id,m.first_name as manager_name 
from employee_manager1 e, employee_manager1 m
where e.manager_id=m.emp_id;