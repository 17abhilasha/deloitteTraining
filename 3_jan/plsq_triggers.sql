-- TRIGGERS



 
 drop trigger emp_trig2;
 -- 
 
 create or replace trigger t1
 before insert or update or delete on emp
 begin 
       if to_char(sysdate,'hh24')not between 9 and 18
       and to_char(sysdate , 'dy') in ('sat','sun') then
         raise_application_error(-20323,'Do not work on weekends or shift hours');
         
         end if ;
      end;
      /
      desc emp;
  
  update emp
  set salary = salary+2
  where employee_id=101;
  
--example

create table ex_emp
as 
select employee_id, last_name, job_id, phone_number
from emp
where 1=2;

desc ex_emp;
drop trigger t1;
drop trigger trig_bkp;
create or replace trigger trig_bkp
before delete on emp
for each row
begin
     insert into ex_emp
     values(:old.employee_id, :old.last_name,:old.job_id,:old.phone_number);
end; 
/

delete from emp where employee_id in (102,105);
select * from ex_emp;
rollback;