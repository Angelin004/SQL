create database names1;
use kavya;
create table a11(num int);
insert into a11(num)
values
(1),(2),(3),(4);
select * from a11;

create table a22(num int);
insert into a22(num )
values
(1),(2),(3),(5);
select * from a22;

select * from a11 union
select * from a22;

select * from a11 union all
select * from a22;

select * from a11 except
select * from a22;

select * from a22 except
select * from a11;

select * from a11 intersect
select * from a22;


