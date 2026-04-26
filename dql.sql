32.

SQL> SELECT * from employee;

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        101 Rajesh Kumar         9840123456      Store Manager             55000
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
        102 Ramesh Kumar         9123456789      Store Manager             55000
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
        103 Priya         9123456790      Sales Executive           40000
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
        104 Vijay Reddy          9123456791      Inventory Clerk           35000
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
        105 Lakshmi         9123456792      Accounts Manager          50000
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
        106 Virat                9123456718      Inventory Clerk           60000
       101 t nagar
VIRUDUNAGAR                                        Tamil Nadu
virat@parts.com


6 rows selected.

33.

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

34.

SQL> SELECT address_CITY FROM employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

SQL> SELECT distinct address_CITY FROM employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Madurai
VIRUDUNAGAR

35.

SQL> SELECT  address_CITY FROM employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

SQL> SELECT  address_CITY City FROM employee;

CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

36.


SQL> SELECT  address_CITY as City FROM employee;

CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

37.


SQL> SELECT EMPLOYEE_ID, ROLE, SALARY from employee;

EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000

6 rows selected.

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY+10000 from employee;

EMPLOYEE_ID ROLE                 SALARY+10000
----------- -------------------- ------------
        101 Store Manager               65000
        102 Store Manager               65000
        103 Sales Executive             50000
        104 Inventory Clerk             45000
        105 Accounts Manager            60000
        106 Inventory Clerk             70000

6 rows selected.

38.


EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000


SQL> SELECT EMPLOYEE_ID, ROLE, SALARY+10000 Increase_salary from employee;

EMPLOYEE_ID ROLE                 INCREASE_SALARY
----------- -------------------- ---------------
        101 Store Manager                  65000
        102 Store Manager                  65000
        103 Sales Executive                50000
        104 Inventory Clerk                45000
        105 Accounts Manager               60000
        106 Inventory Clerk                70000

6 rows selected.

39.


EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000


SQL> SELECT EMPLOYEE_ID, ROLE, SALARY-10000 decrease_salary from employee;

EMPLOYEE_ID ROLE                 DECREASE_SALARY
----------- -------------------- ---------------
        101 Store Manager                  45000
        102 Store Manager                  45000
        103 Sales Executive                30000
        104 Inventory Clerk                25000
        105 Accounts Manager               40000
        106 Inventory Clerk                50000

6 rows selected.

40.


EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000

SQL> SELECT EMPLOYEE_ID, ROLE, SALARY*2 multiple_salary from employee;

EMPLOYEE_ID ROLE                 MULTIPLE_SALARY
----------- -------------------- ---------------
        101 Store Manager                 110000
        102 Store Manager                 110000
        103 Sales Executive                80000
        104 Inventory Clerk                70000
        105 Accounts Manager              100000
        106 Inventory Clerk               120000

6 rows selected.

41.


EMPLOYEE_ID ROLE                     SALARY
----------- -------------------- ----------
        101 Store Manager             55000
        102 Store Manager             55000
        103 Sales Executive           40000
        104 Inventory Clerk           35000
        105 Accounts Manager          50000
        106 Inventory Clerk           60000


SQL> SELECT EMPLOYEE_ID, ROLE, SALARY/2 div_salary from employee;

EMPLOYEE_ID ROLE                 DIV_SALARY
----------- -------------------- ----------
        101 Store Manager             27500
        102 Store Manager             27500
        103 Sales Executive           20000
        104 Inventory Clerk           17500
        105 Accounts Manager          25000
        106 Inventory Clerk           30000

6 rows selected.

42.

SQL> SELECT NAME||' HAS '||'RS.'||salary FROM employee;

NAME||'HAS'||'RS.'||SALARY
--------------------------------------------------------------------
Rajesh Kumar HAS RS.55000
Ramesh Kumar HAS RS.55000
Priya  HAS RS.40000
Vijay Reddy HAS RS.35000
Lakshmi  HAS RS.50000
Virat  HAS RS.60000

6 rows selected.

43.


SQL> SELECT salary FROM employee;

    SALARY
----------
     90000
     90000
     55000
     50000
     85000
     50000

44.

SQL> SELECT salary FROM employee where salary > 50000;

    SALARY
----------
     90000
     90000
     55000
     85000
45.


SQL> SELECT salary FROM employee where salary = 50000;

    SALARY
----------
     50000
     50000
46.

SQL> SELECT salary FROM employee where salary <= 50000;

    SALARY
----------
     50000
     50000

47.
SQL> SELECT salary FROM employee where salary >= 50000;

    SALARY
----------
     90000
     90000
     55000
     50000
     85000
     50000

6 rows selected.

48.

SQL> SELECT salary FROM employee where salary < 50000;

no rows selected

49.

SQL> SELECT salary FROM employee where salary <> 50000;

    SALARY
----------
     90000
     90000
     55000
     85000
50.

SQL> SELECT salary FROM employee where salary between 45000 and 80000;

    SALARY
----------
     55000
     50000
     50000

51.

SQL> SELECT salary FROM employee where salary not between 45000 and 80000;

    SALARY
----------
     90000
     90000
     85000
52.


SQL> SELECT salary FROM employee where salary >= 45000 and salary <= 85000;

    SALARY
----------
     55000
     50000
     85000
     50000
53.

SQL> SELECT salary FROM employee where salary >= 45000 or salary <= 85000;

    SALARY
----------
     90000
     90000
     55000
     50000
     85000
     50000

54.


SQL> SELECT name,address_city FROM employee WHERE Address_CITY IN('Chennai','Madurai');

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai
Priya                Madurai
Vijay Reddy          Madurai
Lakshmi              Chennai

55.

SQL> SELECT name,address_city FROM employee WHERE Address_CITY not IN('Chennai','Madurai');

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Virat                VIRUDUNAGAR

56.

SQL> SELECT name,address_city FROM employee WHERE Address_CITY like 'Madurai' or address_city like 'Chennai';

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai
Priya                Madurai
Vijay Reddy          Madurai
Lakshmi              Chennai

57.

SQL> SELECT name,address_city FROM employee WHERE Address_CITY like '%d%'; 

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Priya                Madurai
Vijay Reddy          Madurai

58.

SQL> SELECT name,address_city FROM employee WHERE Address_CITY not like '__d%';

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai
Lakshmi              Chennai
Virat                VIRUDUNAGAR

59.

SQL> SELECT salary from employee where salary is not null;

    SALARY
----------
     90000
     90000
     55000
     50000
     85000
     50000

6 rows selected.

60.

SQL>  SELECT LOWER(name),UPPER(name),INITCAP(name) FROM employee;

LOWER(NAME)          UPPER(NAME)          INITCAP(NAME)
-------------------- -------------------- --------------------
rajesh kumar         RAJESH KUMAR         Rajesh Kumar
priya                PRIYA                Priya 
vijay reddy          VIJAY REDDY          Vijay Reddy
lakshmi              LAKSHMI              Lakshmi 
virat                VIRAT                Virat

5 rows selected.

61.


SQL> SELECT INITCAP('MY DEAR STUDENTS') FROM DUAL;

INITCAP('MYDEARS
----------------
My Dear Students

62.

SQL> SELECT CONCAT('MR.',NAME) FROM employee;

CONCAT('MR.',NAME)
-----------------------
MR.Rajesh Kumar
MR.Priya 
MR.Vijay Reddy
MR.Lakshmi 
MR.Virat

5 rows selected.

63

SQL> SELECT CONCAT('DR.',CONCAT('S',CONCAT('.',NAME))) FROM employee;

CONCAT('DR.',CONCAT('S',C
-------------------------
DR.S.Rajesh Kumar
DR.S.Priya 
DR.S.Vijay Reddy
DR.S.Lakshmi 
DR.S.Virat

5 rows selected.

64.


SQL> SELECT CONCAT('DR.',CONCAT('S',CONCAT('.',NAME))) as Formal_name FROM employee;

FORMAL_NAME
-------------------------
DR.S.Rajesh Kumar
DR.S.Priya 
DR.S.Vijay Reddy
DR.S.Lakshmi 
DR.S.Virat

5 rows selected.

65.


SQL> SELECT SUBSTR(NAME,1,3) FROM employee;

SUBSTR(NAME,
------------
Raj
Pri
Vij
Lak
Vir

5 rows selected.

66.

SQL> SELECT SUBSTR(NAME,2,2) FROM employee;

SUBSTR(N
--------
aj
ri
ij
ak
ir

5 rows selected.

67.

SQL> SELECT LENGTH(NAME) FROM employee;

LENGTH(NAME)
------------
          12
          12
          11
          12
           6

5 rows selected.

68.

SQL> SELECT INSTR(NAME,'R') FROM employee;

INSTR(NAME,'R')
---------------
              1
              0
              7
              0
              0

5 rows selected.

69.

SQL> SELECT LPAD(NAME, 20, '*') AS Padded_NAME FROM employee;

PADDED_NAME
--------------------------------------------------------------------------------
********Rajesh Kumar
***************Priya 
*********Vijay Reddy
*************Lakshmi 
***************Virat

5 rows selected.

70.

SQL> SELECT RPAD(NAME, 20, '*') AS Padded_NAME FROM employee;

PADDED_NAME
--------------------------------------------------------------------------------
Rajesh Kumar********
Priya **************
Vijay Reddy*********
Lakshmi ************
Virat **************

5 rows selected.

71.

SQL> SELECT TRIM(NAME) FROM employee;

TRIM(NAME)
--------------------
Rajesh Kumar
ramesh
Priya
Vijay
Lakshmi
Virat

72.

SQL>  SELECT TRIM('      Gopesh       ') FROM dual;

TRIM('
------
Gopesh

73.

SQL>  SELECT RTRIM('      Gopesh       ') FROM dual;

RTRIM('GOPES
------------
      Gopesh

74.

SQL>  SELECT LTRIM('      Gopesh       ') FROM dual;

LTRIM('GOPESH
-------------
Gopesh

75.

SQL> SELECT REPLACE(NAME,'R','A') FROM employee;

REPLACE(NAME,'R','A'
--------------------
Aajesh Kumar
ramesh
Priya
Vijay
Lakshmi
Virat

6 rows selected.

76.


SQL> select name from employee;

NAME
--------------------
Rajesh Kumar
ramesh
Priya
Vijay
Lakshmi
Virat


SQL> SELECT REPLACE(NAME,'ramesh','Rohit') FROM employee;

REPLACE(NAME,'RAMESH','ROHIT')
--------------------------------------------------------------------------------
Rajesh Kumar
Rohit
Priya
Vijay
Lakshmi
Virat

6 rows selected.

77.

SQL> select ASCII(name) from employee;

ASCII(NAME)
-----------
         82
        114
         80
         86
         76
         86

6 rows selected.

78.

SQL> select ASCII('R') from employee;

ASCII('R')
----------
        82
        82
        82
        82
        82
        82

6 rows selected.

79.


SQL> select name,salary from employee;

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Rajesh Kumar              90000
Priya Sharma              55000
Vijay Reddy           70000.483
Lakshmi Iyer          85000.983
Virat                     50000

6 rows selected.

SQL> select ROUND(salary) from employee;

ROUND(SALARY)
-------------
        90000
        90000
        55000
        70000
        85001
        50000

6 rows selected.

80.


SQL> select ROUND(salary,0) from employee;

ROUND(SALARY,0)
---------------
          90000
          90000
          55000
          70000
          85001
          50000

6 rows selected.

81.

SQL> select ROUND(salary,2) from employee;

ROUND(SALARY,2)
---------------
          90000
          90000
          55000
       70000.48
       85000.98
          50000

6 rows selected.

82.


SQL> select ROUND(salary,-1) from employee;

ROUND(SALARY,-1)
----------------
           90000
           90000
           55000
           70000
           85000
           50000

6 rows selected.


83.

SQL> select name,salary from employee;

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Rajesh Kumar              90000
Priya Sharma              55000
Vijay Reddy           70000.483
Lakshmi Iyer          85000.983
Virat                     50000

SQL> select Trunc(salary) from employee;

TRUNC(SALARY)
-------------
        90000
        90000
        55000
        70000
        85000
        50000

6 rows selected.

84.


SQL> select Trunc(salary,1) from employee;

TRUNC(SALARY,1)
---------------
          90000
          90000
          55000
        70000.4
        85000.9
          50000

6 rows selected.

85.

SQL> select Trunc(salary,2) from employee;

TRUNC(SALARY,2)
---------------
          90000
          90000
          55000
       70000.48
       85000.98
          50000

6 rows selected.

86.

SQL> select Trunc(salary,-2) from employee;

TRUNC(SALARY,-2)
----------------
           90000
           90000
           55000
           70000
           85000
           50000

6 rows selected.

87.

SQL> select Trunc(salary,-5) from employee;

TRUNC(SALARY,-5)
----------------
               0
               0
               0
               0
               0
               0

6 rows selected.

88.

SQL> select MOD(salary,5) from employee;

MOD(SALARY,5)
-------------
            0
            0
            0
         .483
         .983
            0

6 rows selected.

89.

SQL> select MOD(salary,3) from employee;

MOD(SALARY,3)
-------------
            0
            0
            1
        1.483
        1.983
            2

6 rows selected.

90.

SQL> select abs(25.6),ceil(25.6),floor(25.6) from dual;

 ABS(25.6) CEIL(25.6) FLOOR(25.6)
---------- ---------- -----------
      25.6         26          25

91.


SQL> select power(2,6),sqrt(64) from dual
  2  ;

POWER(2,6)   SQRT(64)
---------- ----------
        64          8

92.

SQL> select sign(18),sign(-18),sign(0) from dual;

  SIGN(18)  SIGN(-18)    SIGN(0)
---------- ---------- ----------
         1         -1          0

93.

SQL> select ln(2),log(10,1000) from dual;

     LN(2) LOG(10,1000)
---------- ------------
.693147181            3

94.


SQL> SELECT EXP(2) FROM dual;

    EXP(2)
----------
 7.3890561

95.

SQL> SELECT EXP(25.6) FROM dual;

 EXP(25.6)
----------
1.3120E+11

96.


SQL> SELECT GREATEST(18,7,45), LEAST(45.3,7.6,18.9) FROM DUAL;

GREATEST(18,7,45) LEAST(45.3,7.6,18.9)
----------------- --------------------
               45                  7.6

97.

SQL> SELECT DBMS_RANDOM.VALUE FROM dual;

     VALUE
----------
.345727599


SQL> SELECT DBMS_RANDOM.VALUE FROM dual;

     VALUE
----------
.272216046

98.

SQL> select sysdate from dual;

SYSDATE
---------
19-FEB-26

99.

SQL> select CURRENT_date from dual;

CURRENT_D
---------
19-FEB-26

100.

SQL> SELECT CURRENT_TIMESTAMP FROM dual;

CURRENT_TIMESTAMP
---------------------------------------------------------------------------
19-FEB-26 07.07.32.062000 PM +05:30

101.

SQL> select sysdate-5 from dual;

SYSDATE-5
---------
14-FEB-26

102.

SQL> select sysdate+5 from dual;

SYSDATE+5
---------
24-FEB-26

103.

SQL> select sysdate*5 from dual;
select sysdate*5 from dual
       *
ERROR at line 1:
ORA-00932: inconsistent datatypes: expected NUMBER got DATE

104.

SQL>  SELECT SYSDATE - TO_DATE('16-01-26', 'DD-MM-YY') AS day_difference FROM dual;

DAY_DIFFERENCE
--------------
    34.8297338

105.

SQL>  SELECT TRUNC(SYSDATE - TO_DATE('16-01-26', 'DD-MM-YY')) AS day_difference FROM dual;

DAY_DIFFERENCE
--------------
            34
106.

SQL>  SELECT TRUNC(SYSDATE - TO_DATE('16-01-26', 'DD-MM-YY'))/7 AS WEEK_difference FROM dual;

WEEK_DIFFERENCE
---------------
     4.85714286

107.


SQL>  SELECT TRUNC(SYSDATE - TO_DATE('16-01-26', 'DD-MM-YY'))/30 AS MONT_difference FROM dual;

MONT_DIFFERENCE
---------------
     1.13333333

108.

SQL> SELECT TO_DATE('2026-02-21', 'YYYY-MM-DD’) FROM DUAL;

TO_DATE('
---------
21-FEB-26

109.

SQL> SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM dual;

TO_CHAR(SYSDATE,'YY
-------------------
2026-02-19 19:59:29

110.

SQL> SELECT TO_CHAR(SYSDATE, 'YY-MM-DD') FROM dual;

TO_CHAR(
--------
26-02-19

111.


SQL>    SELECT ADD_MONTHS(SYSDATE, 4)  FROM dual
  2  ;

ADD_MONTH
---------
20-JUN-26

112.

SQL> SELECT MONTHS_BETWEEN('01-SEP-26', '11-JAN-25') FROM DUAL;

MONTHS_BETWEEN('01-SEP-26','11-JAN-25')
---------------------------------------
                             19.6774194

113.

SQL> SELECT trunc(MONTHS_BETWEEN('01-SEP-26', '11-JAN-25')) FROM DUAL;

TRUNC(MONTHS_BETWEEN('01-SEP-26','11-JAN-25'))
----------------------------------------------
                                            19

114.


SQL> SELECT round (MONTHS_BETWEEN('01-SEP-26', '11-JAN-25')) FROM DUAL;

ROUND(MONTHS_BETWEEN('01-SEP-26','11-JAN-25'))
----------------------------------------------
                                            20
115.

SQL> SELECT NEXT_DAY(SYSDATE, 'MONDAY’) FROM DUAL;

NEXT_DAY(
---------
23-FEB-26

116.

SQL> SELECT LAST_DAY(SYSDATE) FROM DUAL;

LAST_DAY(
---------
28-FEB-26

117.

SQL> sELECT EXTRACT(DAY FROM SYSDATE) FROM dual;

EXTRACT(DAYFROMSYSDATE)
-----------------------
                     20

118.

SQL> SELECT TO_NUMBER('18745 ') FROM dual;

TO_NUMBER('18745')
------------------
             18745

119.

SQL> select to_char(sysdate,'yyyy') from dual;

TO_C
----
2026

SQL> select to_char(sysdate,'yy') from dual;

TO
--
26

120.


SQL> select to_char(sysdate,'MON') from dual;

TO_CHAR(SYSD
------------
FEB

SQL> select to_char(sysdate,'MONTH') from dual;

TO_CHAR(SYSDATE,'MONTH')
------------------------------------
FEBRUARY

121.

SQL> SELECT NAME, address_CITY, DECODE(address_CITY, 'VIRUDUNAGAR', 'RURAL', 'Madurai','METRO','OTHER') AS DECODE FROM employee;

NAME                 ADDRESS_CITY                                       DECOD
-------------------- -------------------------------------------------- -----
Rajesh Kumar         Chennai                                            OTHER
Rajesh Kumar         Chennai                                            OTHER
Priya Sharma         Madurai                                            METRO
Vijay Reddy          Madurai                                            METRO
Lakshmi Iyer         Chennai                                            OTHER
Virat                VIRUDUNAGAR                                        RURAL

6 rows selected.

122.

SQL> SELECT COUNT(*) FROM EMPLOYEE;

  COUNT(*)
----------
         6

123.


SQL> SELECT AVG(SALARY) FROM EMPLOYEE;

AVG(SALARY)
-----------
      70000
124.

SQL> SELECT SUM(SALARY) FROM EMPLOYEE;

SUM(SALARY)
-----------
     420000

125.


SQL> SELECT MIN(SALARY) FROM EMPLOYEE;

MIN(SALARY)
-----------
      50000

SQL> SELECT MAX(SALARY) FROM EMPLOYEE;

MAX(SALARY)
-----------
      90000

126.


SQL> SELECT MEDIAN(SALARY) FROM EMPLOYEE;

MEDIAN(SALARY)
--------------
         70000

SQL> SELECT VARIANCE(SALARY) FROM EMPLOYEE;

VARIANCE(SALARY)
----------------
       410000000

SQL> SELECT STDDEV(SALARY) FROM EMPLOYEE;

STDDEV(SALARY)
--------------
    20248.4567

127.


SQL> SELECT EMPLOYEE_ID,NAME FROM EMPLOYEE ORDER BY NAME;

EMPLOYEE_ID NAME
----------- --------------------
        105 Lakshmi 
        103 Priya 
        101 Rajesh Kumar
        102 RAMESH Kumar
        104 Vijay Reddy
        106 Virat

6 rows selected.

128.

SQL> SELECT EMPLOYEE_ID,NAME FROM EMPLOYEE ORDER BY NAME ASC;

EMPLOYEE_ID NAME
----------- --------------------
        105 Lakshmi
        103 Priya 
        101 Rajesh Kumar
        102 RAMESH Kumar
        104 Vijay Reddy
        106 Virat

6 rows selected.

SQL> SELECT EMPLOYEE_ID,NAME FROM EMPLOYEE ORDER BY NAME DESC;

EMPLOYEE_ID NAME
----------- --------------------
        106 Virat
        104 Vijay Reddy
        101 Rajesh Kumar
        102 RAMESH Kumar
        103 Priya 
        105 Lakshmi 

6 rows selected.

129.

SQL> SELECT EMPLOYEE_ID,NAME,SALARY FROM EMPLOYEE ORDER BY NAME,SALARY DESC;

EMPLOYEE_ID NAME                     SALARY
----------- -------------------- ----------
        105 Lakshmi                   85000
        103 Priya                     55000
        101 Rajesh Kumar              90000
        102 Ramesh Kumar              90000
        104 Vijay Reddy               50000
        106 Virat                     50000

6 rows selected.

130.


SQL> SELECT NAME FROM employee GROUP BY NAME;

NAME
--------------------
Rajesh Kumar
Priya 
Vijay Reddy
Lakshmi 
Virat

131.


SQL> SELECT address_CITY,COUNT(*) FROM employee GROUP BY address_CITY;

ADDRESS_CITY                                         COUNT(*)
-------------------------------------------------- ----------
Chennai                                                     3
Madurai                                                     2
VIRUDUNAGAR                                                 1

132.


SQL> SELECT address_CITY,MIN(salary) FROM employee GROUP BY address_CITY;

ADDRESS_CITY                                       MIN(SALARY)
-------------------------------------------------- -----------
Chennai                                                  85000
Madurai                                                  50000
VIRUDUNAGAR                                              50000

133.

SQL>  SELECT ADDRESS_CITY, SUM(salary) AS TOTAL_SALARY FROM employee GROUP BY address_CITY HAVING SUM(salary) >= 200000;

ADDRESS_CITY                                       TOTAL_SALARY
-------------------------------------------------- ------------
Chennai                                                  265000

134.

SQL>  SELECT ADDRESS_CITY, SUM(salary) AS TOTAL_SALARY FROM employee GROUP BY address_CITY
  2  ;

ADDRESS_CITY                                       TOTAL_SALARY
-------------------------------------------------- ------------
Chennai                                                  265000
Madurai                                                  105000
VIRUDUNAGAR                                               50000

135.


SQL> SELECT ADDRESS_CITY, ROLE, COUNT(*) AS TOTAL_EMPLOYEES
  2  FROM EMPLOYEE
  3  GROUP BY ADDRESS_CITY, ROLE
  4  ORDER BY ADDRESS_CITY;

ADDRESS_CITY                                       ROLE
-------------------------------------------------- --------------------
TOTAL_EMPLOYEES
---------------
Chennai                                            Senior Staff
              3

Madurai                                            Senior Staff
              2

VIRUDUNAGAR                                        Inventory Clerk
              1

136.

SQL> SELECT EMPLOYEE_ID, NAME, ADDRESS_CITY, SALARY
  2  FROM EMPLOYEE
  3  ORDER BY ADDRESS_CITY ASC, SALARY DESC;

EMPLOYEE_ID NAME
----------- --------------------
ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
        101 Rajesh Kumar
Chennai                                                 90000

        102 Rajesh Kumar
Chennai                                                 90000

        105 Lakshmi Iyer
Chennai                                                 85000


EMPLOYEE_ID NAME
----------- --------------------
ADDRESS_CITY                                           SALARY
-------------------------------------------------- ----------
        103 Priya Sharma
Madurai                                                 55000

        104 Vijay Reddy
Madurai                                                 50000

        106 Virat
VIRUDUNAGAR                                             50000


6 rows selected.

137.

SQL> SELECT ROLE, AVG(SALARY) AS AVG_SALARY
  2  FROM EMPLOYEE
  3  GROUP BY ROLE
  4  HAVING AVG(SALARY) > 60000;

ROLE                 AVG_SALARY
-------------------- ----------
Senior Staff              74000


138.

SQL> SELECT SYSDATE FROM ExpenseRecord;

SYSDATE
---------
21-FEB-26
21-FEB-26
21-FEB-26
21-FEB-26

139.

SQL> SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD')
  2  FROM ExpenseRecord;

TO_CHAR(SY
----------
2026-02-21
2026-02-21
2026-02-21
2026-02-21

140.

SQL> SELECT expense_id,
  2         expense_date,
  3         ADD_MONTHS(expense_date, 2) AS NEXT_PAYMENT_DATE
  4  FROM ExpenseRecord;

EXPENSE_ID EXPENSE_D NEXT_PAYM
---------- --------- ---------
         1 01-FEB-25 01-APR-25
         2 03-FEB-25 03-APR-25
         3 05-FEB-25 05-APR-25
         4 06-FEB-25 06-APR-25

141.

SQL> SELECT expense_id,
  2         expense_date,
  3         TRUNC(SYSDATE - expense_date) AS DAYS_DIFFERENCE
  4  FROM ExpenseRecord;

EXPENSE_ID EXPENSE_D DAYS_DIFFERENCE
---------- --------- ---------------
         1 01-FEB-25             385
         2 03-FEB-25             383
         3 05-FEB-25             381
         4 06-FEB-25             380

142.

SQL> SELECT expense_id,
  2         EXTRACT(YEAR FROM expense_date) AS YEAR
  3  FROM ExpenseRecord;

EXPENSE_ID       YEAR
---------- ----------
         1       2025
         2       2025
         3       2025
         4       2025

143.

SQL> SELECT expense_id,
  2         EXTRACT(MONTH FROM expense_date) AS MONTH
  3  FROM ExpenseRecord;

EXPENSE_ID      MONTH
---------- ----------
         1          2
         2          2
         3          2
         4          2

144.


SQL> SELECT expense_id,
  2         EXTRACT(DAY FROM expense_date) AS DAY
  3  FROM ExpenseRecord;

EXPENSE_ID        DAY
---------- ----------
         1          1
         2          3
         3          5
         4          6

145.

SQL> SELECT expense_id,
  2         TO_CHAR(expense_date,'YYYY') AS YEAR
  3  FROM ExpenseRecord;

EXPENSE_ID YEAR
---------- ----
         1 2025
         2 2025
         3 2025
         4 2025

146.


SQL> SELECT expense_id,
  2         TO_CHAR(expense_date,'MM') AS MONTH
  3  FROM ExpenseRecord;

EXPENSE_ID MO
---------- --
         1 02
         2 02
         3 02
         4 02

147.


SQL> SELECT expense_id,
  2         TO_CHAR(expense_date,'DD') AS DAY
  3  FROM ExpenseRecord;

EXPENSE_ID DA
---------- --
         1 01
         2 03
         3 05
         4 06
148.

