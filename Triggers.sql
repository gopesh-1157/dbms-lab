1.

SQL>  CREATE OR REPLACE TRIGGER before_insert_employee
  2      BEFORE INSERT ON Employee
  3      FOR EACH ROW
  4      BEGIN
  5          IF :NEW.name IS NULL THEN
  6              RAISE_APPLICATION_ERROR(-20001, 'Employee name cannot be null');
  7          END IF;
  8      END;
  9     /

Trigger created.

SQL> INSERT INTO Employee(employee_id, name, salary) VALUES(107, NULL, 30000);
INSERT INTO Employee(employee_id, name, salary) VALUES(107, NULL, 30000)
            *
ERROR at line 1:
ORA-20001: Employee name cannot be null
ORA-06512: at "SYSTEM.BEFORE_INSERT_EMPLOYEE", line 3
ORA-04088: error during execution of trigger 'SYSTEM.BEFORE_INSERT_EMPLOYEE'

SQL>  INSERT INTO Employee(employee_id, name, role, salary, address_city)
  2      VALUES(107, 'SURESH', 'TECHNICIAN', 35000, 'TRICHY');

1 row created.

SQL>
SQL> select employee_id, name, role, salary, address_city from employee;

EMPLOYEE_ID NAME                 ROLE                     SALARY
----------- -------------------- -------------------- ----------
ADDRESS_CITY
--------------------------------------------------
        101 Rajesh Kumar         Senior Staff              90000
Chennai

        102 Rajesh Kumar         Senior Staff              90000
Chennai

        103 Priya                Senior Staff              70000
Madurai


EMPLOYEE_ID NAME                 ROLE                     SALARY
----------- -------------------- -------------------- ----------
ADDRESS_CITY
--------------------------------------------------
        104 Vijay                Senior Staff              50000
Madurai

        105 Lakshmi              Senior Staff              85000
Chennai

        106 Virat                Inventory Clerk           50000
VIRUDUNAGAR


EMPLOYEE_ID NAME                 ROLE                     SALARY
----------- -------------------- -------------------- ----------
ADDRESS_CITY
--------------------------------------------------
         107 SURESH               TECHNICIAN                35000
TRICHY


7 rows selected.

2.

SQL> CREATE OR REPLACE TRIGGER after_insert
  2      AFTER INSERT ON Employee
  3      FOR EACH ROW
  4      BEGIN
  5          DBMS_OUTPUT.PUT_LINE('New employee inserted with employee ID: ' || :NEW.employee_id);
  6      END;
  7      /

Trigger created.

SQL> INSERT INTO Employee(employee_id, name, role, salary, address_city)
  2      VALUES(108, 'Dhoni', 'MANAGER', 70000, 'CHENNAI');
New employee inserted with employee ID: 108

1 row created.

3.
SQL>  CREATE OR REPLACE TRIGGER before_delete_supplier
  2      BEFORE DELETE ON Supplier
  3      FOR EACH ROW
  4      DECLARE
  5          v_bank_count INTEGER;
  6     BEGIN
  7          SELECT COUNT(*) INTO v_bank_count
  8          FROM SupplierBank
  9          WHERE supplier_id = :OLD.supplier_id;
 10
 11         IF v_bank_count > 0 THEN
 12             RAISE_APPLICATION_ERROR(-20003, 'Supplier has linked bank accounts. Cannot delete.');
 13         END IF;
 14      END;
 15      /

Trigger created.


SQL> SELECT supplier_id FROM Supplier;

SUPPLIER_ID
-----------
          1
          2
          3
          4
          5

SQL> SELECT supplier_id FROM SupplierBank;

SUPPLIER_ID
-----------
          1
          2

SQL> DELETE FROM Supplier WHERE supplier_id = 1;
DELETE FROM Supplier WHERE supplier_id = 1
            *
ERROR at line 1:
ORA-20003: Supplier has linked bank accounts. Cannot delete.
ORA-06512: at "SYSTEM.BEFORE_DELETE_SUPPLIER", line 9
ORA-04088: error during execution of trigger 'SYSTEM.BEFORE_DELETE_SUPPLIER'


SQL> DELETE FROM Supplier WHERE supplier_id = 3;

1 row deleted.

4.

SQL> CREATE OR REPLACE TRIGGER after_delete_supplier
  2  AFTER DELETE ON Supplier
  3  FOR EACH ROW
  4  BEGIN
  5      DBMS_OUTPUT.PUT_LINE('Supplier record ' || :OLD.supplier_id ||
  6                           ' - Name: ' || :OLD.name ||
  7                           ' has been deleted.');
  8  END;
  9  /

Trigger created.

SQL>  DELETE FROM supplier WHERE supplier_id = 5;
Supplier record 5 - Name: TAILOR LIMITED has been deleted.

1 row deleted.

5.

SQL>  CREATE OR REPLACE TRIGGER before_update_employee
  2      BEFORE UPDATE ON Employee
  3      FOR EACH ROW
  4      BEGIN
  5          IF :NEW.salary < 0 THEN
  6              RAISE_APPLICATION_ERROR(-20004, 'Salary cannot be negative.');
  7          END IF;
  8      END;
  9      /

Trigger created.

SQL>
SQL> SELECT employee_id, name, salary FROM Employee
  2  ;

EMPLOYEE_ID NAME                     SALARY
----------- -------------------- ----------
        101 Rajesh Kumar              90000
        102 Rajesh Kumar              90000
        103 Priya                     70000
        104 Vijay                     50000
        105 Lakshmi                   85000
        106 Virat                     50000
        107 SURESH                    35000
        108 Dhoni                     70000

8 rows selected.

SQL> UPDATE Employee SET salary = -5000 WHERE employee_id = 101
  2  ;
UPDATE Employee SET salary = -5000 WHERE employee_id = 101
       *
ERROR at line 1:
ORA-20004: Salary cannot be negative.
ORA-06512: at "SYSTEM.BEFORE_UPDATE_EMPLOYEE", line 3
ORA-04088: error during execution of trigger 'SYSTEM.BEFORE_UPDATE_EMPLOYEE'


SQL> UPDATE Employee SET salary = 95000 WHERE employee_id = 101;

1 row updated.

6.

SQL> CREATE OR REPLACE TRIGGER after_update_employee
  2      AFTER UPDATE ON Employee
  3      FOR EACH ROW
  4      BEGIN
  5          DBMS_OUTPUT.PUT_LINE('Employee ' || :OLD.name ||
  6                              ' salary updated. Old: ' || :OLD.salary ||
  7                               ' | New: ' || :NEW.salary);
  8      END;
  9      /

Trigger created.

SQL>  SELECT employee_id, name, salary FROM Employee WHERE employee_id = 102;

EMPLOYEE_ID NAME                     SALARY
----------- -------------------- ----------
        102 Rajesh Kumar              90000

SQL> UPDATE Employee SET salary = 93000 WHERE employee_id = 102;
Employee Rajesh Kumar salary updated. Old: 90000 | New: 93000

1 row updated.

7.

SQL>  CREATE OR REPLACE TRIGGER compound_trigger_salesitem_order
  2      FOR INSERT OR DELETE ON SalesItem
  3      COMPOUND TRIGGER
  4
  5
  6        v_amount_change NUMBER := 500;
  7
  8
  9        BEFORE EACH ROW IS
 10       BEGIN
 11         IF INSERTING THEN
 12           UPDATE SalesOrder
 13           SET total_amount = total_amount + v_amount_change
 14           WHERE sales_id = :NEW.sales_id;
 15         END IF;
 16      END BEFORE EACH ROW;
 17
 18            AFTER EACH ROW IS
 19       BEGIN
 20         IF DELETING THEN
 21           UPDATE SalesOrder
 22           SET total_amount = total_amount - v_amount_change
 23           WHERE sales_id = :OLD.sales_id;
 24         END IF;
 25       END AFTER EACH ROW;
 26
 27     END compound_trigger_salesitem_order;
 28     /

Trigger created.

SQL>
SQL> INSERT INTO SalesItem(sales_item_id, sales_id, part_id, quantity, unit_price, total_price, tax_amount)
  2      VALUES(20, 1, 5, 2, 250, 500, 45);

1 row created.

SQL> DELETE FROM SalesItem WHERE sales_item_id = 20;

1 row deleted.

8.


SQL> CREATE OR REPLACE TRIGGER stmt_trigger
  2      AFTER INSERT ON employeetable
  3     BEGIN
  4         DBMS_OUTPUT.PUT_LINE('INSERT STATEMENT EXECUTED');
  5      END;
  6      /

Trigger created

 INSERT INTO Employeetable
  2      (employee_id, name, phone, mail, role, salary,
  3       manager_id, address_location, address_city, address_state)
  4  SELECT 1, 'YUGA',    '9876543210', 'yuga@company.com',    'TECHNICIAN', 62000, NULL, 'ANNA NAGAR', 'CHENNAI',    'TAMIL NADU' FROM DUAL
  5  UNION ALL
  6  SELECT 2, 'KARTHICK','9865432101', 'karthick@company.com','MANAGER',    52000, 1,    'RS PURAM',   'COIMBATORE', 'TAMIL NADU' FROM DUAL;
INSERT STATEMENT EXECUTED

2 rows created.

9.

SQL> select * from suppliercopy;

no rows selected

SQL> create or replace trigger ain  after insert on users for each row
    begin
    insert into suppliercopy(supplier_id,name,email) values(:new.supplier_id,:new.name,:new.email);
    end;
    /

SQL> insert into suppliercopy(supplier_id,name,email) values(6,'ashwin','ashwin@gmail.com');
new row inserted name:ashwin

1 row created.

SQL> select * from suppliercopy;

   USER_ID NAME                   AGE
---------- --------------- ----------
        99 ashwin                  43

SQL> insert into users(supplier_id,name,email) values(7,'gayle','gayle@gmail.com');
new row inserted name:gayle

1 row created.

SQL> select * from user_copy;

   USER_ID NAME                   AGE
---------- --------------- ----------
        99 ashwin                  43
       100 gayle                   47

10.


SQL> CREATE OR REPLACE TRIGGER emp_after_insert
  2  AFTER INSERT ON Employee
  3  FOR EACH ROW
  4  BEGIN
  5      
  6      INSERT INTO employee_copy(employee_id, name, salary)
  7      VALUES(:NEW.employee_id, :NEW.name, :NEW.salary);
  8
  9      
 10      IF :NEW.salary > 50000 THEN
 11          UPDATE employee_copy
 12          SET status = 'senior'
 13          WHERE employee_id = :NEW.employee_id;
 14      ELSE
 15          UPDATE employee_copy
 16          SET status = 'junior'
 17          WHERE employee_id = :NEW.employee_id;
 18      END IF;
 19
 20      DBMS_OUTPUT.PUT_LINE('New row inserted name: ' || :NEW.name);
 21  END;
 22  /

Trigger created.

SQL> INSERT INTO Employee(employee_id, name, role, salary, address_city)
  2  VALUES(7, 'rathinam', 'TECHNICIAN', 35000, 'MADURAI');

1 row created.

SQL> INSERT INTO Employee(employee_id, name, role, salary, address_city)
  2  VALUES(8, 'light', 'MANAGER', 72000, 'CHENNAI');

1 row created.

SQL> SELECT * FROM employee_copy;


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL                 SAL_LEVEL            STATUS
-------------------- -------------------- --------------------
          7 rathinam                                                       35000


                                          junior


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL                 SAL_LEVEL            STATUS
-------------------- -------------------- --------------------
          8 light                                                          72000


                                          senior

Hacker rank 

SELF I A,

SQL> CREATE OR REPLACE TRIGGER last_modified_trg
  2  BEFORE UPDATE ON emp
  3  FOR EACH ROW
  4  BEGIN
  5      :NEW.last_modified := SYSDATE;
  6  END;
  7  /

Trigger created.

SQL> select empno,empname,last_modified from emp;

     EMPNO EMPNAME                        LAST_MODI
---------- ------------------------------ ---------
       101 Arun
       102 Ajay
       103 Anitha
       104 Bala
       105 Akash
       106 Ramesh

6 rows selected.

SQL> update emp set salary = salary + 5000 where empno = 101;

1 row updated.

SQL> update emp set salary = salary + 5000 where empno = 102;

1 row updated.

SQL> select empno,empname,last_modified from emp;

     EMPNO EMPNAME                        LAST_MODI
---------- ------------------------------ ---------
       101 Arun                           22-MAR-26
       102 Ajay                           22-MAR-26
       103 Anitha
       104 Bala
       105 Akash
       110 Ramesh

6 rows selected.

SELF I B,

SQL> CREATE OR REPLACE TRIGGER restrict_update_time
  2  BEFORE UPDATE OF salary ON emp
  3  FOR EACH ROW
  4  BEGIN
  5      IF TO_CHAR(SYSDATE, 'HH24') NOT BETWEEN 9 AND 18 THEN
  6          RAISE_APPLICATION_ERROR(-20001,
  7          'Updates not allowed outside working hours (9 AM - 6 PM)');
  8      END IF;
  9  END;
 10  /

Trigger created.

SQL> select current_timestamp from dual;

CURRENT_TIMESTAMP
---------------------------------------------------------------------------
22-MAR-26 08.54.56.305000 AM +05:30

SQL> update emp set salary = salary + 5000 where empno = 103;
update emp set salary = salary + 5000 where empno = 103
       *
ERROR at line 1:
ORA-20001: Updates not allowed outside working hours (9 AM - 6 PM)
ORA-06512: at "SYSTEM.RESTRICT_UPDATE_TIME", line 3
ORA-04088: error during execution of trigger 'SYSTEM.RESTRICT_UPDATE_TIME'

SQL> select current_timestamp from dual;

CURRENT_TIMESTAMP
---------------------------------------------------------------------------
22-MAR-26 09.05.59.902000 AM +05:30

SQL> update emp set salary = salary + 5000 where empno = 103;

1 row updated.

SELF II A,

SQL> select deptno,deptname from department;

    DEPTNO DEPTNAME
---------- --------------------------------------------------
        10 CSE
        20 ECE
        30 AIDS
        40 EEE

SQL> select empno,deptno from emp;

     EMPNO     DEPTNO
---------- ----------
       101         10
       102         10
       103         20
       104         20
       105         30
       110         20

6 rows selected.

SQL> CREATE OR REPLACE TRIGGER prevent_parent_delete
  2  BEFORE DELETE ON department
  3  FOR EACH ROW
  4  DECLARE
  5      v_count NUMBER;
  6  BEGIN
  7      SELECT COUNT(*) INTO v_count
  8      FROM emp
  9      WHERE deptno = :OLD.deptno;
 10
 11      IF v_count > 0 THEN
 12          RAISE_APPLICATION_ERROR(-20002,
 13          'Cannot delete department: child records exist');
 14      END IF;
 15  END;
 16  /

Trigger created.

SQL> delete department where deptno = 10;
delete department where deptno = 10
       *
ERROR at line 1:
ORA-20002: Cannot delete department: child records exist
ORA-06512: at "SYSTEM.PREVENT_PARENT_DELETE", line 9
ORA-04088: error during execution of trigger 'SYSTEM.PREVENT_PARENT_DELETE'

SQL> delete department where deptno = 40;

1 row deleted.

SELF II B,

SQL> CREATE OR REPLACE TRIGGER no_duplicate_name
  2  BEFORE INSERT OR UPDATE ON emp
  3  FOR EACH ROW
  4  DECLARE
  5      v_count NUMBER;
  6  BEGIN
  7      SELECT COUNT(*) INTO v_count
  8      FROM emp
  9      WHERE empname = :NEW.empname;
 10
 11      IF v_count > 0 THEN
 12          RAISE_APPLICATION_ERROR(-20003,
 13          'Duplicate employee name not allowed');
 14      END IF;
 15  END;
 16  /

Trigger created.

SQL> select empno,empname from emp;

     EMPNO EMPNAME
---------- ------------------------------
       101 Arun
       102 Ajay
       103 Anitha
       104 Bala
       105 Akash
       110 Ramesh

6 rows selected.

SQL> insert into emp(empno,empname) values(106,'Akash');
insert into emp(empno,empname) values(106,'Akash')
            *
ERROR at line 1:
ORA-20003: Duplicate employee name not allowed
ORA-06512: at "SYSTEM.NO_DUPLICATE_NAME", line 9
ORA-04088: error during execution of trigger 'SYSTEM.NO_DUPLICATE_NAME'

SQL> insert into emp(empno,empname) values(106,'Nandish');

1 row created.

SELF III A,

SQL> select item_id,item_name,stock from items;

   ITEM_ID ITEM_NAME                                               STOCK
---------- -------------------------------------------------- ----------
         1 Laptop                                                     10
         2 Mouse                                                      50
         3 Keyboard                                                   20

SQL> CREATE OR REPLACE TRIGGER trg_check_stock
  2  BEFORE INSERT ON orders
  3  FOR EACH ROW
  4  DECLARE
  5      v_stock NUMBER;
  6      v_pending NUMBER;
  7  BEGIN
  8      -- Get available stock
  9      SELECT stock INTO v_stock
 10      FROM items
 11      WHERE item_id = :NEW.item_id;
 12
 13      -- Get pending orders
 14      SELECT NVL(SUM(quantity),0) INTO v_pending
 15      FROM orders
 16      WHERE item_id = :NEW.item_id
 17      AND status = 'PENDING';
 18
 19      IF (:NEW.quantity + v_pending) > v_stock THEN
 20          RAISE_APPLICATION_ERROR(-20004,
 21          'Insufficient stock considering pending orders');
 22      END IF;
 23  END;
 24  /

Trigger created.

SQL> select order_id,item_id,quantity,status from orders;

  ORDER_ID    ITEM_ID   QUANTITY STATUS
---------- ---------- ---------- --------------------
       101          1          3 PENDING
       103          1          2 COMPLETED
       104          2         10 PENDING
       102          1          2 PENDING
       105          1          3 PENDING

SQL> INSERT INTO orders VALUES (106, 1, 6, 'PENDING');
INSERT INTO orders VALUES (106, 1, 6, 'PENDING')
            *
ERROR at line 1:
ORA-20004: Insufficient stock considering pending orders
ORA-06512: at "SYSTEM.TRG_CHECK_STOCK", line 17
ORA-04088: error during execution of trigger 'SYSTEM.TRG_CHECK_STOCK'

Question

7a.

SQL> CREATE TABLE Student (student_id   INT PRIMARY KEY,student_name VARCHAR(25),city VARCHAR(25));

Table created.

SQL>  CREATE TABLE Course (course_id   INT PRIMARY KEY,course_name VARCHAR(25),department  VARCHAR(25));

Table created.

SQL>  CREATE TABLE Enroll (
  2         student_id INT,
  3         course_id  INT,
  4         marks      INT,
  5         PRIMARY KEY (student_id, course_id),
  6         FOREIGN KEY (student_id) REFERENCES Student(student_id),
  7         FOREIGN KEY (course_id)  REFERENCES Course(course_id)
  8     );

Table created.

SQL>  CREATE TABLE Teaches (
  2          instructor_name VARCHAR(25),
  3         course_id       INT,
  4          FOREIGN KEY (course_id) REFERENCES Course(course_id)
  5      );

Table created.


SQL>  INSERT INTO Student VALUES (1, 'gopesh',   'Chennai');

1 row created.

SQL>  INSERT INTO Student VALUES (2, 'david',  'Madurai');

1 row created.


SQL>  INSERT INTO Student VALUES (3, 'manoj',  'Trichy');

1 row created.


SQL>  INSERT INTO Student VALUES (4, 'prince',  'Chennai');

1 row created.


SQL>  INSERT INTO Course VALUES (102, 'OS','CSE');

1 row created.


SQL>  INSERT INTO Course VALUES (103, 'Networks','ECE');

1 row created.


SQL>  INSERT INTO Student VALUES (5, 'praveen',   'Coimbatore');

1 row created.


SQL>  INSERT INTO Course VALUES (101, 'DBMS',    'CSE');

1 row created.


SQL>  INSERT INTO Teaches VALUES ('Dr. kavi', 101);

1 row created.


SQL>  INSERT INTO Teaches VALUES ('Dr. mala', 102);

1 row created.


SQL>  INSERT INTO Teaches VALUES ('Dr. santhi',   103);

1 row created.

SQL>  INSERT INTO Enroll VALUES (1, 101, 85);

1 row created.


SQL>  INSERT INTO Enroll VALUES (1, 102, 90);

1 row created.


SQL> INSERT INTO Enroll VALUES (2, 101, 78);

1 row created.


SQL>  INSERT INTO Enroll VALUES (3, 102, 92);

1 row created.


SQL>  INSERT INTO Enroll VALUES (4, 101, 88);

1 row created.


SQL>  INSERT INTO Enroll VALUES (5, 103, 76);

1 row created.


SQL>  INSERT INTO Teaches VALUES ('Dr. Kumar', 101);

1 row created.


SQL>  INSERT INTO Teaches VALUES ('Dr. Kumar', 102);

1 row created.

SQL>  INSERT INTO Teaches VALUES ('Dr. Raj',   103);

1 row created.

A. Increase marks by 10% for students in courses taught by 'Dr. Kumar'

SQL> select student_id,instructor_name from enroll e join teaches t using(course_id) where instructor_name='Dr. Kumar';

STUDENT_ID INSTRUCTOR_NAME
---------- -------------------------
         1 Dr. Kumar
         1 Dr. Kumar
         2 Dr. Kumar
         3 Dr. Kumar
         4 Dr. Kumar

SQL>  UPDATE Enroll
  2      SET marks =marks * 1.10
  3      WHERE course_id IN (
  4          SELECT course_id FROM Teaches
  5          WHERE instructor_name = 'Dr. Kumar'
  6      );

5 rows updated.

SQL> select student_id,instructor_name,marks from enroll e join teaches t using(course_id) where instructor_name='Dr. Kumar';

STUDENT_ID INSTRUCTOR_NAME                MARKS
---------- ------------------------- ----------
         1 Dr. Kumar                         94
         1 Dr. Kumar                         99
         2 Dr. Kumar                         86
         3 Dr. Kumar                         98 
         4 Dr. Kumar                         97

B. Student name with the second highest marks

SQL>  SELECT s.student_name, e.marks
  2      FROM Student s
  3      JOIN Enroll e ON s.student_id = e.student_id
  4      WHERE e.marks = (
  5          SELECT MAX(marks)
  6          FROM Enroll
  7          WHERE marks < (SELECT MAX(marks) FROM Enroll)
  8      )
  9      AND ROWNUM = 1;

STUDENT_NAME                   MARKS
------------------------- ----------
gopesh                            99

C. Course names where marks obtained > average marks of all students

SQL> SELECT AVG(marks) FROM Enroll;

AVG(MARKS)
----------
92.1666667

SQL>  SELECT c.course_name,
  2             (SELECT AVG(marks) FROM Enroll) AS average_marks
  3      FROM Course c
  4      JOIN Enroll e ON c.course_id = e.course_id
  5      WHERE e.marks > (
  6          SELECT AVG(marks) FROM Enroll
  7      )
  8      GROUP BY c.course_name;

COURSE_NAME               AVERAGE_MARKS
------------------------- -------------
OS                           92.1666667
DBMS                         92.1666667

Student name and city of students who (enrolled in more than one course)

SQL> SELECT s.student_name, s.city
  2      FROM Student s
  3      WHERE s.student_id IN (
  4          SELECT student_id
  5          FROM Enroll
  6          GROUP BY student_id
  7          HAVING COUNT(course_id) > 1
  8      );

STUDENT_NAME              CITY
------------------------- -------------------------
gopesh                    Chennai

PL/SQL Function to return course name with largest number of enrollments

SQL> CREATE OR REPLACE FUNCTION get_most
  2      RETURN VARCHAR2
  3      AS
  4          v_course_name VARCHAR2(25);
  5      BEGIN
  6          SELECT c.course_name
  7          INTO v_course_name
  8          FROM Course c
  9          JOIN Enroll e ON c.course_id = e.course_id
 10         GROUP BY c.course_name
 11         HAVING COUNT(e.student_id) = (
 12             SELECT MAX(COUNT(student_id))
 13             FROM Enroll
 14             GROUP BY course_id
 15         );
 16
 17         RETURN v_course_name;
 18     END get_most;
 19     /

Function created.

SQL> SELECT get_most() FROM DUAL;

GET_MOST()
-----------------------------------------
DBMS

7b.

SQL> CREATE TABLE Members (
  2          member_id   INT PRIMARY KEY,
  3          member_name VARCHAR(25),
  4          dept        VARCHAR(25),
  5          address     VARCHAR(50),
  6          phone       VARCHAR(15)
  7      );

Table created.


SQL>  CREATE TABLE Books (
  2          book_id    INT PRIMARY KEY,
  3          book_title VARCHAR(50),
  4          author     VARCHAR(25),
  5         category   VARCHAR(25),
  6          price      FLOAT
  7      );

Table created.


SQL>  CREATE TABLE Borrow (
  2         member_id   INT,
  3          book_id     INT,
  4          issue_date  DATE,
  5          return_date DATE,
  6         PRIMARY KEY (member_id, book_id),
  7          FOREIGN KEY (member_id) REFERENCES Members(member_id),
  8          FOREIGN KEY (book_id)   REFERENCES Books(book_id)
  9      );

Table created.


SQL>  CREATE TABLE Staff (
  2          staff_id   INT PRIMARY KEY,
  3          staff_name VARCHAR(25),
  4         block      VARCHAR(10),
  5         building   VARCHAR(10)
  6     );

Table created.


SQL>  CREATE TABLE Fine (
  2          member_id INT,
  3          amount    FLOAT,
  4          status    VARCHAR(15),
  5          FOREIGN KEY (member_id) REFERENCES Members(member_id)
  6      );

Table created.


SQL>  INSERT INTO Members VALUES (1, 'gopesh',   'CSE', 'Chennai',  '9876541230');

1 row created.


SQL>  INSERT INTO Members VALUES (2, 'yagami light',  'ECE', 'Madurai',  '9876541231');

1 row created.


SQL>  INSERT INTO Members VALUES (3, 'tony',  'IT',  'Trichy',   '9876541232');

1 row created.


SQL>  INSERT INTO Members VALUES (4, 'johan',  'CSE', 'Chennai',  '9876541233');

1 row created.


SQL>  INSERT INTO Books VALUES (1, 'Database Concepts',  'prasanna',  'Database',    450);

1 row created.


SQL>  INSERT INTO Books VALUES (2, 'Data Mining Basics',  'Hari',      'Data Mining', 500);

1 row created.


SQL>  INSERT INTO Books VALUES (3, 'Operating Systems',   'raja',   'OS',          400);

1 row created.


SQL>  INSERT INTO Books VALUES (4, 'Advanced DBMS',       'Ramez',    'Database',    600);

1 row created.


SQL>  INSERT INTO Borrow VALUES (1, 1, DATE '2024-01-10', DATE '2024-01-20');

1 row created.


SQL>  INSERT INTO Borrow VALUES (2, 2, DATE '2024-02-01', DATE '2024-02-15');

1 row created.

SQL>  INSERT INTO Borrow VALUES (3, 3, DATE '2024-03-05', DATE '2024-03-20');

1 row created.


SQL>  INSERT INTO Borrow VALUES (4, 4, DATE '2024-04-01', DATE '2024-04-10');

1 row created.


SQL>  INSERT INTO Staff VALUES (1, 'kavi',   'A', 'Main');

1 row created.


SQL>  INSERT INTO Staff VALUES (2, 'Bala',   'C', 'Main');

1 row created.


SQL>  INSERT INTO Staff VALUES (3, 'mala', 'B', 'Annex');

1 row created.


SQL>  INSERT INTO Staff VALUES (4, 'jinwoo',  'A', 'Main');

1 row created.


SQL>  INSERT INTO Fine VALUES (1, 600, 'Paid');

1 row created.


SQL>  INSERT INTO Fine VALUES (2, 200, 'Unpaid');

1 row created.


SQL>  INSERT INTO Fine VALUES (3, 0,   'Paid');

1 row created.

A. Staff working in building 'A' block or 'C' block (case-insensitive)

SQL> SELECT staff_name
  2      FROM Staff
  3      WHERE UPPER(block) IN ('A', 'C');

STAFF_NAME
-------------------------
kavi
Bala
jinwoo

B. Book details for category 'Database' or 'Data Mining' AND member details where fine > 500

SQL> SELECT b.*
  2      FROM Books b
  3      WHERE UPPER(b.category) IN ('DATABASE', 'DATA MINING');

   BOOK_ID BOOK_TITLE
---------- --------------------------------------------------
AUTHOR                    CATEGORY                       PRICE
------------------------- ------------------------- ----------
         1 Database Concepts
prasanna                  Database                         450

         2 Data Mining Basics
Hari                      Data Mining                      500

         4 Advanced DBMS
Ramez                     Database                         600

SQL>  SELECT m.*
  2      FROM Members m
  3      JOIN Fine f ON m.member_id = f.member_id
  4      WHERE f.amount > 500;

 MEMBER_ID MEMBER_NAME               DEPT
---------- ------------------------- -------------------------
ADDRESS                                            PHONE
-------------------------------------------------- ---------------
         1 gopesh                    CSE
Chennai 

C. View — member_id, member_name, and titles of books borrowed

SQL> CREATE VIEW MemberBorrowedBooks AS
  2      SELECT m.member_id, m.member_name, b.book_title
  3      FROM Members m
  4      JOIN Borrow br ON m.member_id = br.member_id
  5      JOIN Books  b  ON br.book_id  = b.book_id;

View created.

SQL> SELECT * FROM MemberBorrowedBooks;

 MEMBER_ID MEMBER_NAME
---------- -------------------------
BOOK_TITLE
--------------------------------------------------
         1 gopesh
Database Concepts

         2 yagami light
Data Mining Basics

         3 tony
Operating Systems


 MEMBER_ID MEMBER_NAME
---------- -------------------------
BOOK_TITLE
--------------------------------------------------
         4 johan
Advanced DBMS

D. Procedure to insert new book details

SQL>  CREATE OR REPLACE PROCEDURE insert_book (
  2          p_book_id    IN INT,
  3          p_title      IN VARCHAR2,
  4          p_author     IN VARCHAR2,
  5          p_category   IN VARCHAR2,
  6          p_price      IN FLOAT
  7     )
  8      AS
  9      BEGIN
 10         INSERT INTO Books (book_id, book_title, author, category, price)
 11         VALUES (p_book_id, p_title, p_author, p_category, p_price);
 12         COMMIT;
 13         DBMS_OUTPUT.PUT_LINE('Book inserted successfully.');
 14    END;
 15     /

Procedure created.

SQL>
SQL>  EXEC insert_book(6, 'Computer Networks', 'rathinam', 'Networks', 520);

PL/SQL procedure successfully completed.

SQL> select * from books;

   BOOK_ID BOOK_TITLE
---------- --------------------------------------------------
AUTHOR                    CATEGORY                       PRICE
------------------------- ------------------------- ----------
         1 Database Concepts
prasanna                  Database                         450

         2 Data Mining Basics
Hari                      Data Mining                      500

         3 Operating Systems
raja                      OS                               400


   BOOK_ID BOOK_TITLE
---------- --------------------------------------------------
AUTHOR                    CATEGORY                       PRICE
------------------------- ------------------------- ----------
         4 Advanced DBMS
Ramez                     Database                         600

         6 Computer Networks
rathinam                  Networks                         520

E. Index on member_name for alphabetical quick retrieval

SQL> set timing on;
SQL> SELECT * FROM Members ORDER BY member_name;

 MEMBER_ID MEMBER_NAME               DEPT
---------- ------------------------- -------------------------
ADDRESS                                            PHONE
-------------------------------------------------- ---------------
         1 gopesh                    CSE
Chennai                                            9876541230

         4 johan                     CSE
Chennai                                            9876541233

         3 tony                      IT
Trichy                                             9876541232


 MEMBER_ID MEMBER_NAME               DEPT
---------- ------------------------- -------------------------
ADDRESS                                            PHONE
-------------------------------------------------- ---------------
         2 yagami light              ECE
Madurai                                            9876541231


Elapsed: 00:00:00.00
SQL> CREATE INDEX idx_member_name ON Members(member_name);

Index created.

Elapsed: 00:00:00.03
SQL>  SELECT * FROM Members ORDER BY member_name;

 MEMBER_ID MEMBER_NAME               DEPT
---------- ------------------------- -------------------------
ADDRESS                                            PHONE
-------------------------------------------------- ---------------
         1 gopesh                    CSE
Chennai                                            9876541230

         4 johan                     CSE
Chennai                                            9876541233

         3 tony                      IT
Trichy                                             9876541232


 MEMBER_ID MEMBER_NAME               DEPT
---------- ------------------------- -------------------------
ADDRESS                                            PHONE
-------------------------------------------------- ---------------
         2 yagami light              ECE
Madurai                                            9876541231


Elapsed: 00:00:00.00

