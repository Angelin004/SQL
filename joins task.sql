create database angel;
use angel;
create table empolyee1(dep_id int,dep_name varchar(10));
insert into empolyee1(dep_id,dep_name)
values(1,'assembling'),
(2,'testing'),
(3,'sales');
select *from empolyee1;

create table course3(dep_id int,course varchar(10));
insert into course3(dep_id,course)
values(1,'java'),
(2,'python'),
(3,'sql');
select * from course3;

select d.dep_name,c.course
from empolyee1 d left join course3 c 
on d.dep_id=c.dep_id;