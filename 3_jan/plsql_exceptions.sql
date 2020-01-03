Set serverout on;
Set Verify off;

-- Named System defined exceptions

DECLARE 
       vname employees.last_name%TYPE;
       vsal employees.salary%TYPE;
BEGIN
        SELECT last_name, salary
        INTO vname, vsal
        FROM employees
        WHERE employee_id in(&empid);
        DBMS_OUTPUT.PUT_LINE(vname|| ' ' ||vsal);
        
EXCEPTION
         WHEN NO_DATA_FOUND   THEN
                DBMS_OUTPUT.PUT_LINE('No Emps');
         WHEN TOO_MANY_ROWS   THEN     
                DBMS_OUTPUT.PUT_LINE('More than one Emp');
END;
/
              
              
-- un Named System defined exceptions

DECLARE
       emp_exist EXCEPTION;
       PRAGMA EXCEPTION_INIT(emp_exist,-2292);
begin 
       delete from departments
       where department_id=&deptid;
exception
       when emp_exist then
       DBMS_OUTPUT.PUT_LINE('Cannot remove dept since emps exist');
end;
/
       
-- named user defined exceptions
 -- Age must be between 21-60 , else name exception
 
 declare 
          v_age number := &age;
          invalid_age EXCEPTION;
 begin 
         if v_age not between 21 and 60 then 
            RAISE invalid_age;
         else
            DBMS_OUTPUT.PUT_LINE('Congats you are eligible');
         end if;   
 exception
         when invalid_age then
            DBMS_OUTPUT.PUT_LINE('Age must be between 21-60');
 end;
 /
 
 -- unnamed user defined exceptions
 declare 
          v_age number := &age;
 begin         
         if v_age not between 21 and 60 then 
            RAISE_APPLICATION_ERROR(-20111,'Age must be between 21 to 60');
          else  
          DBMS_OUTPUT.PUT_LINE('Congats you are eligible');
          end if;
 end;         
          
          