desc emp;
create or replace trigger sal_update
before update on emp
for each row
begin
if 
:new.salary<:old.salary
then 
raise_application_error(-20123,'New salary cannot be less than old salary');
rollback;
end if;
end;
/

update emp
set salary= salary+100
where employee_id=101;

select salary from employees where employee_id=101;


!-- function

create or replace function take_home
(f1_emp employees.employee_id%type)
return number
is 
thesal number;
begin select employees.salary+ nvl(employees.commission_pct,0) into thesal from employees where employees.employee_id=f1_emp;
return thesal;
end;

var thsall number;
exec :thsall:=take_home(105);
print thsall;
