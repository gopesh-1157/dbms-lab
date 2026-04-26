dml queries

1.Insert a new supplier record into the Supplier table.

SQL> INSERT INTO Supplier VALUES(1, 'Auto Parts India', 'contact@api.com', '9876543210','GST123456', 'Chennai', 'T Nagar', 'Tamil Nadu');

SQL> SELECT * FROM Supplier;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          1 Auto Parts India     contact@api.com      9876543210 GST123456
Chennai              T Nagar              Tamil Nadu

2.Insert multiple supplier records into the Supplier table at once

SQL> INSERT ALL
  2      INTO Supplier VALUES(2, 'Brake Masters Ltd', 'info@brake.com', '9876543211',
  3          'GST234567', 'Coimbatore', 'RS Puram', 'Tamil Nadu')
  4      INTO Supplier VALUES(3, 'Engine Parts Co', 'sales@engine.com', '9876543212',
  5          'GST345678', 'Madurai', 'Anna Nagar', 'Tamil Nadu')
  6      INTO Supplier VALUES(4, 'Battery Solutions', 'support@battery.com', '9876543213',
  7          'GST456789', 'Trichy', 'Cantonment', 'Tamil Nadu')
  8  SELECT * FROM dual;

3 rows created.

SQL> SELECT * FROM Supplier;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          1 Auto Parts India     contact@api.com      9876543210 GST123456
Chennai              T Nagar              Tamil Nadu

          2 Brake Masters Ltd    info@brake.com       9876543211 GST234567
Coimbatore           RS Puram             Tamil Nadu

          3 Engine Parts Co      sales@engine.com     9876543212 GST345678
Madurai              Anna Nagar           Tamil Nadu


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          4 Battery Solutions    support@battery.com  9876543213 GST456789
Trichy               Cantonment           Tamil Nadu

3.Attempt to insert a supplier with an existing ID, causing a duplicate key error.

SQL>  INSERT INTO Supplier VALUES(1, 'Auto Parts India', 'contact@api.com', '9876543210','GST123456', 'Chennai', 'T Nagar', 'Tamil Nadu');
 INSERT INTO Supplier VALUES(1, 'Auto Parts India', 'contact@api.com', '9876543210','GST123456', 'Chennai', 'T Nagar', 'Tamil Nadu')
*
ERROR at line 1:
ORA-00001: unique constraint (SYSTEM.SYS_C008448) violated


4.Insert a new employee record into the Employee table

SQL> INSERT INTO Employee (employee_id, name, phone, mail, role, salary, manager_id, address_location, address_city, address_state)
  2  VALUES (101, 'Rajesh Kumar', '9840123456', 'rajesh@spares.com', 'Store Manager', 45000, NULL, 'Anna Nagar', 'Chennai', 'Tamil Nadu');

1 row created.

5.Insert multiple employee records in a single command.

SQL> INSERT ALL
  2      INTO Employee VALUES(102, 'Rajesh Kumar', '9123456789',
  3          'Store Manager', 45000,101, 'MG Road', 'Chennai', 'Tamil Nadu', 'rajesh@parts.com')
  4      INTO Employee VALUES(103, 'Priya Sharma', '9123456790',
  5          'Sales Executive', 30000, 102, 'Anna Salai', 'Madurai', 'Tamil Nadu', 'priya@parts.com')
  6      INTO Employee VALUES(104, 'Vijay Reddy', '9123456791',
  7          'Inventory Clerk', 25000, 103, 'Nungambakkam', 'Madurai', 'Tamil Nadu', 'vijay@parts.com')
  8      INTO Employee VALUES(105, 'Lakshmi Iyer', '9123456792',
  9          'Accounts Manager', 40000, 104,'T Nagar', 'Chennai', 'Tamil Nadu', 'lakshmi@parts.com')
 10  SELECT * FROM dual;

4 rows created.

SQL> SELECT * FROM employee;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             45000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Store Manager             45000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Sales Executive           30000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Inventory Clerk           25000
       103 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Accounts Manager          40000
       104 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com

6.Attempt to insert an employee violating a check constraint


SQL> INSERT INTO Employee (employee_id, name, phone, mail, role, salary, manager_id, address_location, address_city, address_state)VALUES (106, 'Arun Kumar'
  2   , '9840123456', 'arun@spares.com', 'Store Manager', 0, NULL, 'Anna Nagar', 'madurai', 'Tamil Nadu');
INSERT INTO Employee (employee_id, name, phone, mail, role, salary, manager_id, address_location, address_city, address_state)VALUES (106, 'Arun Kumar'
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.C1) violated

7.Copy employee IDs, cities, and salaries into Employee1 for employees earning more than 25,000.


SQL> INSERT INTO employee1 (employee_id, address_CITY, salary)
  2      SELECT employee_id, address_CITY, salary
  3      FROM employee WHERE salary>25000;

4 rows created.

SQL> select * from employee1
  2  ;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             45000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Store Manager             45000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Sales Executive           30000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Inventory Clerk           25000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Accounts Manager          40000
       103 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101                                                                45000

Chennai



EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102                                                                45000

Chennai



EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103                                                                30000

Madurai



EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105                                                                40000

Chennai



9 rows selected.

8.Delete all records from Employee1.


SQL> DELETE FROM employee1;

9 rows deleted.

9.Display Employee1 after deletion 
SQL> SELECT * FROM employee1;

no rows selected

10.Display Employee1 after deletion (table becomes empty).


SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM employee1;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             45000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Store Manager             45000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Sales Executive           30000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Inventory Clerk           25000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Accounts Manager          40000
       103 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com

11.Delete employees in Employee1 whose salary equals 30,000.


SQL> DELETE FROM employee1 WHERE salary=30000;

1 row deleted.

SQL> select * from employee1;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             45000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Store Manager             45000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Inventory Clerk           25000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Accounts Manager          40000
       103 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com

12.Roll back the deletion to restore the removed record.


SQL> rollback;

Rollback complete.

SQL> SELECT * FROM employee1;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             45000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Store Manager             45000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Sales Executive           30000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Inventory Clerk           25000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Accounts Manager          40000
       103 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com


13.Delete employees whose city is Madurai.


SQL> DELETE FROM EMPLOYEE1 WHERE ADDRESS_CITY='Madurai';

2 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Chennai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

14.Delete employees whose city matches “Madurai” using LIKE.


SQL> DELETE FROM employee1 WHERE address_CITY LIKE 'Madurai';

2 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Chennai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

15.Delete employees whose city is not Madurai.


SQL> DELETE FROM employee1 WHERE address_CITY not LIKE 'Madurai';

3 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Madurai
Madurai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai


16.Delete employees whose city starts with “M”.


SQL> DELETE FROM Employee1 WHERE Address_CITY LIKE 'M%';

2 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Chennai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

17.Delete employees whose city does not start with “M”.


SQL> DELETE FROM Employee1 WHERE Address_CITY not LIKE 'M%';

3 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Madurai
Madurai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

18.Delete employees whose city ends with the letter “i”.


SQL> DELETE FROM Employee1 WHERE Address_CITY LIKE '%i';

5 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

no rows selected

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

19.Delete employees whose city has “a” as the second letter.


SQL> DELETE FROM Employee1 WHERE Address_CITY LIKE '_a%';

2 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Chennai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

20.Delete employees whose city does not have “a” as the second letter.

SQL> DELETE FROM Employee1 WHERE Address_CITY not LIKE '_a%';

3 rows deleted.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Madurai
Madurai

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY FROM employee1;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai

21.Delete employees located in cities starting with “C” and having salary greater than 30,000.

SQL> SELECT ADDRESS_CITY,salary FROM employee1;

ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
Chennai                                                 45000
Chennai                                                 45000
Madurai                                                 30000
Madurai                                                 25000
Chennai                                                 40000

SQL>  DELETE FROM employee1 WHERE Address_CITY LIKE 'C%' AND salary>30000;

3 rows deleted.

SQL> SELECT ADDRESS_CITY,salary FROM employee1;

ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
Madurai                                                 30000
Madurai                                                 25000

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY,salary FROM employee1;

ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
Chennai                                                 45000
Chennai                                                 45000
Madurai                                                 30000
Madurai                                                 25000
Chennai                                                 40000

22.Delete employees located in cities starting with “C” OR salary greater than 30,000.


SQL>  DELETE FROM employee1 WHERE Address_CITY LIKE 'C%' or salary>30000;

3 rows deleted.

SQL> SELECT ADDRESS_CITY,salary FROM employee1;

ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
Madurai                                                 30000
Madurai                                                 25000

SQL> rollback;

Rollback complete.

SQL> SELECT ADDRESS_CITY,salary FROM employee1;

ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
Chennai                                                 45000
Chennai                                                 45000
Madurai                                                 30000
Madurai                                                 25000
Chennai                                                 40000

23.Increase salary of all employees by 10,000.


SQL> SELECT salary FROM employee;

    SALARY
----------
     45000
     45000
     30000
     25000
     40000

SQL> UPDATE employee SET salary=salary+10000;

5 rows updated.

SQL> SELECT salary FROM employee;

    SALARY
----------
     55000
     55000
     40000
     35000
     50000
24.Increase salary by 10,000 only for employees earning more than 50,000.


SQL> SELECT salary FROM employee;

    SALARY
----------
     65000
     65000
     50000
     45000
     60000

SQL> UPDATE employee SET salary=salary+10000 where salary>50000;

3 rows updated.

SQL> SELECT salary FROM employee;

    SALARY
----------
     75000
     75000
     50000
     45000
     70000

25.Increase salary by 10,000 for employees earning more than 50,000 and whose city has exactly seven characters.


SQL> SELECT salary,Address_city FROM employee;

    SALARY ADDRESS_CITY
---------- --------------------------------------------------
     75000 Chennai
     75000 Chennai
     50000 Madurai
     45000 Madurai
     70000 Chennai
     50000 VIRUDUNAGAR

6 rows selected.


SQL> UPDATE employee SET salary=salary+10000 where salary>50000 and address_city like '_______';

3 rows updated.

SQL> SELECT salary,Address_city FROM employee;

    SALARY ADDRESS_CITY
---------- --------------------------------------------------
     85000 Chennai
     85000 Chennai
     50000 Madurai
     45000 Madurai
     80000 Chennai
     50000 VIRUDUNAGAR

6 rows selected.

26.Increase salary by 5,000 and change role to “Senior Staff” for employees earning above 30,000 and whose city name length matches the pattern.


SQL> SELECT role,salary,Address_city FROM employee;

ROLE                     SALARY
-------------------- ----------
ADDRESS_CITY
--------------------------------------------------
Store Manager             85000
Chennai

Store Manager             85000
Chennai

Sales Executive           50000
Madurai


ROLE                     SALARY
-------------------- ----------
ADDRESS_CITY
--------------------------------------------------
Inventory Clerk           45000
Madurai

Accounts Manager          80000
Chennai

Inventory Clerk           50000
VIRUDUNAGAR


6 rows selected.

SQL> UPDATE Employee
  2  SET SALARY = SALARY + 5000,
  3      ROLE = 'Senior Staff'
  4  WHERE SALARY > 30000
  5  AND ADDRESS_CITY LIKE '_______';

5 rows updated.

SQL> SELECT role,salary,Address_city FROM employee;

ROLE                     SALARY
-------------------- ----------
ADDRESS_CITY
--------------------------------------------------
Senior Staff              90000
Chennai

Senior Staff              90000
Chennai

Senior Staff              55000
Madurai


ROLE                     SALARY
-------------------- ----------
ADDRESS_CITY
--------------------------------------------------
Senior Staff              50000
Madurai

Senior Staff              85000
Chennai

Inventory Clerk           50000
VIRUDUNAGAR


6 rows selected.

27.Save all changes permanently using COMMIT.


SQL> COMMIT;

Commit complete.

28.Add a new column (expenseyear) and fill it using the year from expense_date.

SQL> alter table expenserecord add expenseyear number;

Table altered.


SQL> UPDATE ExpenseRecord
  2  SET expenseyear = EXTRACT(YEAR FROM expense_date);

4 rows updated.

SQL> select expenseyear from expenserecord;

EXPENSEYEAR
-----------
       2025
       2025
       2025
       2025

29.Display updated Employee table records.



SQL> SELECT * FROM EMPLOYEE;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Senior Staff              90000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Senior Staff              90000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Senior Staff              55000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Senior Staff              50000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Senior Staff              85000
       103 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        106 Virat                9123456718      Inventory Clerk           50000
       101 t nagar
VIRUDUNAGAR                                        Tamil Nadu
virat@parts.com


6 rows selected.

SQL> SELECT * FROM EMPLOYEE1;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             45000
           Anna Nagar
Chennai                                            Tamil Nadu
rajesh@spares.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        102 Rajesh Kumar         9123456789      Store Manager             45000
       101 MG Road
Chennai                                            Tamil Nadu
rajesh@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Sales Executive           30000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Inventory Clerk           25000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        105 Lakshmi Iyer         9123456792      Accounts Manager          40000
       103 T Nagar
Chennai                                            Tamil Nadu
lakshmi@parts.com


SQL> MERGE INTO EMPLOYEE e
  2  USING EMPLOYEE1 t
  3  ON (e.EMPLOYEE_ID = t.EMPLOYEE_ID)
  4  WHEN MATCHED THEN
  5      UPDATE SET
  6          e.ROLE = t.ROLE,
  7          e.SALARY = t.SALARY
  8  WHEN NOT MATCHED THEN
  9      INSERT (EMPLOYEE_ID, ROLE, SALARY)
 10      VALUES (t.EMPLOYEE_ID, t.ROLE, t.SALARY);

5 rows merged.

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY
  2  FROM EMPLOYEE;

EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             45000
        102 Store Manager             45000
        103 Sales Executive           30000
        104 Inventory Clerk           25000
        105 Accounts Manager          40000
        106 Inventory Clerk           50000

6 rows selected.

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY
  2  FROM EMPLOYEE1;

EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             45000
        102 Store Manager             45000
        103 Sales Executive           30000
        104 Inventory Clerk           25000
        105 Accounts Manager          40000

30 .Increase salary of all employees again by 10,000.



SQL> update employee set salary = salary+10000;

6 rows updated.

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY
  2  FROM EMPLOYEE;

EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000

6 rows selected.

31.Synchronize Employee and Employee1 tables using MERGE to update


SQL> MERGE INTO EMPLOYEE1 e
  2  USING EMPLOYEE t
  3  ON (e.EMPLOYEE_ID = t.EMPLOYEE_ID)
  4  WHEN MATCHED THEN
  5      UPDATE SET
  6          e.ROLE = t.ROLE,
  7          e.SALARY = t.SALARY
  8  WHEN NOT MATCHED THEN
  9      INSERT (EMPLOYEE_ID, ROLE, SALARY)
 10      VALUES (t.EMPLOYEE_ID, t.ROLE, t.SALARY);

6 rows merged.

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY
  2  FROM EMPLOYEE1;

EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000

6 rows selected.

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY
  2  FROM EMPLOYEE;

EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000

6 rows selected.

