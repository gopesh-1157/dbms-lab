PL/SQL

1.

SQL> SELECT name, salary FROM Employee;

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Rajesh Kumar              90000
Priya Sharma              55000
Vijay Reddy               50000
Lakshmi Iyer              85000
Virat                     50000

6 rows selected.

SQL>  DECLARE
  2          v_salary NUMBER;
  3      BEGIN
  4          v_salary := 70000;
  5          UPDATE Employee SET salary = v_salary WHERE name = 'Priya Sharma';
  6          DBMS_OUTPUT.PUT_LINE('The salary of Priya Sharma has been updated to: ' || v_salary);
  7          COMMIT;
  8      END;
  9      /
The salary of Priya Sharma has been updated to: 70000

PL/SQL procedure successfully completed.

SQL> SELECT name, salary FROM Employee;

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Rajesh Kumar              90000
Priya Sharma              70000
Vijay Reddy               50000
Lakshmi Iyer              85000
Virat                     50000

6 rows selected.

2.


SQL> SELECT * FROM StockMovement;

MOVEMENT_ID   STORE_ID    PART_ID MOVEMENT_TYPE                    QUANTITY
----------- ---------- ---------- ------------------------------ ----------
MOVEMENT_ REFERENCE
--------- --------------------------------------------------
          1          1        101 IN                                    100
25-FEB-26 Purchase

          2          2        102 OUT                                    20
25-FEB-26 Sale

SQL> DECLARE
  2          v_store_id   StockMovement.store_id%TYPE   := 2;
  3          v_part_id    StockMovement.part_id%TYPE    := 3;
  4          v_qty        StockMovement.quantity%TYPE   := 200;
  5          v_type       StockMovement.movement_type%TYPE := 'IN';
  6          v_ref        StockMovement.reference%TYPE  := 'PO-002';
  7      BEGIN
  8          INSERT INTO StockMovement (movement_id, store_id, part_id, movement_type, quantity, movement_date, reference)
  9              VALUES (3, v_store_id, v_part_id, v_type, v_qty, SYSDATE, v_ref);
 10         DBMS_OUTPUT.PUT_LINE('Stock movement added for Store: ' || v_store_id || ', Part: ' || v_part_id);
 11         COMMIT;
 12     END;
 13     /
Stock movement added for Store: 2, Part: 3

PL/SQL procedure successfully completed.

SQL> SELECT * FROM StockMovement;

MOVEMENT_ID   STORE_ID    PART_ID MOVEMENT_TYPE                    QUANTITY
----------- ---------- ---------- ------------------------------ ----------
MOVEMENT_ REFERENCE
--------- --------------------------------------------------
          1          1        101 IN                                    100
25-FEB-26 Purchase

          2          2        102 OUT                                    20
25-FEB-26 Sale

          3          2          3 IN                                    200
14-MAR-26 PO-002

3.

SQL> DECLARE
  2          v_total_amount NUMBER := 0;
  3      BEGIN
  4          SELECT SUM(amount) INTO v_total_amount
  5          FROM ExpenseRecord
  6          WHERE type = 'Food';
  7          DBMS_OUTPUT.PUT_LINE('Total Maintenance Expense: ' || v_total_amount);
  8          COMMIT;
  9      END;
 10     /
Total Maintenance Expense: 1800

PL/SQL procedure successfully completed.

4.

SQL>  DECLARE
  2          v_employee Employee%ROWTYPE;
  3      BEGIN
  4          SELECT * INTO v_employee FROM Employee WHERE employee_id = 106;
  5          DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || v_employee.name);
  6          DBMS_OUTPUT.PUT_LINE('Role            : ' || v_employee.role);
  7          DBMS_OUTPUT.PUT_LINE('Salary          : ' || v_employee.salary);
  8          DBMS_OUTPUT.PUT_LINE('Email           : ' || v_employee.mail);
  9          DBMS_OUTPUT.PUT_LINE('City            : ' || v_employee.address_city);
 10         DBMS_OUTPUT.PUT_LINE('Phone           : ' || v_employee.phone);
 11     END;
 12     /
Employee Name   : Virat
Role            : Inventory Clerk
Salary          : 50000
Email           : virat@parts.com
City            : VIRUDUNAGAR
Phone           : 9123456718

PL/SQL procedure successfully completed.

5.

SQL>  DECLARE
  2          TYPE employee_record IS RECORD (
  3              name             Employee.name%TYPE,
  4              role             Employee.role%TYPE,
  5              salary           Employee.salary%TYPE,
  6              mail            Employee.mail%TYPE,
  7              address_city     Employee.address_city%TYPE,
  8              address_state    Employee.address_state%TYPE
  9          );
 10          v_emp employee_record;
 11     BEGIN
 12         SELECT name, role, salary, mail, address_city, address_state
 13         INTO v_emp
 14         FROM Employee
 15         WHERE name = 'Virat ';
 16         DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_emp.name);
 17         DBMS_OUTPUT.PUT_LINE('Role          : ' || v_emp.role);
 18         DBMS_OUTPUT.PUT_LINE('Salary        : ' || v_emp.salary);
 19         DBMS_OUTPUT.PUT_LINE('Email         : ' || v_emp.mail);
 20         DBMS_OUTPUT.PUT_LINE('City          : ' || v_emp.address_city);
 21         DBMS_OUTPUT.PUT_LINE('State         : ' || v_emp.address_state);
 22     END;
 23     /
Employee Name : Virat
Role          : Inventory Clerk
Salary        : 50000
Email         : virat@parts.com
City          : VIRUDUNAGAR
State         : Tamil Nadu

PL/SQL procedure successfully completed.

6.

 DECLARE
  2          TYPE supplier_record IS RECORD (
  3              supplier_id       NUMBER,
  4              name              VARCHAR2(30),
  5              address_city      VARCHAR2(50),
  6              address_state     VARCHAR2(30)
  7         );
  8         v_sup supplier_record;
  9     BEGIN
 10         v_sup.supplier_id  := 101;
 11         v_sup.name         := 'RAJA TRADERS';
 12         v_sup.address_city := 'MADURAI';
 13         v_sup.address_state:= 'TAMIL NADU';
 14         DBMS_OUTPUT.PUT_LINE('Supplier ID   : ' || v_sup.supplier_id);
 15         DBMS_OUTPUT.PUT_LINE('Name          : ' || v_sup.name);
 16         DBMS_OUTPUT.PUT_LINE('City          : ' || v_sup.address_city);
 17         DBMS_OUTPUT.PUT_LINE('State         : ' || v_sup.address_state);
 18     END;
 19     /
Supplier ID   : 101
Name          : RAJA TRADERS
City          : MADURAI
State         : TAMIL NADU

PL/SQL procedure successfully completed.

7.

DECLARE
  2          v_emp_name   Employee.name%TYPE;
  3          v_total      SalesOrder.final_amount%TYPE;
  4          CURSOR sales_cursor IS
  5              SELECT e.name, s.final_amount
  6              FROM Employee e
  7              JOIN SalesOrder s ON e.employee_id = s.employee_id
  8              WHERE e.name = 'Rajesh Kumar';
  9      BEGIN
 10         OPEN sales_cursor;
 11         FETCH sales_cursor INTO v_emp_name, v_total;
 12         DBMS_OUTPUT.PUT_LINE('Explicit Cursor - Employee: ' || v_emp_name || ', Final Amount: ' || v_total);
 13         CLOSE sales_cursor;
 14     END;
 15     /
Explicit Cursor - Employee: Rajesh Kumar, Final Amount: 11800

PL/SQL procedure successfully completed.

8.

 DECLARE
  2          v_emp_name   Employee.name%TYPE;
  3          v_total      SalesOrder.final_amount%TYPE;
  4      BEGIN
  5          SELECT e.name, s.final_amount
  6          INTO v_emp_name, v_total
  7          FROM Employee e
  8          JOIN SalesOrder s ON e.employee_id = s.employee_id
  9          WHERE e.name = 'Vijay Reddy';
 10          DBMS_OUTPUT.PUT_LINE('Implicit Cursor - Employee: ' || v_emp_name || ', Final Amount: ' || v_total);
 11     END;
 12     /
Implicit Cursor - Employee: Vijay Reddy, Final Amount: 14160

PL/SQL procedure successfully completed.

9.

 DECLARE
  2          v_emp_name   Employee.name%TYPE;
  3          v_total      SalesOrder.final_amount%TYPE;
  4          CURSOR sales_cursor IS
  5            SELECT e.name, s.final_amount
  6             FROM Employee e
  7              JOIN SalesOrder s ON e.employee_id = s.employee_id;
  8      BEGIN
  9          OPEN sales_cursor;
 10          FETCH sales_cursor INTO v_emp_name, v_total;
 11          IF sales_cursor%FOUND THEN
 12             DBMS_OUTPUT.PUT_LINE('First row fetched - Employee: ' || v_emp_name || ', Amount: ' || v_total);
 13         ELSE
 14             DBMS_OUTPUT.PUT_LINE('No rows found');
 15         END IF;
 16         FETCH sales_cursor INTO v_emp_name, v_total;
 17         IF sales_cursor%FOUND THEN
 18             DBMS_OUTPUT.PUT_LINE('Second row fetched - Employee: ' || v_emp_name || ', Amount: ' || v_total);
 19         ELSE
 20             DBMS_OUTPUT.PUT_LINE('No more rows available');
 21         END IF;
 22         DBMS_OUTPUT.PUT_LINE('Rows fetched so far: ' || sales_cursor%ROWCOUNT);
 23         IF sales_cursor%ISOPEN THEN
 24             DBMS_OUTPUT.PUT_LINE('Cursor is still open');
 25         ELSE
 26             DBMS_OUTPUT.PUT_LINE('Cursor is closed');
 27         END IF;
 28         CLOSE sales_cursor;
 29     END;
 30     /
First row fetched - Employee: Rajesh Kumar, Amount: 11800
Second row fetched - Employee: Rajesh Kumar, Amount: 17700
Rows fetched so far: 2
Cursor is still open

PL/SQL procedure successfully completed.

10.

SQL>  DECLARE
  2          id Employee.employee_id%TYPE;
  3          v_id   Employee.employee_id%TYPE;
  4          v_salary Employee.salary%TYPE;
  5      BEGIN
  6             id :=&id;
  7          SELECT employee_id, salary
  8          INTO v_id, v_salary
  9          FROM Employee
 10          WHERE employee_id = id;
 11
 12         IF v_salary < 60000 THEN
 13             DBMS_OUTPUT.PUT_LINE(v_id || ' has a Low Salary.');
 14         ELSIF v_salary >= 60000 AND v_salary <= 80000 THEN
 15             DBMS_OUTPUT.PUT_LINE(v_id || ' has a Medium Salary.');
 16         ELSE
 17             DBMS_OUTPUT.PUT_LINE(v_id || ' has a High Salary.');
 18         END IF;
 19     END;
 20     /
Enter value for id: 103
old   6:        id :=&id;
new   6:        id :=103;
103 has a Medium Salary.

Enter value for id: 104
old   6:        id :=&id;
new   6:        id :=104;
104 has a Low Salary.

Enter value for id: 105
old   6:        id :=&id;
new   6:        id :=105;
105 has a High Salary.

PL/SQL procedure successfully completed.

11.

 DECLARE
  2          v_num NUMBER := 1;
  3      BEGIN
  4          LOOP
  5              DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
  6              v_num := v_num + 1;
  7              EXIT WHEN v_num > 5;
  8          END LOOP;
  9      END;
 10     /
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5

PL/SQL procedure successfully completed.

12.

 DECLARE
  2     n NUMBER;
  3  BEGIN
  4     n := &n;
  5
  6     FOR v_num IN 1..n LOOP
  7        DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
  8     END LOOP;
  9
 10  END;
 11  /
Enter value for n: 6
old   4:    n := &n;
new   4:    n := 6;
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
Number: 6

PL/SQL procedure successfully completed.

13.

SQL> DECLARE
  2     n NUMBER;
  3  BEGIN
  4     n := &n;   
  5
  6     FOR i IN 1..n LOOP
  7        IF MOD(i,2) = 1 THEN
  8           DBMS_OUTPUT.PUT_LINE('Value of i: ' || i);
  9        END IF;
 10     END LOOP;
 11
 12  END;
 13  /
Enter value for n: 10
old   4:    n := &n;  
new   4:    n := 10;   
Value of i: 1
Value of i: 3
Value of i: 5
Value of i: 7
Value of i: 9

PL/SQL procedure successfully completed.

14.

SQL> DECLARE
  2     n NUMBER;
  3  BEGIN
  4     n := &n;   
  5
  6     FOR v_num IN 1..n LOOP
  7        DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
  8     END LOOP;
  9
 10  END;
 11  /
Enter value for n: 5
old   4:    n := &n;  
new   4:    n := 5;   
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5

PL/SQL procedure successfully completed.

15.

SQL> DECLARE
  2          CURSOR emp_cursor IS
  3             SELECT name FROM Employee;
  4      BEGIN
  5          FOR emp_record IN emp_cursor LOOP
  6              DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_record.name);
  7         END LOOP;
  8      END;
  9      /
Employee Name: Rajesh Kumar
Employee Name: Rajesh Kumar
Employee Name: Priya Sharma
Employee Name: Vijay Reddy
Employee Name: Lakshmi Iyer
Employee Name: Virat

PL/SQL procedure successfully completed.

16.

SQL>  BEGIN
  2          FOR emp_record IN (SELECT name FROM Employee) LOOP
  3              DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_record.name);
  4          END LOOP;
  5      END;
  6      /
Employee Name: Rajesh Kumar
Employee Name: Rajesh Kumar
Employee Name: Priya Sharma
Employee Name: Vijay Reddy
Employee Name: Lakshmi Iyer
Employee Name: Virat

PL/SQL procedure successfully completed.

17.

SQL> DECLARE
  2          v_num NUMBER := 0;
  3      BEGIN
  4          FOR v_num IN 1..10 LOOP
  5              IF v_num = 5 THEN
  6                  CONTINUE;  -- Skip iteration when v_num is 5
  7              END IF;
  8
  9              DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
 10
 11            IF v_num = 8 THEN
 12                 EXIT;  -- Exit loop when v_num is 8
 13             END IF;
 14         END LOOP;
 15     END;
 16     /
Number: 1
Number: 2
Number: 3
Number: 4
Number: 6
Number: 7
Number: 8

PL/SQL procedure successfully completed.

18.

SQL> DECLARE
  2          v_amount ExpenseRecord.amount%TYPE;
  3      BEGIN
  4          SELECT amount INTO v_amount FROM ExpenseRecord WHERE expense_id = 99999; 
  5      EXCEPTION
  6          WHEN NO_DATA_FOUND THEN
  7              DBMS_OUTPUT.PUT_LINE('Error: No expense record found with the provided ID.');
  8      END;
  9      /
Error: No expense record found with the provided ID.

PL/SQL procedure successfully completed.

19.

SQL> SELECT * FROM StockMovement;

MOVEMENT_ID   STORE_ID    PART_ID MOVEMENT_TYPE                    QUANTITY
----------- ---------- ---------- ------------------------------ ----------
MOVEMENT_ REFERENCE
--------- --------------------------------------------------
          1          1        101 IN                                    100
25-FEB-26 Purchase

          2          2        102 OUT                                    20
25-FEB-26 Sale

          3          2          3 IN                                    200
14-MAR-26 PO-002


SQL>  DECLARE
  2          v_qty StockMovement.quantity%TYPE;
  3      BEGIN
  4          SELECT quantity INTO v_qty FROM StockMovement WHERE store_id = 2;  -- Multiple rows
  5      EXCEPTION
  6          WHEN TOO_MANY_ROWS THEN
  7              DBMS_OUTPUT.PUT_LINE('Error: More than one stock movement found for this store.');
  8      END;
  9      /
Error: More than one stock movement found for this store.

PL/SQL procedure successfully completed.

20.

SQL>  DECLARE
  2          v_total_amount   NUMBER := 50000;
  3          v_num_orders     NUMBER := 0;
  4          v_avg_amount     NUMBER;
  5      BEGIN
  6          v_avg_amount := v_total_amount / v_num_orders;
  7          DBMS_OUTPUT.PUT_LINE('Average Order Amount: ' || v_avg_amount);
  8      EXCEPTION
  9          WHEN ZERO_DIVIDE THEN
 10             DBMS_OUTPUT.PUT_LINE('Error: Division by zero - number of orders is zero.');
 11     END;
 12     /
Error: Division by zero - number of orders is zero.

PL/SQL procedure successfully completed.

21.

SQL> DECLARE
  2          v_input   VARCHAR2(10);
  3          v_amount  NUMBER;
  4      BEGIN
  5          v_input  := 'XYZ';
  6          v_amount := TO_NUMBER(v_input);
  7      EXCEPTION
  8          WHEN VALUE_ERROR THEN
  9              DBMS_OUTPUT.PUT_LINE('Error: Invalid value - cannot convert to number.');
 10     END;
 11     /
Error: Invalid value - cannot convert to number.

PL/SQL procedure successfully completed.

22.

SQL>  DECLARE
  2          v_salary Employee.salary%TYPE;
  3      BEGIN
  4          SELECT salary INTO v_salary FROM Employee WHERE employee_id = 99999;
  5      EXCEPTION
  6          WHEN NO_DATA_FOUND THEN
  7              DBMS_OUTPUT.PUT_LINE('No employee found with this ID.');
  8          WHEN OTHERS THEN
  9              DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
 10     END;
 11     /
No employee found with this ID.

PL/SQL procedure successfully completed.

23.

SQL>  DECLARE
  2          e_negative_salary EXCEPTION;
  3          v_salary NUMBER := -5000;  -- Invalid salary
  4      BEGIN
  5          IF v_salary < 0 THEN
  6              RAISE e_negative_salary;
  7          END IF;
  8      EXCEPTION
  9          WHEN e_negative_salary THEN
 10             DBMS_OUTPUT.PUT_LINE('Error: Salary cannot be negative.');
 11     END;
 12     /
Error: Salary cannot be negative.

PL/SQL procedure successfully completed.

24.
SQL> declare
  2            v_id number:=101;
  3            v_name employee.name%type;
  4          begin
  5            while v_id<=105 loop
  6              select name into v_name
  7              from employee where employee_id=v_id;
  8
  9              dbms_output.put_line('employee:'||v_name);
 10            v_id:=v_id+1;
 11          end loop;
 12        end;
 13    /
employee:Rajesh Kumar
employee:Rajesh Kumar
employee:Priya Sharma
employee:Vijay Reddy
employee:Lakshmi Iyer

PL/SQL procedure successfully completed.

25.

SQL> DECLARE
  2         n NUMBER;
  3      BEGIN
  4         n := &n;
  5
  6         FOR i IN reverse 1..n LOOP
  7               DBMS_OUTPUT.PUT_LINE('Value of i: ' || i);
  8        END LOOP;
  9
 10     END;
 11     /
Enter value for n: 5
old   4:        n := &n;
new   4:        n := 5;
Value of i: 5
Value of i: 4
Value of i: 3
Value of i: 2
Value of i: 1

PL/SQL procedure successfully completed.

1)a). Fibonacci Series
SQL> declare
  2  a number := 0;
  3  b number := 1;
  4  c number;
  5  i number := 1;
  6  n number := 10;
  7  begin
  8  dbms_output.put_line(a);
  9  dbms_output.put_line(b);
 10  while i <= n loop
 11  c := a + b;
 12  dbms_output.put_line(c);
 13  a := b;
 14  b := c;
 15  i := i + 1;
 16  end loop;
 17  end;
 18  /
0
1
1
2
3
5
8
13
21
34
55
89

PL/SQL procedure successfully completed.

1)b). odd or even or positive or negative
SQL> declare
  2  n number := &n;
  3  temp number;
  4  rem number;
  5  sum1 number := 0;
  6  begin
  7  if n > 0 then
  8  dbms_output.put_line('positive number');
  9  else
 10  dbms_output.put_line('negative number');
 11  end if;
 12  if mod(n,2)=0 then
 13  dbms_output.put_line('even number');
 14  else
 15  dbms_output.put_line('odd number');
 16  end if;
 17  temp := n;
 18  while temp > 0 loop
 19  rem := mod(temp,10);
 20  sum1 := sum1 + rem*rem*rem;
 21  temp := trunc(temp/10);
 22  end loop;
 23  if sum1 = n then
 24  dbms_output.put_line('armstrong number');
 25  else
 26  dbms_output.put_line('not armstrong');
 27  end if;
 28  end;
 29  /
Enter value for n: 153
old   2: n number := &n;
new   2: n number := 153;
positive number
odd number
armstrong number

PL/SQL procedure successfully completed.

SQL> /
Enter value for n: 222
old   2: n number := &n;
new   2: n number := 222;
positive number
even number
not armstrong

PL/SQL procedure successfully completed.

SQL> /
Enter value for n: -1
old   2: n number := &n;
new   2: n number := -1;
negative number

PL/SQL procedure successfully completed.

SQL> declare
  2    n number := &num;
  3    counter number := 0;
  4  begin
  5    if n <= 1 then
  6      dbms_output.put_line(n || ' is not prime');
  7    else
  8      for i in 2..n/2 loop
  9        if mod(n, i) = 0 then
 10          counter := counter + 1;
 11          exit;
 12        end if;
 13      end loop;
 14
 15      if counter = 0 then
 16        dbms_output.put_line(n || ' is prime');
 17      else
 18        dbms_output.put_line(n || ' is not prime');
 19      end if;
 20    end if;
 21  end;
 22  /
Enter value for num: 32
old   2:   n number := &num;
new   2:   n number := 32;
32 is not prime

PL/SQL procedure successfully completed.

SQL> /
Enter value for num: 43
old   2:   n number := &num;
new   2:   n number := 43;
43 is prime

PL/SQL procedure successfully completed.

SQL> /
Enter value for num: 1
old   2:   n number := &num;
new   2:   n number := 1;
1 is not prime

PL/SQL procedure successfully completed.


2.Declare cursor to count number of employees residing in ‘Chennai’ and earning salary higher than average salary of their departments wit necessary exception handling.
PL/SQL procedure successfully completed.
SQL> declare
  2  cursor c1 is
  3  select emp_id from employee
  4  where lower(emp_address)='Chennai'
  5  and salary > (select avg(salary) from employee);
  6  v_id employee.emp_id%type;
  7  v_count number := 0;
  8  begin
  9  open c1;
 10  loop
 11  fetch c1 into v_id;
 12  exit when c1%notfound;
 13  v_count := v_count + 1;
 14  end loop;
 15  dbms_output.put_line('total employees: '||v_count);
 16  close c1;
 17  exception
 18  when others then
 19  dbms_output.put_line('error occurred');
 20  end;
 21  /
total employees: 3

PL/SQL procedure successfully completed.

3.Declare cursor to retrieve employee whose name starts with ‘R’ and display the values of  cursor attributes 
SQL> declare
  2  cursor c1 is
  3  select * from employee where lower(name) like 'R%';
  4  v_emp employee%rowtype;
  5  begin
  6  open c1;
  7  if c1%isopen then
  8  dbms_output.put_line('cursor is open');
  9  end if;
 10  loop
 11  fetch c1 into v_emp;
 12  exit when c1%notfound;
 13  dbms_output.put_line(v_emp.name);
 14  dbms_output.put_line('rowcount: '||c1%rowcount);
 15  if c1%found then
 16  dbms_output.put_line('record found');
 17  end if;
 18  end loop;
 19  close c1;
 20  end;
 21  /
cursor is open
Rajesh kumar
rowcount: 1
record found
Rajesh kumar
Arowcount: 2
record found



