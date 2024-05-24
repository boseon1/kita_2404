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
               ������(��������)�� ���� ����/MENTORING ���� (MENTOR:��������/����, MENTEE: ������)
            -- ���� ������ ���� ������ ���� COMMISSION PERCENT�� SALES �μ����� å��
            
-- INSIGHT-5 : GREAT WORK PLACE (GWP), WORK - LIFE BALANCE�� ���� HR-DB�� ���� ���α׷� ����(ȸ��/������ ���Ӽ�/����)
            -- ������ �ǰ� (����/����/����/�μ� STRESS...) ���� DB�� ����
            -- �ٹ� �ð� ���� DB(���κ�/�μ��� �η� ��� �ٹ��ð� BALANCE ������ ���� DB)
            -- HR �μ����� ���/�����ǰ�/����... ���α׷� ����/���� 

-- REMARKS: DB�� DATA�� INCONSISTENCY ISSUE �߿伺

--------------------------------------------- KPI (Key Performance Indicator/index) ---------------------------------------------
-- Key: (1) �߿伺, (2) ���� ������ ������ ��ǥ, (3) �ñ⺰ ���� ����

-- KPI-1 : (1-1) DB�� REDUNDANCY ����, ���� TABLE�� COMPACT�ϰ� ����, DATA INCONSISTENCY ����
              -- EMPLOYEES&(DEPARTMENT �Ϻ� �Ӽ�) ==> EMPLOYEES_NEW TABLE
              -- LOCATIONS/COUNTRIES/REGIONS ==> LOCATIONS ���� ����
              -- PRIMARY/FOREIGN KEY ����
        -- (1-2) �λ���� �������� �ű� DATA TABLE ����/����
              -- ���� (TA_MANAGEMENT), ���� (INDIVIDUAL_PERF,DEPARTMENTS==>DEPARTMENT_PERF), ������(RESIGNEE) ���� DB TABLE ����
              
-- KPI-2 : ���� �ڿ� ������ ����
              -- ���� (TA_MANAGEMENT) DB ==> ���� ==> �ٹ� ������, �ν� ������ ���� ==> ���� BALANCE/�μ� ����, ��� ���α׷� �ǰ�
              -- ��ǥ ��� ���� ���� (����/�μ� �ջ�) DB ==> ���� ==> ���(INCENTIVE �ο�)�� ����
              -- ���� �����ڸ� ���� ���� ���α׷� �� MENTOR/MENTEE ���α׷� ��ȹ/ ����� ����.
              -- �ǰ� ���� / ��� ���� DB ==> �λ� Ư���� �߱�


--------------------------------------------------------------------------------- FLATTEN ALL DB TO REVIEW DATA CONSISTENCY
DROP VIEW EMPLOYEES_NEW;
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
    ���,�̸�,�ڵ�����ȣ,�ٹ�����,
    CASE
        WHEN �ٹ����� = 'UK' AND (REGEXP_LIKE(�ڵ�����ȣ, '^0[0-9]{2}\.[0-9]{4}\.[0-9]{4}$') OR REGEXP_LIKE(�ڵ�����ȣ, '^0[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')) THEN 'PASS'
        WHEN �ٹ����� = 'US' AND REGEXP_LIKE(�ڵ�����ȣ, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 'PASS'
        ELSE 'FAIL'
    END AS VALID_HP
FROM 
    EMPLOYEES_NEW;

-------------------------------------------------------------------------------------------------------------------------------
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




DROP VIEW EMPLOYEES_NEW;
DROP TABLE EMPLOYEES_NEW CASCADE CONSTRAINTS PURGE;

--------------------------------------------------------------- VIEW�� �ƴ� ���� NEW TABLE�� ����
-- EMPLOYEES_NEW ���̺� ����
CREATE TABLE EMPLOYEES_NEW (
    ��� NUMBER,
    �̸� VARCHAR2(100),
    �̸��� VARCHAR2(100),
    �ڵ�����ȣ VARCHAR2(20),
    �Ի����� DATE,
    ���� NUMBER,
    �޿� NUMBER,
    �޿����� VARCHAR2(20),
    ���⼺�� VARCHAR2(10),
    ������ VARCHAR2(100),
    ���Ŵ���ID NUMBER,
    ���Ŵ��� VARCHAR2(100),
    �μ�ID NUMBER,
    �μ��� VARCHAR2(100),
    ���Ŵ���ID2 NUMBER,
    �Ŵ������ռ� VARCHAR2(10),
    �ٹ����� VARCHAR2(100),
    �ٹ����� VARCHAR2(2),
    �ٹ���� VARCHAR2(100)
);

-- EMPLOYEES_NEW�� ������ INSERT
INSERT INTO EMPLOYEES_NEW (
    ���,
    �̸�,
    �̸���,
    �ڵ�����ȣ,
    �Ի�����,
    ����,
    �޿�,
    �޿�����,
    ���⼺��,
    ������,
    ���Ŵ���ID,
    ���Ŵ���,
    �μ�ID,
    �μ���,
    ���Ŵ���ID2,
    �Ŵ������ռ�,
    �ٹ�����,
    �ٹ�����,
    �ٹ����
)
SELECT 
    E.EMPLOYEE_ID,
    E.FIRST_NAME || ' ' || E.LAST_NAME,
    E.EMAIL,
    E.PHONE_NUMBER,
    E.HIRE_DATE,
    FLOOR(MONTHS_BETWEEN(SYSDATE, E.HIRE_DATE) / 12),
    E.SALARY,
    CASE WHEN E.SALARY BETWEEN J.MIN_SALARY AND J.MAX_SALARY THEN 'IN_RANGE' ELSE 'OUT_RANGE' END,
    DECODE(E.COMMISSION_PCT, NULL, 'N', E.COMMISSION_PCT),
    E.JOB_ID,
    E.MANAGER_ID,
    M.FIRST_NAME || ' ' || M.LAST_NAME,
    E.DEPARTMENT_ID,
    D.DEPARTMENT_NAME,
    D.MANAGER_ID,
    DECODE(E.MANAGER_ID, D.MANAGER_ID, '����', '������'),
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

SELECT * FROM EMPLOYEES_NEW ORDER BY ���;

------------------------------------------------------------- INVALID TYPE ��ȭ ��ȣ ����
UPDATE EMPLOYEES_NEW
SET �ڵ�����ȣ = 
    CASE 
        WHEN �ٹ����� = 'UK' THEN 
            CASE 
                WHEN REGEXP_LIKE(�ڵ�����ȣ, '^0[0-9]{2}\.[0-9]{4}\.[0-9]{4}$') OR 
                     REGEXP_LIKE(�ڵ�����ȣ, '^0[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 
                         �ڵ�����ȣ
                ELSE
                    '0' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0')
            END
        WHEN �ٹ����� = 'US' THEN 
            CASE 
                WHEN REGEXP_LIKE(�ڵ�����ȣ, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 
                    �ڵ�����ȣ
                ELSE
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0')
            END
    END;

SELECT * FROM EMPLOYEES_NEW;
------------------------------------------------------------- �Ŵ��������� ����
UPDATE EMPLOYEES_NEW SET ���Ŵ���ID = ���Ŵ���ID2;

------------------------------------------------------------- �μ� ���� ���� (KIMBERELY GRANT) DATA ����
UPDATE EMPLOYEES_NEW
SET 
    ���Ŵ���ID = 145,
    �μ�ID = 80,
    �μ��� = 'Sales',
    �ٹ����� = 'Oxford',
    �ٹ����� = 'UK',
    �ٹ���� = 'Europe'
WHERE ��� = 178;

--------------------------------���� ���� ���� �ʿ�

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;
SELECT * FROM JOB_HISTORY;
SELECT * FROM LOCATIONS;
SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;



