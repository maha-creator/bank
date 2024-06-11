-----------------SPACK---------------------------
--CREATE OR REPLACE PACKAGE personnel AS
--  -- get employee's fullname
--  FUNCTION get_ENAME(P_ENAME VARCHAR)
--    RETURN VARCHAR;
--  -- get employee's salary
--  FUNCTION get_JOB(P_JOB VARCHAR)
--    RETURN VARCHAR;
--    FUNCTION GET_SALARY(P_SALARY NUMBER)
--    RETURN NUMBER;
--    FUNCTION GET_DEPTNO(P_DEPTNO NUMBER)
--    RETURN NUMBER;
--END personnel;
--
--------------------BODY------------------------

---------------SPACK---------------------------
CREATE OR REPLACE PACKAGE personnel AS
  -- get employee's fullname
  FUNCTION get_fullname(n_emp_id NUMBER)
    RETURN VARCHAR2;
    -- get employee's COMM
      FUNCTION get_COMM(n_emp_id NUMBER)
      RETURN NUMBER;
  -- get employee's salary
  FUNCTION get_salary(n_emp_id NUMBER)
    RETURN NUMBER;
END personnel;

------------------------------BODY-----------------

CREATE OR REPLACE PACKAGE BODY personnel AS
  -- get employee's fullname
  FUNCTION get_fullname(n_emp_id NUMBER) RETURN VARCHAR2 IS
      v_fullname VARCHAR2(46);
  BEGIN
    SELECT ENAME || ',' ||  JOB
    INTO v_fullname
    FROM EMP
    WHERE EMPNO = n_emp_id;

    RETURN v_fullname;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  WHEN TOO_MANY_ROWS THEN
    RETURN NULL;
  END; -- end get_fullname
  
  -- get employee's fullname
  FUNCTION get_COMM(n_emp_id NUMBER) RETURN NUMBER IS
      v_COMM NUMBER(10);
  BEGIN
    SELECT COMM 
    INTO v_COMM
    FROM EMP
    WHERE EMPNO = n_emp_id;

    RETURN v_COMM;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  WHEN TOO_MANY_ROWS THEN
    RETURN NULL;
  END; -- end get_COMM

  -- get salary
  FUNCTION get_salary(n_emp_id NUMBER) RETURN NUMBER IS
    n_salary NUMBER(8,2);
  BEGIN
    SELECT sal
    INTO n_salary
    FROM EMP
    WHERE empno = n_emp_id;

    RETURN n_salary;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RETURN NULL;
      WHEN TOO_MANY_ROWS THEN
        RETURN NULL;
  END;
END personnel;


select * from emp;


select personnel.get_fullname(7839),personnel.get_COMM(7839),personnel.get_salary(7839) from dual
