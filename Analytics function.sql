create database angel1;
use angel1;
create table dept_case_decode(dept_id int,dept_name varchar(20),salary int);
insert into dept_case_decode(dept_id,dept_name,salary)
values 
(20,'it',40000),
(10,'hr',30000),
(20,'it',21000),
(40,'hr',30000),
(50,'it',21000),
(50,'it',21000),
(60,'accounts',23111),
(100,'hr',50000);

select * from dept_case_decode;

select salary, rank() over(order by salary) from dept_case_decode;
select salary,dense_rank() over (order by salary desc) from dept_case_decode;
select dept_name,lead(dept_name) over (order by dept_name) from dept_case_decode;
select dept_name,lag(dept_name) over (order by dept_name) from dept_case_decode;
select dept_id,row_number ()over(order by dept_id) from dept_case_decode;
