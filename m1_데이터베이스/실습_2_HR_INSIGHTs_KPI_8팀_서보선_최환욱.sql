---------------------- Entities: EMPLOYEES,DEPARTMENTS,JOBS,JOB_HISTORY,LOCATIONS,COUNTRIES,REGIONS
---------------------- Attributes:  
-- EMPLOYEES: EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
-- DEPARTMENTS: DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
-- JOBS: JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
-- JOB_HISTORY: EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID
-- LOCATIONS: LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID
-- COUNTRIES: COUNTRY_ID, COUNTRY_NAME, COUNTRY_NAME, REGION_ID
-- REGIONS: REGION_ID, REGION_NAME

-- �ǽ�
-- ���� hr�� �ִ� 7�� ���̺��� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5�� �̻��� ����ϼ���
-- �λ���� ������ ���� KPI 2���� �����ϰ� �̰͵��� ���̺��� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� �����ϼ���

-- VIEW POINTS: (1) �λ� DB ���� ���� (DATA �� CONSISTENCY ISSUE, ����� DATA Ȯ�� ����) 
--              (2) �η� ����/�� ���� (����, ���� ��ǥ ��ǥ �޼� MONITORING)���� ������
--              (3) ���� ���� ���/����� ��ȭ�� ���� �λ���� SYSTEM�� ���࿡ �ʿ��� ������
--              (4) GREAT WORK PLACE(GWP), WORK-LIFE BALANCE�� ���� HR-DB�� �λ� ����

-- INSIGHT-1 : �λ� DB ���� ���鿡�� ���� 7���� EMPLOYEES,DEPARTMENTS,JOBS,JOB_HISTORY,LOCATIONS,COUNTRIES,REGIONS TABLE�� ������ REDUNDANCY�� ���� ��ȿ���� 
            -- ROCATION/CONTRY/REGION �� �� TABLE�� ���հ����ϴ°� ȿ����, EMPLOYEES/DEPARTMENT�� �Ϻ� �ߺ� ��Ҹ� EMPLOYEES�� ���� ������ �ʿ䰡 ����
            -- TABLE �� PRIMARY/FOREIGN KEY ���Ӽ� �ο� �ʿ�

-- INSIGHT-2 : DATA�� INCONSISTENCY ISSUE & REDUDANCY ����
            -- (EMPLOYEES ���̺��� MANAGER_ID�� EMPLOYEES ���̺� ���κ��� ASSIGN�� DEPARTMENT_ID�� DEPARTMENTS ���̺����� DEPARTMENT�� MANAGER_ID�� �̽���ġ 
            -- �μ� ASSIGN�� �ȵ� ���� (KIMBERELY GRANT)
            -- DEPARTMENTS���� DEPARTMENT_ID: 120~270�� ���� MANAGER�� ASSIGN �ȵ� (�μ����� ���� ���� �ʾƼ� ������ ���� ������, �׷����� REDUNDANT DATA)
            -- ���� �ڵ��� ��ȣ�� INVALID FORMAT�� ��ȭ ��ȣ �̱�: XXX.XXX.XXXX (O), ����: (0XX(X).XXX(X).XXXX TYPE), 

-- INSIGHT-3 : �η� ����/�� ���� HR �μ� MANDATORY DB�� ����
            -- (����) ���� ���� DB BUILDING�� �ʿ�
            -- (����) ���� �ٹ���, �׿� �ٹ��� ���� SYSTEM �ʿ� ==> �η� ������
            -- (����) HR�� �ٽ�: �η� Ȯ��/����. �׷� �ǹ̿��� ����ڵ鿡���� ������ ���� (JOB-HISTORY, �������� �м�, �ټ�,�μ�,����, ����,..)
            -- (��) ���� ���� DB BUILDING�� �ʿ� (���κ� ==> INDIVIDUAL_PERF, �μ���: DEPARTMENTS==> DEPARTMENT_PERF)
            -- (��) ���� (���� ������, ������, �μ���, ������,..) SALARY �м� ���� �ʿ�
            
-- INSIGHT-4 : ������ ���� ��ȭ�� ���� ���� DB�� ����            
            -- ������ �����鿡 ���� ���� SKILL-UP ��ȸ ����: 
            -- ������(��������)�� ���� ����/MENTORING ���� (MENTOR:��������/����, MENTEE: ������)
            -- ���� ������ ���� ������ ���� COMMISSION PERCENT�� SALES �μ����� å��
            
-- INSIGHT-5 : GREAT WORK PLACE (GWP), WORK - LIFE BALANCE�� ���� HR-DB�� ���� ���α׷� ����(ȸ��/������ ���Ӽ�/����)
            -- ������ �ǰ� (����/����/����/�μ� STRESS...) ���� DB�� ����
            -- �ٹ� �ð� ���� DB(���κ�/�μ��� �η� ��� �ٹ��ð� BALANCE ������ ���� DB)
            -- HR �μ����� ���/�����ǰ�/����... ���α׷� ����/���� 

-- REMARKS: DB�� DATA�� INCONSISTENCY ISSUE �߿伺

--------------------------------------------- KPI (Key Performance Indicator/index) ---------------------------------------------
-- Key: (1) �߿伺, (2) ���� ������ ������ ��ǥ, (3) �ñ⺰ ���� ����

-- KPI-1 : (1-1) DEFECT FREE DB�� ����(KPI INDEX: DEFECT�� �޼��� -2%): DB�� REDUNDANCY ����, ���� TABLE�� COMPACT�ϰ� ����, DATA INCONSISTENCY ����
              -- EMPLOYEES&(DEPARTMENT �Ϻ� �Ӽ�) ==> EMPLOYEES_NEW TABLE
              -- LOCATIONS/COUNTRIES/REGIONS ==> LOCATIONS ���� ����
              -- PRIMARY/FOREIGN KEY ����
        -- (1-2) �λ���� �������� �ű� DATA TABLE ����/����
              -- ���� (TA_MANAGEMENT), ���� (INDIVIDUAL_PERF,DEPARTMENTS==>DEPARTMENT_PERF), ������(RESIGNEE) ���� DB TABLE ����
              
-- KPI-2 : ���� �ڿ� ������ ���� (KPI INDEX: �ٹ�������,�νǱ����� ZERO ���� (���� ��� -10% �� 100% �޼�, �������� �ʿ��� ���� ��� -5%�� 100%�޼�)
              -- ���� (TA_MANAGEMENT) DB ==> ���� ==> �ٹ� ������, �ν� ������ ���� ==> ���� BALANCE/�μ� ����, ��� ���α׷� �ǰ�
              -- ��ǥ ��� ���� ���� (����/�μ� �ջ�) DB ==> ���� ==> ���(INCENTIVE �ο�)�� ����
              -- ���� �����ڸ� ���� ���� ���α׷� �� MENTOR/MENTEE ���α׷� ��ȹ/ ����� ����.
              -- �ǰ� ���� / ��� ���� DB ==> �λ� Ư���� �߱�


--------------------------------------------------------------------------------- FLATTEN ALL DB TO REVIEW DATA CONSISTENCY
DROP VIEW EMPLOYEES_NEW;
DROP TABLE EMPLOYEES_NEW;
CREATE VIEW EMPLOYEES_NEW AS
SELECT 
    E.EMPLOYEE_ID ���,
    E.FIRST_NAME || ' ' || E.LAST_NAME �̸�,
    E.EMAIL �̸���,
    E.PHONE_NUMBER �ڵ�����ȣ,
    E.HIRE_DATE �Ի�����,
    FLOOR(MONTHS_BETWEEN(SYSDATE, E.HIRE_DATE) / 12) ����,
    E.SALARY �޿�,
    CASE WHEN E.SALARY BETWEEN J.MIN_SALARY AND J.MAX_SALARY THEN 'IN_RANGE' ELSE 'OUT_RANGE' END AS �޿�����,
    DECODE(E.COMMISSION_PCT, NULL, 'N', E.COMMISSION_PCT) ���⼺��,
    E.JOB_ID  ������,
    E.MANAGER_ID ���Ŵ���ID,
    M.FIRST_NAME || ' ' || M.LAST_NAME AS ���Ŵ���,
    E.DEPARTMENT_ID �μ�ID,
    D.DEPARTMENT_NAME �μ���,
    D.MANAGER_ID ���Ŵ���ID2,
    DECODE(E.MANAGER_ID, D.MANAGER_ID, '����', '������') AS �Ŵ������ռ�,
    L.CITY �ٹ�����,
    C.COUNTRY_ID �ٹ�����,
    R.REGION_NAME �ٹ����
FROM 
    EMPLOYEES E
LEFT JOIN 
    EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
LEFT JOIN 
    DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN
    JOBS J ON E.JOB_ID = J.JOB_ID
LEFT JOIN
    LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
LEFT JOIN
    COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID    
LEFT JOIN
    REGIONS R ON C.REGION_ID = R.REGION_ID        
ORDER BY E.EMPLOYEE_ID;
-------------------------------------------------------------------------------------
SELECT * FROM EMPLOYEES_NEW;
        -- ���Ŵ���ID VS. ���Ŵ���ID2 ���� ������ �����ռ� Ȯ��
        -- ��� �λ� ���� DB���� �ܼ� ������ ������ �־� 1~2���� DB�� ���� �����ϴ� ���� ȿ������
        -- DEPARTMENTS���� DEPARTMENT_ID: 120~270�� ���� MANAGER�� ASSIGN �ȵ� (�μ����� ���� ���� �ʾƼ� ������ ���� ������, �׷����� REDUNDANT DATA) Ȯ��

SELECT * FROM EMPLOYEES_NEW 
WHERE �μ��� IS NULL;            

            -- ���� �ڵ��� ��ȣ�� INVALID FORMAT�� ��ȭ ��ȣ �̱�: XXX.XXX.XXXX (O), ����: (0XX(X).XXX(X).XXXX TYPE) Ȯ��
SELECT 
    ���,�̸�,�ڵ�����ȣ,�ٹ����,
    CASE
        WHEN �ٹ���� = 'Europe' AND (REGEXP_LIKE(�ڵ�����ȣ, '^0[0-9]{2}\.[0-9]{4}\.[0-9]{4}$') OR REGEXP_LIKE(�ڵ�����ȣ, '^0[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')) THEN 'PASS'
        WHEN �ٹ���� = 'Americas' AND REGEXP_LIKE(�ڵ�����ȣ, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 'PASS'
        ELSE 'FAIL'
    END AS VALID_HP
FROM 
    EMPLOYEES_NEW;

---------------------------------------------------------- �޿� �� ---------------------------------------------------------------------
SELECT 
    ���, 
    �̸�, 
    ����, 
    �޿�,
    ������, 
    �μ���, 
    �ٹ�����, 
    �ٹ�����, 
    �ٹ����,
    ROUND(AVG(�޿�) OVER (PARTITION BY ����)) AS ��������ձ޿�,
    ROUND(AVG(�޿�) OVER (PARTITION BY ������)) AS ����������ձ޿�,
    ROUND(AVG(�޿�) OVER (PARTITION BY �μ���)) AS �μ�����ձ޿�,
    ROUND(AVG(�޿�) OVER (PARTITION BY �ٹ�����)) AS �ٹ����ú���ձ޿�,
    ROUND(AVG(�޿�) OVER (PARTITION BY �ٹ�����)) AS �ٹ���������ձ޿�,
    ROUND(AVG(�޿�) OVER (PARTITION BY �ٹ����)) AS �ٹ��������ձ޿�
FROM 
    EMPLOYEES_NEW;

---------------------------------------------------------- ������ �� �� ---------------------------------------------------------------------
-- ������
SELECT ����, COUNT(*) �������� FROM EMPLOYEES_NEW
GROUP BY ����
ORDER BY ��������;

-- �μ���
SELECT �μ���, COUNT(*) �������� FROM EMPLOYEES_NEW
GROUP BY �μ���
ORDER BY ��������;

-- ���ú�
SELECT �ٹ�����, COUNT(*) �������� FROM EMPLOYEES_NEW
GROUP BY �ٹ�����
ORDER BY ��������;

-- ������
SELECT �ٹ�����, COUNT(*) �������� FROM EMPLOYEES_NEW
GROUP BY �ٹ�����
ORDER BY ��������;

-- �����
SELECT �ٹ����, COUNT(*) �������� FROM EMPLOYEES_NEW
GROUP BY �ٹ����
ORDER BY ��������;

---------------------------------------------------------- ��� ���� �� ---------------------------------------------------------------------
-- ������
SELECT ����, ROUND(AVG(�޿�)) ��տ��� FROM EMPLOYEES_NEW
GROUP BY ����
ORDER BY ��տ���;

-- �μ���
SELECT �μ���, ROUND(AVG(�޿�)) ��տ��� FROM EMPLOYEES_NEW
GROUP BY �μ���
ORDER BY ��տ���;

-- ���ú�
SELECT �ٹ�����, ROUND(AVG(�޿�)) ��տ��� FROM EMPLOYEES_NEW
GROUP BY �ٹ�����
ORDER BY ��տ���;

-- ������
SELECT �ٹ�����, ROUND(AVG(�޿�)) ��տ��� FROM EMPLOYEES_NEW
GROUP BY �ٹ�����
ORDER BY ��տ���;

-- �����
SELECT �ٹ����, ROUND(AVG(�޿�)) ��տ��� FROM EMPLOYEES_NEW
GROUP BY �ٹ����
ORDER BY ��տ���;

-------------------------------------------------------------------------------
DROP VIEW EMPLOYEES_NEW;
DROP TABLE EMPLOYEES_NEW CASCADE CONSTRAINTS PURGE;
--------------------------------------------------------------- VIEW�� �ƴ� ���� NEW TABLE�� ����
-- EMPLOYEES_NEW ���̺� ����
CREATE TABLE EMPLOYEES_NEW (
    EMPLOYEE_ID NUMBER,
    NAME VARCHAR2(100),
    EMAIL VARCHAR2(100),
    PHONE_NUMBER VARCHAR2(20),
    HIRE_DATE DATE,
    WORK_YEAR NUMBER,
    SALARY NUMBER,
    COMMISSION_PCT VARCHAR2(10),
    JOB_ID VARCHAR2(100),
    MANAGER_ID NUMBER,
    DEPARTMENT_ID NUMBER,
    DEPARTMENT_NAME VARCHAR2(100),
    ���Ŵ���ID2 NUMBER,
    CITY VARCHAR2(100),
    COUNTRY_ID VARCHAR2(2),
    REGION_NAME VARCHAR2(100)
);

-- EMPLOYEES_NEW�� ������ INSERT
INSERT INTO EMPLOYEES_NEW (
    EMPLOYEE_ID,
    NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    WORK_YEAR,
    SALARY,
    COMMISSION_PCT,
    JOB_ID,
    MANAGER_ID,
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    ���Ŵ���ID2,
    CITY,
    COUNTRY_ID,
    REGION_NAME
)
SELECT 
    E.EMPLOYEE_ID,
    E.FIRST_NAME || ' ' || E.LAST_NAME,
    E.EMAIL,
    E.PHONE_NUMBER,
    E.HIRE_DATE,
    FLOOR(MONTHS_BETWEEN(SYSDATE, E.HIRE_DATE) / 12),
    E.SALARY,
    DECODE(E.COMMISSION_PCT, NULL, 'N', E.COMMISSION_PCT),
    E.JOB_ID,
    E.MANAGER_ID,
    E.DEPARTMENT_ID,
    D.DEPARTMENT_NAME,
    D.MANAGER_ID,
    L.CITY,
    C.COUNTRY_ID,
    R.REGION_NAME
FROM 
    EMPLOYEES E
LEFT JOIN 
    EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
LEFT JOIN 
    DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN
    JOBS J ON E.JOB_ID = J.JOB_ID
LEFT JOIN
    LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
LEFT JOIN
    COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID    
LEFT JOIN
    REGIONS R ON C.REGION_ID = R.REGION_ID;

SELECT * FROM EMPLOYEES_NEW ORDER BY EMPLOYEE_ID;

------------------------------------------------------------- INVALID TYPE ��ȭ ��ȣ ����
UPDATE EMPLOYEES_NEW
SET PHONE_NUMBER = 
    CASE 
        WHEN REGION_NAME = 'Europe' THEN 
            CASE 
                WHEN REGEXP_LIKE(PHONE_NUMBER, '^0[0-9]{2}\.[0-9]{4}\.[0-9]{4}$') OR 
                     REGEXP_LIKE(PHONE_NUMBER, '^0[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 
                         PHONE_NUMBER
                ELSE
                    '0' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0')
            END
        WHEN REGION_NAME = 'Americas' THEN 
            CASE 
                WHEN REGEXP_LIKE(PHONE_NUMBER, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 
                    PHONE_NUMBER
                ELSE
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0')
            END
    END;

SELECT * FROM EMPLOYEES_NEW ORDER BY EMPLOYEE_ID;
------------------------------------------------------------- �Ŵ��������� ����
UPDATE EMPLOYEES_NEW SET MANAGER_ID = ���Ŵ���ID2;
ALTER TABLE EMPLOYEES_NEW DROP COLUMN ���Ŵ���ID2;
------------------------------------------------------------- �μ� ���� ���� (KIMBERELY GRANT) DATA ����
UPDATE EMPLOYEES_NEW
SET 
    MANAGER_ID = 145,
    DEPARTMENT_ID = 80,
    DEPARTMENT_NAME = 'Sales',
    CITY = 'Oxford',
    COUNTRY_ID = 'UK',
    REGION_NAME = 'Europe'
WHERE EMPLOYEE_ID = 178;


------------------------------------------------- �λ� ���� ��/������ ���� INDIVIDUAL_PERF ���̺� ����
DROP TABLE INDIVIDUAL_PERF CASCADE CONSTRAINTS PURGE;
CREATE TABLE INDIVIDUAL_PERF (
    EMPLOYEE_ID NUMBER,
    NAME VARCHAR2(100),
    SALARY NUMBER,
    NEXT_YEAR_SALARY NUMBER,
    ACHIEVEMENT_VERSUS_GOAL NUMBER,
    LAST_YEAR_GRADE VARCHAR2(100),
    GRADE VARCHAR2(100),
    ENHANCEMENT_PROGRAM VARCHAR2(100),
    MENTOR VARCHAR2(100),
    MENTEE VARCHAR2(100)
);

-- EMPLOYEES ���̺�κ��� ������ ����
INSERT INTO INDIVIDUAL_PERF (EMPLOYEE_ID, NAME, SALARY)
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, SALARY
FROM EMPLOYEES;

-- ������ �÷��� NULL�� �ʱ�ȭ
UPDATE INDIVIDUAL_PERF
SET NEXT_YEAR_SALARY = NULL,
    ACHIEVEMENT_VERSUS_GOAL = NULL,
    LAST_YEAR_GRADE = NULL,
    GRADE = NULL,
    ENHANCEMENT_PROGRAM = NULL,
    MENTOR = NULL,
    MENTEE = NULL;


SELECT * FROM INDIVIDUAL_PERF ORDER BY EMPLOYEE_ID;

-- EMPLOYEES_NEW TABLE������ �ܼ� �λ� ��ϸ� �����ϰ� ���,�޿� ������ INDIVIDUAL_PERF TABLE�� 
ALTER TABLE EMPLOYEES_NEW DROP COLUMN SALARY;

-- ��ǥ����뵵�� �����ϰ� ������Ʈ
UPDATE INDIVIDUAL_PERF
SET ACHIEVEMENT_VERSUS_GOAL = FLOOR(DBMS_RANDOM.VALUE(60, 121));
SELECT * FROM INDIVIDUAL_PERF ORDER BY EMPLOYEE_ID;

-- ���⵵�򰡸� �����ϰ� ������Ʈ
UPDATE INDIVIDUAL_PERF
SET LAST_YEAR_GRADE = 
    CASE 
        WHEN DBMS_RANDOM.VALUE(0, 100) <= 10 THEN 'A'
        WHEN DBMS_RANDOM.VALUE(0, 100) <= 20 THEN 'B'
        WHEN DBMS_RANDOM.VALUE(0, 100) <= 95 THEN 'C'
        ELSE 'D'
    END;
    
-- ���� �λ� ����� �����ϰ� ������Ʈ
UPDATE INDIVIDUAL_PERF
SET GRADE = 
    CASE 
        WHEN DBMS_RANDOM.VALUE(0, 100) <= 10 THEN 'A'
        WHEN DBMS_RANDOM.VALUE(0, 100) <= 20 THEN 'B'
        WHEN DBMS_RANDOM.VALUE(0, 100) <= 95 THEN 'C'
        ELSE 'D'
    END;
    
    
-- NEXT_YEAR_SALARY�� ������Ʈ�ϴ� �ڵ� ���� �λ����� �������� A/B/C/D�� ���� ���� X 1.2, 1.1, 1, 0.9
UPDATE INDIVIDUAL_PERF
SET NEXT_YEAR_SALARY = 
    CASE 
        WHEN GRADE = 'A' THEN SALARY * 1.2
        WHEN GRADE = 'B' THEN SALARY * 1.1
        WHEN GRADE = 'C' THEN SALARY * 1
        WHEN GRADE = 'D' THEN SALARY * 0.9
    END;
    
SELECT * FROM INDIVIDUAL_PERF ORDER BY EMPLOYEE_ID;


------------------------------------------------------------------ LOCATIONS_NEW ���̺� ����
DROP TABLE LOCATIONS_NEW CASCADE CONSTRAINTS PURGE;
CREATE TABLE LOCATIONS_NEW (
    REGION_ID NUMBER 
    ,REGION_NAME VARCHAR2(25)
    ,COUNTRY_ID CHAR(2)
    ,COUNTRY_NAME VARCHAR2(40)
    ,LOCATION_ID	NUMBER(4,0) PRIMARY KEY
    ,STREET_ADDRESS	VARCHAR2(40 BYTE)
    ,POSTAL_CODE	VARCHAR2(12 BYTE)
    ,CITY	VARCHAR2(30 BYTE)
    ,STATE_PROVINCE	VARCHAR2(25 BYTE)
);

-- ���̺� �� ���� ��ȸ
SELECT
    r.region_id
    ,r.region_name
    ,c.country_id
    ,c.country_name
    ,l.location_id
    ,l.street_address
    ,l.postal_code
    ,l.city
    ,l.state_province
FROM
    regions r
    ,countries c
    ,locations l
WHERE
    r.region_id = c.region_id
    AND c.country_id = l.country_id
ORDER BY
    r.region_id
    ,c.country_id
    ,l.location_id
;

-- ��ȸ�� ������ ���̺� ����
INSERT INTO 
    LOCATIONS_NEW 
SELECT
    r.region_id
    ,r.region_name
    ,c.country_id
    ,c.country_name
    ,l.location_id
    ,l.street_address
    ,l.postal_code
    ,l.city
    ,l.state_province
FROM
    regions r
    ,countries c
    ,locations l
WHERE
    r.region_id = c.region_id
    AND c.country_id = l.country_id
ORDER BY
    r.region_id
    ,c.country_id
    ,l.location_id
        
;

SELECT * FROM LOCATIONS_NEW;

---------------------------------------------- ���� ���̺� ����
DROP TABLE WELFARE CASCADE CONSTRAINTS PURGE;
CREATE TABLE WELFARE (
    EMPLOYEE_ID NUMBER,
    NAME VARCHAR2(100),
    MEDICAL_CHECK VARCHAR2(50),
    REMARKS VARCHAR2(100)
);

-- EMPLOYEES_NEW TABLE�κ��� ������ ����
INSERT INTO WELFARE (EMPLOYEE_ID, NAME, MEDICAL_CHECK, REMARKS)
SELECT EMPLOYEE_ID, NAME, 'DONE', NULL
FROM EMPLOYEES_NEW;

SELECT * FROM WELFARE ORDER BY EMPLOYEE_ID;


------------------------------------------------------------------- ���� ���̺� ����   
DROP TABLE TA_MANAGEMENT CASCADE CONSTRAINTS PURGE;
CREATE TABLE TA_MANAGEMENT(
    EMPLOYEE_ID NUMBER
    ,WORK_YEAR VARCHAR2(4) 
    ,ABSENCE_DAYS NUMBER
    ,AVG_WORK_HOURS_PER_WEEK NUMBER
    ,FOREIGN KEY (EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID) ON DELETE CASCADE
);

INSERT INTO TA_MANAGEMENT VALUES(118, '2021', 20, 40);
INSERT INTO TA_MANAGEMENT VALUES(136, '2022', 21, 45);
INSERT INTO TA_MANAGEMENT VALUES(157, '2023', 15, 50);
INSERT INTO TA_MANAGEMENT VALUES(203, '2021', 10, 55);
INSERT INTO TA_MANAGEMENT VALUES(148, '2022', 30, 60);
INSERT INTO TA_MANAGEMENT VALUES(128, '2023', 5, 65);
INSERT INTO TA_MANAGEMENT VALUES(190, '2021', 25, 70);
INSERT INTO TA_MANAGEMENT VALUES(101, '2022', 12, 75);
INSERT INTO TA_MANAGEMENT VALUES(159, '2023', 18, 80);
INSERT INTO TA_MANAGEMENT VALUES(148, '2022', 35, 45);
INSERT INTO TA_MANAGEMENT VALUES(128, '2023', 22, 50);
INSERT INTO TA_MANAGEMENT VALUES(204, '2021', 17, 55);
INSERT INTO TA_MANAGEMENT VALUES(175, '2022', 28, 60);
INSERT INTO TA_MANAGEMENT VALUES(197, '2023', 13, 65);
INSERT INTO TA_MANAGEMENT VALUES(124, '2021', 24, 70);
INSERT INTO TA_MANAGEMENT VALUES(147, '2022', 11, 75);
INSERT INTO TA_MANAGEMENT VALUES(193, '2023', 19, 80);
INSERT INTO TA_MANAGEMENT VALUES(135, '2022', 29, 45);
INSERT INTO TA_MANAGEMENT VALUES(202, '2023', 23, 50);
INSERT INTO TA_MANAGEMENT VALUES(194, '2022', 27, 60);
INSERT INTO TA_MANAGEMENT VALUES(146, '2023', 14, 65);
INSERT INTO TA_MANAGEMENT VALUES(192, '2022', 9, 75);
INSERT INTO TA_MANAGEMENT VALUES(163, '2023', 20, 80);
INSERT INTO TA_MANAGEMENT VALUES(202, '2021', 6, 40);
INSERT INTO TA_MANAGEMENT VALUES(143, '2022', 31, 45);
INSERT INTO TA_MANAGEMENT VALUES(179, '2023', 18, 50);

INSERT INTO TA_MANAGEMENT VALUES(169, '2021', 26, 70);
INSERT INTO TA_MANAGEMENT VALUES(165, '2021', 16, 55);
INSERT INTO TA_MANAGEMENT VALUES(149, '2021', 7, 40);
INSERT INTO TA_MANAGEMENT VALUES(161, '2021', 8, 40);
INSERT INTO TA_MANAGEMENT VALUES(156, '2021', 32, 85);

SELECT * FROM TA_MANAGEMENT ORDER BY EMPLOYEE_ID;


--------------------------------------------------------����� ��� ���̺� ����
DROP TABLE resignation CASCADE CONSTRAINTS PURGE;
CREATE TABLE resignation (
    EMPLOYEE_ID NUMBER 
    ,START_DATE	DATE
    ,END_DATE	DATE
    ,JOB_ID	VARCHAR2(10)
    ,JOB_TITLE VARCHAR2(35)
    ,DEPARTMENT_ID	NUMBER
    ,DEPARTMENT_NAME VARCHAR2(30)
    ,RESIGN_REASON VARCHAR2(100)
);

INSERT INTO resignation VALUES (67, TO_DATE('2021-09-05', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), 'SA_MAN', 'Sales Manager', 50, 'Shipping', 'ȸ�� �濵 ��å ��ȭ');
INSERT INTO resignation VALUES (18, TO_DATE('2022-03-12', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), 'HR_REP', 'Human Resources Representative', 100, 'Finance', '���� �Ҹ���');
INSERT INTO resignation VALUES (82, TO_DATE('2021-12-30', 'YYYY-MM-DD'), TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'AC_ACCOUNT', 'Public Accountant', 190, 'Contracting', '����');
INSERT INTO resignation VALUES (57, TO_DATE('2022-04-18', 'YYYY-MM-DD'), TO_DATE('2022-12-05', 'YYYY-MM-DD'), 'FI_MGR', 'Finance Manager', 70, 'Public Relations', 'ȸ�� �濵 ��å ��ȭ');
INSERT INTO resignation VALUES (39, TO_DATE('2022-02-28', 'YYYY-MM-DD'), TO_DATE('2022-10-15', 'YYYY-MM-DD'), 'PU_MAN', 'Purchasing Manager', 160, 'Benefits', '������ ����');
INSERT INTO resignation VALUES (67, TO_DATE('2021-10-10', 'YYYY-MM-DD'), TO_DATE('2022-06-25', 'YYYY-MM-DD'), 'ST_CLERK', 'Stock Clerk', 130, 'Corporate Tax', '�ٸ� �о߷��� ����');
INSERT INTO resignation VALUES (29, TO_DATE('2021-08-20', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'SH_CLERK', 'Shipping Clerk', 50, 'Shipping', '������ ����');
INSERT INTO resignation VALUES (93, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 60, 'IT', 'ȸ�� ����');
INSERT INTO resignation VALUES (50, TO_DATE('2021-11-28', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'MK_MAN', 'Marketing Manager', 20, 'Marketing', '���� �Ҹ���');
INSERT INTO resignation VALUES (15, TO_DATE('2021-07-22', 'YYYY-MM-DD'), TO_DATE('2022-03-10', 'YYYY-MM-DD'), 'PR_REP', 'Public Relations Representative', 250, 'Retail Sales', '�濵 ö���� ����ġ');
INSERT INTO resignation VALUES (107, TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 60, 'IT', '�޿� �Ҹ���');
INSERT INTO resignation VALUES (88, TO_DATE('2022-03-05', 'YYYY-MM-DD'), TO_DATE('2022-10-20', 'YYYY-MM-DD'), 'PU_MAN', 'Purchasing Manager', 160, 'Benefits', '���� �Ҹ���');
INSERT INTO resignation VALUES (22, TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'PR_REP', 'Public Relations Representative', 190, 'Contracting', '������ ����');
INSERT INTO resignation VALUES (93, TO_DATE('2021-12-12', 'YYYY-MM-DD'), TO_DATE('2022-07-28', 'YYYY-MM-DD'), 'HR_REP', 'Human Resources Representative', 100, 'Finance', '����');
INSERT INTO resignation VALUES (55, TO_DATE('2022-02-08', 'YYYY-MM-DD'), TO_DATE('2022-09-23', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 200, 'Operations', '������ ����');
INSERT INTO resignation VALUES (81, TO_DATE('2021-08-17', 'YYYY-MM-DD'), TO_DATE('2022-03-03', 'YYYY-MM-DD'), 'AC_MGR', 'Accounting Manager', 60, 'IT', '���� �Ҹ���');
INSERT INTO resignation VALUES (19, TO_DATE('2021-10-28', 'YYYY-MM-DD'), TO_DATE('2022-06-12', 'YYYY-MM-DD'), 'AC_ACCOUNT', 'Public Accountant', 70, 'Public Relations', 'ȸ�� �濵 ��å ��ȭ');
INSERT INTO resignation VALUES (61, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), 'SA_MAN', 'Sales Manager', 80, 'Sales', '���� ������ ���� ���');
INSERT INTO resignation VALUES (37, TO_DATE('2021-07-04', 'YYYY-MM-DD'), TO_DATE('2022-02-18', 'YYYY-MM-DD'), 'MK_MAN', 'Marketing Manager', 160, 'Benefits', '����');
INSERT INTO resignation VALUES (49, TO_DATE('2022-04-22', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), 'PU_MAN', 'Purchasing Manager', 100, 'Finance', '������ ����');
INSERT INTO resignation VALUES (84, TO_DATE('2021-11-10', 'YYYY-MM-DD'), TO_DATE('2022-06-25', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 200, 'Operations', '���� �Ҹ���');
INSERT INTO resignation VALUES (29, TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), 'ST_MAN', 'Stock Manager', 120, 'Treasury', '����');
INSERT INTO resignation VALUES (73, TO_DATE('2021-09-03', 'YYYY-MM-DD'), TO_DATE('2022-04-18', 'YYYY-MM-DD'), 'FI_MGR', 'Finance Manager', 70, 'Public Relations', '������ ����');
INSERT INTO resignation VALUES (59, TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2023-01-29', 'YYYY-MM-DD'), 'SH_CLERK', 'Shipping Clerk', 140, 'Control And Credit', '�޿� �Ҹ���');
INSERT INTO resignation VALUES (15, TO_DATE('2021-08-07', 'YYYY-MM-DD'), TO_DATE('2022-03-22', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 150, 'Shareholder Services', '������ ����');
INSERT INTO resignation VALUES (78, TO_DATE('2021-10-25', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'MK_MAN', 'Marketing Manager', 160, 'Benefits', '���� �Ҹ���');
INSERT INTO resignation VALUES (43, TO_DATE('2022-03-18', 'YYYY-MM-DD'), TO_DATE('2022-10-02', 'YYYY-MM-DD'), 'MK_REP', 'Marketing Representative', 170, 'Manufacturing', '������ ����');
INSERT INTO resignation VALUES (102, TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2022-07-16', 'YYYY-MM-DD'), 'HR_REP', 'Human Resources Representative', 180, 'Construction', 'ȸ�� ����');
INSERT INTO resignation VALUES (36, TO_DATE('2022-01-05', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 'PR_REP', 'Public Relations Representative', 190, 'Contracting', '�޿� �Ҹ���');
INSERT INTO resignation VALUES (63, TO_DATE('2021-09-14', 'YYYY-MM-DD'), TO_DATE('2022-04-29', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 200, 'Operations', '���� �Ҹ���');

SELECT * FROM RESIGNATION;


COMMIT;

    

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;
SELECT * FROM JOB_HISTORY;
SELECT * FROM LOCATIONS;
SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;