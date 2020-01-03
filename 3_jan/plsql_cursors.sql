Set serverout on;

Set Verify off;



-- fetching multiple rows using cursors


begin  
     
 delete from departments where department_id=240;

      DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows deleted');

end;

/


-- cursors with basic loop 

declare

       cursor c1

       is select last_name, job_id, salary

       from employees
 
      where salary between 5000 and 15000;

       
       erec c1%ROWTYPE;

Begin

      open c1;

      loop

             fetch c1 into erec ;

             exit when c1%notfound;
  
             DBMS_OUTPUT.PUT_LINE(erec.last_name|| '  ' ||erec.job_id|| '  '|| erec.salary);

      end loop;

      close c1;

end;

/


-- cursors with for loop 

declare

       cursor c1

       is select last_name, job_id, salary

       from employees

       where salary between 1000 and 15000;

Begin

      for erec in c1

      loop

             DBMS_OUTPUT.PUT_LINE(erec.last_name|| '  ' ||erec.job_id|| '  '|| erec.salary);

      end loop;

end;


/


--table



create table emp as select * from employees;



-- expilicit row locking


declare

       cursor c1

       is select last_name, job_id, salary

       from emp

       where salary between 1000 and 15000

       for update wait 4;

Begin

      for erec in c1

      loop

             DBMS_OUTPUT.PUT_LINE(erec.last_name|| '  ' ||erec.job_id|| '  '|| erec.salary);
    
             
             delete from emp where last_name ='Higgins';

             end loop;

end;       
