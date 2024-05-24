������� : �����ͺ��̽� ���� �� Ȱ��

- ���� : 24.05.24
- ���� :
- ���� :

�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
--Q1. EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
SELECT
    first_name || ' ' || last_name AS �̸�
    ,salary ����
    ,trunc(salary*1.1) "10% �λ�� ����"      
FROM
    employees
;
    
--Q2. EMPLOYEES ���̺��� 2005�� ��ݱ⿡ �Ի��� ����鸸 ���	
SELECT
    *
FROM
    employees
WHERE
    --hire_date BETWEEN TO_DATE('20050101','YY/MM/DD') AND TO_DATE('20050630','YY/MM/DD')
    hire_date >= TO_DATE('20050101','YY/MM/DD') 
    AND hire_date < TO_DATE('20050701','YY/MM/DD')
;


--Q3. EMPLOYEES ���̺��� ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
SELECT
    *
FROM
    employees
WHERE
    job_id in ('SA_MAN','IT_PROG','ST_MAN')
;
   
--Q4. EMPLOYEES ���̺��� manager_id �� 101���� 103�� ����� ���
SELECT
    *
FROM
    employees
WHERE   
    manager_id BETWEEN 101 AND 103
;

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
SELECT
    last_name
    ,hire_date
    ,NEXT_DAY(ADD_MONTHS(hire_date,6),'��') AS "6���� �� ù ��° ������"
FROM
    employees
;


--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �����ϱ����� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)
SELECT
    last_name
    ,salary
    ,hire_date
    ,TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)) AS W_MONTH 
FROM
    employees
ORDER BY
    W_MONTH DESC
;

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
SELECT
    last_name
    ,salary
    ,hire_date
    ,TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12) AS W_YEAR
FROM
    employees
ORDER BY
    W_YEAR DESC
;

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.
SELECT
    employee_id
    ,last_name
FROM
    employees
WHERE
    MOD(employee_id,2) != 0
;

--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
SELECT
    employee_id
    ,last_name
    ,ROUND(salary/12,2) AS M_SALARY
FROM
    employees
;

--Q10. employees ���̺��� salary�� 10000�� �̻��� �������� �����ϴ� �� special_employee�� �����ϴ� SQL ��ɹ��� �ۼ��Ͻÿ�.

CREATE VIEW special_employee AS
    SELECT
        *
    FROM
        employees
    WHERE
        salary >= 10000
;

SELECT * FROM special_employee;

--Q11. EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
SELECT
    count(*)
FROM
    employees
WHERE
    commission_pct is null
;

--Q12. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
SELECT
    employee_id
    ,last_name
    ,DECODE(department_id,null,'����') AS POSITION
FROM
    employees
WHERE
    department_id IS NULL
;

--Q13. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
SELECT
    e.employee_id
    ,e.first_name
    ,j.job_id
    ,j.job_title
FROM
    employees e
    ,jobs j
WHERE
    e.job_id = j.job_id
    AND e.employee_id = 120
;

SELECT
    e.employee_id
    ,e.first_name
    ,j.job_id
    ,j.job_title
FROM
    employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.job_id = j.job_id
    AND e.employee_id = 120
;

--Q14. HR EMPLOYEES ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
SELECT
    first_name || ' ' || last_name AS NAME
FROM
    employees
;

--Q15. HR EMPLOYEES ���̺��� �ټӱⰣ�� 10�� �̻��� ������ �����ϴ� �並 �����ϼ���.
CREATE VIEW ten_year AS
SELECT
    *
FROM
    employees
WHERE
    TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12) >= 10
;

SELECT * FROM ten_year;

--Q16. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���

-- ��
SELECT
    *
FROM
    employees
WHERE
    job_id like '%\_A%' escape '\';
;

--Q17. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
SELECT
    *
FROM
    employees
ORDER BY
    salary
    ,last_name
;
   
--Q18. Seo��� ����� �μ����� ����ϼ���.

SELECT
    e.last_name
    ,d.department_name
FROM
    employees e
    ,departments d
WHERE
    e.department_id = d.department_id
    AND lower(last_name) = 'seo'
;
  

--Q19. JOB ID �� ������� �� �޴��� �� �������� ������ ����� ���ϼ���.
SELECT
    job_id
    ,TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12) W_YEAR
    ,TRUNC(AVG(salary)) AS avg_salary
FROM
    employees
GROUP BY
    TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12)
    ,job_id
ORDER BY
    job_id
;

--Q20. HR EMPLOYEES ���̺��� salary�� 20000 �̻��̸� 'a', 10000�� 20000 �̸� ���̸� 'b', �� ���ϸ� 'c'�� ǥ���ϴ� ������ 
--�ۼ��Ͻÿ�.(case)
SELECT
    last_name
    ,salary
    ,CASE 
        WHEN salary >= 20000 THEN 'a'
        WHEN salary >= 10000 AND salary < 20000 THEN 'b'
        ELSE 'c'
    END AS ���
FROM
    employees
;

-- ��

SELECT
    last_name
    ,salary
    ,CASE 
        WHEN salary >= 20000 THEN 'a'
        WHEN salary > 10000 AND salary < 20000 THEN 'b'
        ELSE 'c'
    END AS ���
FROM
    employees
;

--Q21. �б� ������ ���Ͽ� ���̺� 2�� �̻����� db�� �����ϰ� 3�� �̻� Ȱ���� �� �ִ� case�� ���弼��.(20��)
-- �б� ������ ���Ͽ� ���̺� 2�� �̻� DB�� �����ϰ� 3�� �̻� Ȱ���� �� �ִ� CASE�� ���弼��
-- ��� ����, ��������, ���� ����

DROP TABLE TEACHERS cascade constraints purge;
CREATE TABLE TEACHERS(
    NAME VARCHAR2(20), -- �̸�
    BIRTH DATE, -- ����
    AGE NUMBER, -- ����
    SX VARCHAR2(10),    --  ����
    PHONE VARCHAR2(15), --  �ڵ�����ȣ
    ADDRESS VARCHAR2(50), -- �ּ�
    SUBJECT VARCHAR2(10), -- ��� ����
    CLASS_ASSIGNED VARCHAR2(15), -- ��� ��
    PRIMARY KEY (CLASS_ASSIGNED)
);


DROP TABLE STUDENTS cascade constraints purge;
CREATE TABLE STUDENTS(
    NAME VARCHAR2(20), -- �л���
    STDID NUMBER(10), -- �л� ��ȣ
    BIRTH DATE, -- �л� ����
    AGE NUMBER, -- ����
    SX VARCHAR2(10), -- ����
    PHONE VARCHAR2(15), -- �ڵ��� ��ȣ
    ADDRESS VARCHAR2(50), -- �ּ�
    FAV_JUBJECT VARCHAR2(10), -- ����
    CLASS   VARCHAR2(15), -- ��
    FOREIGN KEY (CLASS) REFERENCES TEACHERS(CLASS_ASSIGNED) ON DELETE CASCADE
);

INSERT INTO TEACHERS VALUES ('�迵��', '1993-02-03', 29, '��', '010-1234-5678', '���� ����', '����', '2�г� 3��');
INSERT INTO TEACHERS VALUES ('��ö��', '1987-12-15', 34, '��', '010-9876-5432', '�λ� �ؿ��', '����', '1�г� 2��');
INSERT INTO TEACHERS VALUES ('�ڹμ�', '1990-08-20', 31, '��', '010-1234-5678', '���� ����', '����', '3�г� 1��');
INSERT INTO TEACHERS VALUES ('������', '1985-06-10', 36, '��', '010-5678-1234', '��õ ����', '����', '2�г� 2��');
INSERT INTO TEACHERS VALUES ('ȫ�浿', '1991-03-25', 30, '��', '010-9876-5432', '���� ����', '����', '1�г� 3��');
INSERT INTO TEACHERS VALUES ('�̿���', '1988-11-15', 33, '��', '010-3456-7890', '�뱸 ����', 'ü��', '3�г� 4��');
INSERT INTO TEACHERS VALUES ('��̿�', '1994-09-18', 27, '��', '010-5678-1234', '���� ����', '�̼�', '2�г� 1��');
INSERT INTO TEACHERS VALUES ('�ڽ�ȣ', '1982-07-20', 39, '��', '010-2345-6789', '��� �Ⱦ�', '����', '1�г� 12��');
INSERT INTO TEACHERS VALUES ('���ٿ�', '1993-05-30', 28, '��', '010-7890-1234', '��� ����', '�ѱ���', '3�г� 3��');
INSERT INTO TEACHERS VALUES ('������', '1997-04-08', 24, '��', '010-1234-5678', '�泲 â��', '����', '2�г� 17��');
INSERT INTO TEACHERS VALUES ('��öȣ', '1981-08-10', 40, '��', '010-3456-7890', '���� ����', '����', '1�г� 1��');
INSERT INTO TEACHERS VALUES ('������', '1989-10-05', 32, '��', '010-5678-1234', '���� ����', '����', '3�г� 2��');
INSERT INTO TEACHERS VALUES ('���¹�', '1996-01-12', 25, '��', '010-2345-6789', '��õ ����', '����', '1�г� 5��');
INSERT INTO TEACHERS VALUES ('�����', '1987-07-22', 34, '��', '010-7890-1234', '��� ���', '����', '2�г� 4��');
INSERT INTO TEACHERS VALUES ('�̿�ȣ', '1992-12-14', 29, '��', '010-1234-5678', '���� �߱�', 'ü��', '1�г� 4��');
INSERT INTO TEACHERS VALUES ('������', '1986-04-30', 35, '��', '010-3456-7890', '���� ����', '�̼�', '3�г� 19��');
INSERT INTO TEACHERS VALUES ('�̰���', '1998-11-05', 23, '��', '010-5678-1234', '�λ� ����', '����', '2�г� 8��');
INSERT INTO TEACHERS VALUES ('�赿ȣ', '1990-02-28', 31, '��', '010-2345-6789', '��� ����', '�ѱ���', '3�г� 17��');
INSERT INTO TEACHERS VALUES ('������', '1983-09-15', 38, '��', '010-7890-1234', '���� ����', '����', '1�г� 16��');
INSERT INTO TEACHERS VALUES ('���ؿ�', '1995-05-18', 26, '��', '010-1234-5678', '��� ����', '����', '2�г� 20��');
INSERT INTO TEACHERS VALUES ('������', '1980-12-10', 41, '��', '010-3456-7890', '���� ����', '����', '3�г� 8��');
INSERT INTO TEACHERS VALUES ('�ִٿ�', '1988-07-20', 33, '��', '010-9876-5432', '�λ� �ؿ��', '����', '1�г� 9��');
INSERT INTO TEACHERS VALUES ('�輺ȣ', '1993-04-03', 28, '��', '010-2345-6789', '��õ ����', '����', '2�г� 19��');
INSERT INTO TEACHERS VALUES ('�ڹ̿�', '1997-01-28', 24, '��', '010-7890-1234', '�뱸 ����', 'ü��', '1�г� 6��');
INSERT INTO TEACHERS VALUES ('���ȣ', '1981-10-08', 40, '��', '010-1234-5678', '���� ����', '�̼�', '2�г� 10��');
INSERT INTO TEACHERS VALUES ('������', '1994-09-03', 27, '��', '010-3456-7890', '���� ����', '����', '1�г� 17��');
INSERT INTO TEACHERS VALUES ('������', '1985-03-20', 36, '��', '010-5678-1234', '��� �Ⱦ�', '�ѱ���', '3�г� 20��');
INSERT INTO TEACHERS VALUES ('�ڿ���', '1998-11-22', 23, '��', '010-2345-6789', '��� ����', '����', '2�г� 9��');
INSERT INTO TEACHERS VALUES ('��μ�', '1991-06-07', 30, '��', '010-7890-1234', '���� ����', '����', '1�г� 10��');

SELECT * FROM TEACHERS;


INSERT INTO STUDENTS VALUES ('��ö��', 220634, '2006-03-15', 17, '��', '010-1234-5678', '���� ����', '����', '3�г� 3��');
INSERT INTO STUDENTS VALUES ('�̿���', 230223, '2007-04-20', 15, '��', '010-9876-5432', '�λ� �ؿ��', '����', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('�ڹ���', 240312, '2008-06-23', 14, '��', '010-2345-6789', '�뱸 ����', '����', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('����ȣ', 250506, '2007-09-08', 15, '��', '010-8765-4321', '��õ ����', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('�̼���', 260721, '2006-12-30', 16, '��', '010-3456-7890', '���� ����', '����', '3�г� 4��');
INSERT INTO STUDENTS VALUES ('���¿�', 270830, '2005-11-10', 17, '��', '010-7890-1234', '���� ����', '����', '1�г� 3��');
INSERT INTO STUDENTS VALUES ('������', 280917, '2006-01-20', 16, '��', '010-4567-8901', '���� �߱�', '�̼�', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 290102, '2007-03-05', 15, '��', '010-2345-6789', '��� ����', 'ü��', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('���ȣ', 300206, '2006-11-18', 16, '��', '010-7890-1234', '���� ����', '�ѱ���', '1�г� 2��');
INSERT INTO STUDENTS VALUES ('�̼���', 310301, '2008-04-30', 14, '��', '010-3456-7890', '��� ����', '�̼�', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('�ڿ���', 320413, '2005-06-15', 17, '��', '010-9876-5432', '���� ����', '����', '3�г� 4��');
INSERT INTO STUDENTS VALUES ('���ٿ�', 330520, '2006-07-20', 16, '��', '010-2345-6789', '���� ����', 'ü��', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 340606, '2005-03-04', 17, '��', '010-7890-1234', '�泲 â��', '�̼�', '2�г� 4��');
INSERT INTO STUDENTS VALUES ('������', 350707, '2008-01-20', 14, '��', '010-3456-7890', '���� ����', '����', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('�ֽ�ȣ', 360822, '2006-09-18', 16, '��', '010-1234-5678', '�λ� ����', '����', '1�г� 4��');
INSERT INTO STUDENTS VALUES ('�ڼ���', 370925, '2007-05-22', 15, '��', '010-9876-5432', '��� �Ⱦ�', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('�迵ȣ', 380107, '2005-08-07', 17, '��', '010-2345-6789', '���� ����', '�ѱ���', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 390215, '2006-04-15', 16, '��', '010-3456-7890', '���� ����', 'ü��', '1�г� 3��');
INSERT INTO STUDENTS VALUES ('�����', 400330, '2007-06-28', 15, '��', '010-1234-5678', '��õ ����', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 410406, '2005-02-09', 17, '��', '010-9876-5432', '��� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 420502, '2008-01-19', 14, '��', '010-2345-6789', '�뱸 �޼�', '�̼�', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('�̹���', 430603, '2006-06-12', 16, '��', '010-3456-7890', '���� ����', '����', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('�ڼ���', 440727, '2005-12-03', 16, '��', '010-1234-5678', '��� ���', '����', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 450817, '2008-06-28', 14, '��', '010-9876-5432', '���� ����', 'ü��', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 460920, '2007-11-18', 15, '��', '010-2345-6789', '���� �ϱ�', '����', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('����ȣ', 470002, '2006-09-07', 16, '��', '010-3456-7890', '�泲 ����', '����', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('�̰���', 480106, '2005-08-23', 17, '��', '010-1234-5678', '���� ����', '����', '1�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 490225, '2008-04-12', 14, '��', '010-9876-5432', '��õ ����', '����', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('���̿�', 500312, '2007-11-05', 15, '��', '010-1234-5678', '���� ����', '�̼�', '1�г� 4��');
INSERT INTO STUDENTS VALUES ('��ö��', 510406, '2004-03-15', 18, '��', '010-1234-5678', '���� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('�̿���', 520423, '2005-04-20', 17, '��', '010-9876-5432', '�λ� �ؿ��', '����', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('�ڹ���', 530523, '2004-06-23', 17, '��', '010-2345-6789', '�뱸 ����', '����', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('����ȣ', 540606, '2003-09-08', 18, '��', '010-8765-4321', '��õ ����', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('�̼���', 550721, '2004-12-30', 17, '��', '010-3456-7890', '���� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('���¿�', 560830, '2003-11-10', 18, '��', '010-7890-1234', '���� ����', '����', '1�г� 3��');
INSERT INTO STUDENTS VALUES ('������', 570917, '2004-01-20', 18, '��', '010-4567-8901', '���� �߱�', '�̼�', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 580102, '2005-03-05', 17, '��', '010-2345-6789', '��� ����', 'ü��', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('���ȣ', 590206, '2004-11-18', 17, '��', '010-7890-1234', '���� ����', '�ѱ���', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('�̼���', 600301, '2006-04-30', 16, '��', '010-3456-7890', '��� ����', '�̼�', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('�ڿ���', 610413, '2003-06-15', 18, '��', '010-9876-5432', '���� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('���ٿ�', 620520, '2004-07-20', 17, '��', '010-2345-6789', '���� ����', 'ü��', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 630606, '2003-03-04', 18, '��', '010-7890-1234', '�泲 â��', '�̼�', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 640707, '2006-01-20', 16, '��', '010-3456-7890', '���� ����', '����', '3�г� 3��');

SELECT * FROM STUDENTS;


DROP TABLE SCOREBOARD cascade constraints purge;
CREATE TABLE SCOREBOARD(
    NAME VARCHAR2(20),          -- �л���
    STDID NUMBER(10),           -- �л� ��ȣ
    MATH1 NUMBER(10),           -- ���� 1�� ����
    MATH2 NUMBER(10),           -- ���� 2�� ����
    MATH3 NUMBER(10),           -- ���� 3�� ����
    SCORE_MATH VARCHAR2(10),    -- ���� ����
    PHYS1 NUMBER(10),           -- ���� 1�� ����
    PHYS2 NUMBER(10),           -- ���� 2�� ����
    PHYS3 NUMBER(10),           -- ���� 3�� ����
    SCORE_PHYS VARCHAR2(10),    -- ���� ����
    ABSENCE NUMBER(10),         -- �Ἦ �ϼ�
    FLUNK VARCHAR2(10)          -- ���� ����
);

INSERT	INTO	SCOREBOARD	VALUES	('��ö��',220634,74,84,56,NULL,63,78,89,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̿���',230223,30,30,78,NULL,40,64,52,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڹ���',240312,46,33,38,NULL,62,29,31,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('����ȣ',250506,80,35,47,NULL,70,64,97,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',260721,96,63,96,NULL,56,40,61,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���¿�',270830,81,73,33,NULL,61,51,44,NULL,7,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',280917,91,58,69,NULL,59,40,85,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',290102,83,64,63,NULL,63,96,69,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ȣ',300206,89,32,78,NULL,80,53,39,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',310301,37,63,63,NULL,67,27,68,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڿ���',320413,31,27,58,NULL,43,80,51,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ٿ�',330520,73,89,26,NULL,99,79,70,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',340606,26,61,62,NULL,40,31,86,NULL,10,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',350707,84,38,58,NULL,54,51,48,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ֽ�ȣ',360822,52,55,45,NULL,24,73,62,NULL,10,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڼ���',370925,47,68,44,NULL,72,48,69,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�迵ȣ',380107,56,69,90,NULL,98,49,88,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',390215,20,41,49,NULL,56,32,26,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�����',400330,43,21,79,NULL,39,52,24,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',410406,56,83,26,NULL,71,75,52,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',420502,83,83,71,NULL,38,98,44,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̹���',430603,40,77,27,NULL,94,77,73,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڼ���',440727,39,62,48,NULL,74,83,94,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',450817,91,82,91,NULL,37,45,20,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',460920,86,22,66,NULL,91,28,79,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('����ȣ',470002,50,23,40,NULL,62,41,49,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̰���',480106,58,32,43,NULL,58,43,66,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',490225,27,94,53,NULL,33,36,44,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���̿�',500312,69,78,21,NULL,48,23,61,NULL,5,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('��ö��',510406,31,88,99,NULL,54,21,95,NULL,7,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̿���',520423,30,47,27,NULL,57,84,58,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڹ���',530523,24,33,37,NULL,41,68,57,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('����ȣ',540606,66,41,48,NULL,48,50,25,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',550721,64,86,49,NULL,93,70,67,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���¿�',560830,92,95,56,NULL,23,48,39,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',570917,64,94,27,NULL,53,92,33,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',580102,73,83,33,NULL,97,98,58,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ȣ',590206,67,40,92,NULL,71,93,61,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',600301,78,41,57,NULL,21,92,22,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڿ���',610413,75,51,84,NULL,54,76,26,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ٿ�',620520,55,33,53,NULL,81,53,51,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',630606,82,41,25,NULL,40,45,81,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',640707,30,57,72,NULL,54,32,96,NULL,6,NULL);

DROP TABLE RELOCATEE cascade constraints purge;

-- ������ ������ ��� ���̺� ����
CREATE TABLE RELOCATEE(
    NAME VARCHAR2(20),      -- ������ �̸�
    RELO_DATE DATE          -- ���� ����
);

INSERT	INTO	RELOCATEE	VALUES	('��öȣ', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('��ҿ�', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�ڽ¿�', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�ֹ���', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�̹���', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�ּ���', TO_DATE('2024-09-01','YYYY-MM-DD'));

SELECT * FROM RELOCATEE;
    
SELECT * FROM TEACHERS;
SELECT * FROM STUDENTS;
SELECT * FROM SCOREBOARD;
SELECT * FROM RELOCATEE;

------------------------------ Q.�й� ���� �Ҽӵ� �л���� ��� �������� �˻�
SELECT S.STDID �й�, S.NAME �̸�, S.CLASS "�г�/��", T.NAME "���Ӽ�����"
FROM STUDENTS S 
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
ORDER BY "�г�/��";


------------------------------ Q.���� TABLE���� ����/���� ������ ���񿡼� 1��, 2��, 3��, ���迡 ���� ����ġ X 0.3�� ������ ����
------------------------------ �ջ� ������ �Ἦ�ϼ��� ���ؼ� ���� ����/���� ���� ������ SCORE_MATH�� SCORE_PHYS COLUMN�� UPDATE
UPDATE SCOREBOARD SET
SCORE_MATH = ROUND((MATH1 * 0.3 + MATH2 * 0.3 + MATH3 * 0.3) - ABSENCE),
SCORE_PHYS = ROUND((PHYS1 * 0.3 + PHYS2 * 0.3 + PHYS3 * 0.3) - ABSENCE);
SELECT * FROM SCOREBOARD;



------------------------------ Q. ���� ���� ���� ��� 1,2,3�� ����� ��������� ����� �ջ� �����κ��� 
------------------------------ 65�� �̻�: A, 64~55��: B, 54~45�� : C, 44~36�� D, 35�� ����: F �������� ���� ó���ؼ� 
------------------------------ GRADE_MATH�� GRADE_PHYS NEW COLUMN ���� �˻� ����
SELECT NAME, STDID, SCORE_MATH,
CASE
WHEN SCORE_MATH >= 65 THEN 'A'
WHEN SCORE_MATH BETWEEN 55 AND 64 THEN 'B'
WHEN SCORE_MATH BETWEEN 45 AND 54 THEN 'C'
WHEN SCORE_MATH BETWEEN 36 AND 44 THEN 'D'
ELSE 'F'
END AS GRADE_MATH,
SCORE_PHYS,
CASE
WHEN SCORE_PHYS >= 65 THEN 'A'
WHEN SCORE_PHYS BETWEEN 55 AND 64 THEN 'B'
WHEN SCORE_PHYS BETWEEN 45 AND 54 THEN 'C'
WHEN SCORE_PHYS BETWEEN 36 AND 44 THEN 'D'
ELSE 'F'
END AS GRADE_PHYS,
ABSENCE,
FLUNK
FROM SCOREBOARD;

------------------------------ Q.���� ���� ������ ���� ���а� ������ ������ �׷��̵� �ϰ�, �� ������ �����ڸ� �˻��ؼ� FLUNK �÷� UPDATE
UPDATE SCOREBOARD
SET FLUNK = CASE
WHEN TO_NUMBER(SCORE_MATH) <= 35 AND TO_NUMBER(SCORE_PHYS) <= 35 THEN '����'
WHEN TO_NUMBER(SCORE_MATH) <= 35 OR TO_NUMBER(SCORE_PHYS) <= 35 THEN '���'
ELSE 'PASS'
END;
SELECT * FROM SCOREBOARD;

------------------------------ Q.������ ���� Ȥ�� ���� ������ �ش��ϴ� �л��� ���� �������� ����Ʈ�� ����
SELECT
    S.NAME AS �л��̸�,
    S.CLASS AS "�г�/��",
    T.NAME AS ��米��,
    SB.FLUNK AS ���޿���
FROM SCOREBOARD SB
INNER JOIN STUDENTS S ON SB.STDID = S.STDID
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
WHERE SB.FLUNK IN ('����', '����');


------------------------------ Q.�� ���� ��ο��� ������ ���� �л��� ���� �������� ��� ����
SELECT
    S.NAME AS �л��̸�,
    S.CLASS AS "�г�/��",
    T.NAME AS "���� ��� ���� ����"
FROM SCOREBOARD SB
INNER JOIN STUDENTS S ON SB.STDID = S.STDID
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
WHERE SB.FLUNK IN ('����');

------------------------------ Q.�ݺ� ��� ������ ���� ���� �� ������ ���� (�г� ���� ����)
SELECT
    T.CLASS_ASSIGNED AS CLASS,
    ROUND(AVG(SB_MATH_SCORE),2) AS AVG_MATH_SCORE,
    T.NAME AS TEACHER_NAME
FROM TEACHERS T
JOIN STUDENTS S ON T.CLASS_ASSIGNED = S.CLASS
JOIN (SELECT STDID, AVG(TO_NUMBER(SCORE_MATH)) AS SB_MATH_SCORE
    FROM SCOREBOARD
    GROUP BY STDID) SB ON S.STDID = SB.STDID
GROUP BY T.CLASS_ASSIGNED, T.NAME
ORDER BY AVG_MATH_SCORE DESC, T.CLASS_ASSIGNED;

select
    a.class
    ,a.math_rank
    ,b.phys_rank
from
    (SELECT 
        b.class
        ,RANK() OVER (ORDER BY round(avg(a.score_math)) DESC) as math_rank
    FROM
        SCOREBOARD A
        ,STUDENTS B
    WHERE
        A.stdid = B.stdid
    group by
        b.class    
     ) a
     ,(SELECT 
            b.class
            ,RANK() OVER (ORDER BY round(avg(a.score_phys)) DESC) as phys_rank
        FROM
            SCOREBOARD A
            ,STUDENTS B
        WHERE
            A.stdid = B.stdid
        group by
            b.class
        ) b
where
    a.class = b.class
    and (a.math_rank = 1 or  b.phys_rank = 1)
;

SELECT 
    b.class
    ,a.score_math
    ,a.score_phys

FROM
    SCOREBOARD A
    ,STUDENTS B
WHERE
    A.stdid = B.stdid

  ;
--------------------------------------------------- Q.�ݺ� ��� ������ ���� ���� �� ������ ���� (1�г� ��)
SELECT
    T.CLASS_ASSIGNED AS CLASS,
    ROUND(AVG(SB_MATH_SCORE), 2) AS AVG_MATH_SCORE,
    T.NAME AS TEACHER_NAME
FROM TEACHERS T
JOIN STUDENTS S ON T.CLASS_ASSIGNED = S.CLASS
JOIN (SELECT STUDENTS.STDID,AVG(TO_NUMBER(SCORE_MATH)) AS SB_MATH_SCORE
    FROM SCOREBOARD
    JOIN STUDENTS ON SCOREBOARD.STDID = STUDENTS.STDID
    AND SUBSTR(STUDENTS.CLASS, 1, 1) = '1' 
    GROUP BY STUDENTS.STDID) SB ON S.STDID = SB.STDID
GROUP BY T.CLASS_ASSIGNED, T.NAME
ORDER BY AVG_MATH_SCORE DESC;

--------------------------------------------------- Q.�ݺ� ��� ������ ���� ���� �� ������ ���� (3�г� ��)
SELECT.
    T.CLASS_ASSIGNED AS CLASS,
    ROUND(AVG(SB_MATH_SCORE), 2) AS AVG_MATH_SCORE,
    T.NAME AS TEACHER_NAME
FROM TEACHERS T
JOIN STUDENTS S ON T.CLASS_ASSIGNED = S.CLASS
JOIN (SELECT STUDENTS.STDID,AVG(TO_NUMBER(SCORE_MATH)) AS SB_MATH_SCORE
    FROM SCOREBOARD
    JOIN STUDENTS ON SCOREBOARD.STDID = STUDENTS.STDID
    AND SUBSTR(STUDENTS.CLASS, 1, 1) = '3' 
    GROUP BY STUDENTS.STDID) SB ON S.STDID = SB.STDID
GROUP BY T.CLASS_ASSIGNED, T.NAME
ORDER BY AVG_MATH_SCORE DESC;


------------------------------ Q.STUDENT TABLE���� �л� ��ܿ� �г��� �����ؼ� ����
SELECT
    NAME AS STUDENT_NAME,
    STDID AS STUDENT_ID,
    AGE AS STUDENT_AGE,
    SUBSTR(CLASS, 1, 1) AS GRADE
FROM STUDENTS
ORDER BY GRADE;



--------------------------------------------------- Q. �г� �� �л� ���� ������ ��, ������ �� ��� �л� �� ������ ���� ������ ����
WITH StudentCount AS (
    SELECT SUBSTR(CLASS, 1, 1) AS GRADE, COUNT(*) AS NUM_STUDENTS
    FROM STUDENTS
    GROUP BY SUBSTR(CLASS, 1, 1)),
TeacherCount AS ( 
    SELECT SUBSTR(CLASS_ASSIGNED, 1, 1) AS GRADE, COUNT(*) AS NUM_TEACHERS
    FROM TEACHERS 
    GROUP BY SUBSTR(CLASS_ASSIGNED, 1, 1)),
StudentPerTeacher AS (
    SELECT S.GRADE, S.NUM_STUDENTS AS STUDENT_COUNT, T.NUM_TEACHERS AS TEACHER_COUNT,
        ROUND(S.NUM_STUDENTS / T.NUM_TEACHERS, 2) AS STUDENT_PER_TEACHER
    FROM StudentCount S
    JOIN TeacherCount T ON S.GRADE = T.GRADE)
SELECT SPT.GRADE, SPT.STUDENT_COUNT, SPT.TEACHER_COUNT, SPT.STUDENT_PER_TEACHER
FROM StudentPerTeacher SPT
ORDER BY
    SPT.STUDENT_PER_TEACHER DESC;


--------------------------------------------------- Q. ���ٰ� ������ �л����� ���� �л��� ���� ������ ����
UPDATE STUDENTS
SET CLASS = (SELECT  C.CLASS
            FROM (SELECT B.CLASS, COUNT(B.CLASS) AS CNT
                  FROM TEACHERS A, STUDENTS B
                  WHERE A.CLASS_ASSIGNED = B.CLASS AND B.CLASS LIKE '1%' AND A.NAME != '��öȣ'
                  GROUP BY B.CLASS
                  ORDER BY COUNT(B.CLASS)) C
            WHERE ROWNUM = 1)
WHERE CLASS = (SELECT CLASS_ASSIGNED
            FROM TEACHERS
            WHERE NAME = '��öȣ');


ROLLBACK;
DELETE FROM teachers WHERE name = '��öȣ';


SELECT
    a.name
FROM
    TEACHERS A
    ,RELOCATEE B
    ,STUDENTS C
WHERE
    A.NAME = B.NAME
    AND A.class_assigned = c.class
;

--Q22. ���� �ǽ������� �����ϼ���.(20��)
-- 1. ���� hr�� �ִ� 7�� ���̺���� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5�� �̻��� ����ϼ���.
-- 2. �λ���� ������ ���� KPI 2���� �����ϰ� �̰͵��� ���̺���� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� �����ϼ���. 

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
