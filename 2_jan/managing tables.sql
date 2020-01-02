!--question 1
create table dept_tab
(id number(7) primary key,
name varchar(25));
desc dept_tab;

!--question  2
insert into dept_tab
select department_id, department_name from departments;

!-- question 3
create table emp_tab
(id number(7) primary key,
last_name varchar(25),
first_name varchar(25),
department_id number(7));
