!-- practice questions

select e.last_name , l.city ,1 as  dummy 
from employees e , locations l ,departments d
where e.department_id = d.department_id  and d.location_id= l.location_id and l.city='Oxford'
UNION
select e.last_name , l.city, 2 as dummy 
from employees e , locations l ,departments d
where e.department_id = d.department_id  and d.location_id= l.location_id and l.city='Toronto'
UNION 
select e.last_name , l.city ,3 as dummy 
from employees e , locations l ,departments d
where e.department_id = d.department_id  and d.location_id= l.location_id and l.city='London'
order by 3 ;

!--Set Operations Assignment
!--QUESTION 1

select department_id  from departments
minus
select department_id from employees where job_id ='ST_CLERK';

!--QUESTION 2

select country_id , country_name from countries 
where country_id in (select country_id  from countries
minus
select l.country_id from locations l, departments d 
where l.location_id = d.department_id  and department_id is not null);

!--QUESTION 3

select job_id , department_id , 1 as dummy 
from employees where department_id=10
union
select job_id , department_id , 2 as dummy 
from employees where department_id=50
union 
select job_id , department_id , 3 as dummy 
from employees where department_id=20
order by 3;


!--Question 4

select employee_id, job_id from employees 
intersect
select employee_id , job_id from job_history;

!--Question 5

select last_name , department_id , to_char(NULL)
from employees
union
select to_char(null), department_id, department_name 
from departments;