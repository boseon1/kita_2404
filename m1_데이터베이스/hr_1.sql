select * from employees;

-- Q. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���
SELECT
    e.employee_id ���, e.first_name �̸�, e.last_name ��, e.job_id ����, J.job_title ������
FROM
    employees E
INNER JOIN jobs J ON E.job_id = J.job_id
WHERE
    E.employee_id = 120
;

-- FIRST_NAME || ' ' || LAST_NAME AS �̸�: FIRST_NAME�� LAST_NAME�� �������� �����Ͽ�
-- �ϳ��� ���ڿ��� ��ġ��, �� ����� ��Ī�� �̸����� ����

SELECT
    e.employee_id ���, e.first_name || ' ' || e.last_name AS �̸�, e.job_id ����, J.job_title ������
FROM
    employees E
    ,jobs J 
WHERE
    E.employee_id = 120
    and e.job_id = j.job_id
;

-- Q. 2005�� ��ݱ⿡ �Ի��� ������� �̸�(Full name)�� ���
SELECT
    first_name || ' ' || last_name as �̸�
    ,hire_date �Ի���
FROM
    employees
WHERE
    --TO_CHAR(hire_date,'yymmdd') >= '050701'
    TO_CHAR(hire_date,'YY/MM') between '05/01' AND '05/06'
;
-- _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����ϰ� ���� �� escape �ɼ��� ���
select * from employees where job_id like '%\_A%';
select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#';


-- IN : OR ��� ���
SELECT * FROM employees WHERE manager_id = 101 or manager_id = 102 or manager_id = 103;
SELECT * FROM employees WHERE manager_id in (101,102,103);

-- Q. ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
SELECT
    *
FROM
    employees
WHERE
    job_id in ('SA_MAN','IT_PROG','ST_MAN')
;

-- IS NULL / IS NOT NULL
-- null �������� Ȯ���� ��� = �� �����ڸ� ������� �ʰ� is null�� ����Ѵ�.
SELECT * FROM employees WHERE commission_pct is null;
SELECT * FROM employees WHERE commission_pct is not null;

-- ORDER BY
-- ORDER BY �÷��� [ASC | DESC]
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary asc, last_name desc;

-- DUAL ���̺�
-- mod ������
SELECT * FROM employees WHERE mod (employee_id,2) = 1;
SELECT mod(10,3) FROM dual;

-- round()
SELECT round(355.9555) FROM dual;
SELECT round(355.9555,2 ) FROM dual;
SELECT round(355.9555,-2) FROM dual;

-- trunc() ���� �Լ�. ������ �ڸ��� ���ϸ� ���� ��� ����
SELECT trunc(45.5555,1) FROM dual;

-- ceil() ������ �ø�
SELECT ceil(45.111) FROM dual;

-- Q. HR EMPLOYEES ���̺��� �̸�, �޿�, 10% �λ�� �޿��� ����ϼ���.
SELECT last_name �̸�, salary �޿�, salary*1.1 "�λ�� �޿�"
FROM employees;

-- Q. EMPLOYEE_ID �� Ȧ���� ������ EMPLOYEE_ID�� LAST_NAME�� ����ϼ���

SELECT
    employee_id , last_name
FROM
    employees
WHERE
    mod(employee_id,2) = 1
ORDER BY
    employee_id
;

SELECT employee_id �����ȣ, last_name �̸�
FROM employees
WHERE employee_id IN (SELECT employee_id FROM employees WHERE mod(employee_id,2) = 1)
;

-- Q. EMPLOYEES ���̺��� commission_pct�� Null �� ������ ����ϼ���.
SELECT COUNT(*) FROM employees WHERE commission_pct IS NULL;

-- Q. EMPLOYEES ���̺��� deparment_id�� ���� ������ �����Ͽ� position�� '����' ���� ����ϼ���. (position ���� �߰�)
SELECT
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID
    , NVL(DEPARTMENT_ID,0) AS position
    , DECODE(DEPARTMENT_ID, NULL, '����') AS POSITION
FROM
    employees
WHERE
    department_id IS NULL
;

-- ��¥ ����
SELECT SYSDATE FROM dual;
SELECT SYSDATE+1 FROM dual;
SELECT SYSDATE-1 FROM dual;

SELECT
    last_name, sysdate, hire_date, round(sysdate-hire_date), trunc(sysdate-hire_date) �ٹ��Ⱓ 
FROM
    employees
;

-- add_months() Ư�� ���� ���� ���� ��¥�� ���Ѵ�.
SELECT
    last_name, hire_date, add_months(hire_date,6) revised_date 
FROM
    employees
;

-- last_day() �ش���� ������ ��¥�� ��ȯ�ϴ� �Լ�
SELECT
    last_name, hire_date, last_day(hire_date) 
FROM
    employees
;

SELECT
    last_name, hire_date, last_day(add_months(hire_date,1)) 
FROM
    employees
;

-- next_day() �ش� ��¥�� �������� ������ ���� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ
-- ��~��, 1~7�� ǥ�� ����
SELECT
    hire_date, next_day(hire_date,'��') 
FROM
    employees
;

SELECT
    hire_date, next_day(hire_date,2) 
FROM
    employees
;

-- months_between() ��¥�� ��¥ ������ �������� ���Ѵ�.(���� ���� �Ҽ��� ù°�ڸ�����)
SELECT 
    hire_date, round(months_been(sysdate,hire_date),1) FROM employees;

-- �� ��ȯ �Լ� : to_date()
-- '2023-01-01'�̶�� ���ڿ��� ��¥ Ÿ������ ��ȯ
SELECT TO_DATE('2023-01-01','YYYY/MM/DD') FROM dual;

-- TO_CHAR(��¥) ��¥�� ���ڷ� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD Day HH24MISS') FROM dual;

--����
--YYYY       �� �ڸ� ����
--YY      �� �ڸ� ����
--YEAR      ���� ���� ǥ��
--MM      ���� ���ڷ�
--MON      ���� ���ĺ�����
--DD      ���� ���ڷ�
--DAY      ���� ǥ��
--DY      ���� ��� ǥ��
--D      ���� ���� ǥ��
--AM �Ǵ� PM   ���� ����
--HH �Ǵ� HH12   12�ð�
--HH24      24�ð�
--MI      ��
--SS      ��

-- Q. ���� ��¥(SYSDATE)�� 'YYYY/MM/DD' ������ ���ڿ��� ��ȯ�ϼ���.
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') , SYSDATE FROM dual;

-- Q. '01-01-2023'�̶�� ���ڿ��� ��¥ Ÿ������ ��ȯ�ϼ���.
SELECT TO_DATE('01-01-2023','MM-DD-YYYY'), TO_CHAR(TO_DATE('01-01-2023','MM-DD-YYYY'),'MM-DD-YYYY') FROM dual;
-- Q. ���� ��¥�� �ð�(SYSDATE)�� 'YYYY-MM-DD HH24:MI:SS' ������ ���ڿ��� ��ȯ�ϼ���.
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual;
-- Q. '2023-01-01 15:30:00'�̶�� ���ڿ��� ��¥ �� �ð� Ÿ������ ��ȯ�ϼ���.
SELECT TO_DATE('2023-01-01 15:30:00','YYYY-MM-DD HH24:MI:SS') FROM dual;

--to_char( ���� )   ���ڸ� ���ڷ� ��ȯ
--9      �� �ڸ��� ���� ǥ��      ( 1111, ��99999�� )      1111   
--0      �� �κ��� 0���� ǥ��      ( 1111, ��099999�� )      001111
--$      �޷� ��ȣ�� �տ� ǥ��      ( 1111, ��$99999�� )      $1111
--.      �Ҽ����� ǥ��         ( 1111, ��99999.99�� )      1111.00
--,      Ư�� ��ġ�� , ǥ��      ( 1111, ��99,999�� )      1,111
--MI      �����ʿ� - ��ȣ ǥ��      ( 1111, ��99999MI�� )      1111-
--PR      �������� <>�� ǥ��      ( -1111, ��99999PR�� )      <1111>
--EEEE      ������ ǥ��         ( 1111, ��99.99EEEE�� )      1.11E+03
--V      10�� n�� ���Ѱ����� ǥ��   ( 1111, ��999V99�� )      111100
--B      ������ 0���� ǥ��      ( 1111, ��B9999.99�� )      1111.00
--L      ������ȭ         ( 1111, ��L9999�� )

SELECT salary, to_char(salary, '0999999') FROM employees;
SELECT salary, to_char(-salary, '999999PR') FROM employees;

-- 1111 -> 1.11E+03
SELECT TO_CHAR(11111,'9.999EEEE') FROM dual;
SELECT TO_CHAR(-11111,'999999MI') FROM dual;

-- width_bucket() ������,�ּҰ�,�ִ밪, bucket ����
SELECT width_bucket(92,0,100,10) FROM dual; -- 0~100 ���� 10�������� �߶� �����Ѵ� 92�� 10��°�� �ش�
SELECT width_bucket(100,0,100,10) FROM dual;


-- Q. empoyees ���̺��� salary�� 5�� ������� ǥ���ϼ���
SELECT MAX(salary) max, min(salary) min FROM employees;

SELECT salary, WIDTH_BUCKET(salary,2100,24001,5) AS grade
FROM employees;

-- ���� �Լ� Character Function
-- upper()
SELECT upper('Hello World') FROm dual;
-- lower() �ҹ��� ��ȯ
SELECT lower('Hello World') FROM dual;

-- Q. last_name�� Seo�� ������ last_name�� salary�� ���ϼ���.(Seo, SEO, seo ��� ����)
SELECT
    last_name
    ,salary
FROM
    employees
WHERE
    1=1
    AND lower(last_name) = 'seo'
;

-- initcat() ù���ڸ� �빮��
SELECT job_id, initcap(job_id) FROM employees; 

-- length() ���ڿ��� ����
SELECT job_id, length(job_id) FROM employees;

-- instr() ���ڿ�, ã�� ����, ã�� ��ġ, ã�� ���� �� ���°
SELECT instr('Hello World','o',3,2) from dual;

-- substr() ���ڿ�,������ġ, ����
SELECT substr('Hello World', 3,3) FROM dual;
SELECT substr('Hello World', 9 ,3) FROM dual;
SELECT substr('Hello World',-3,3) FROM dual;

-- lpad() ������ ���� �� ���ʿ� ���ڸ� ä���.
SELECT lpad('Hello World',20,'#') FROM dual;

-- rpad() ���� ���� �� �����ʿ� ���ڸ� ä���.
SELECT rpad('Hello World',20,'#') FROM dual;

-- ltrim()
SELECT ltrim('aaaHello Worldaaa','a') FROM dual;
SELECT ltrim('    Hello World    ') FROM dual;

-- rtrim()
SELECT rtrim('aaaHello Worldaaa','a') FROM dual;
SELECT rtrim('    Hello World    ') FROM dual;

SELECT last_name FROM employees;
SELECT last_name as �̸�, ltrim(last_name, 'A') AS ��ȯ
FROM employees;

-- trim
SELECT trim('   Hello World      ') FROM dual;

-- �� ���� Ư�� ���� ����
SELECT last_name, trim('A' FROM last_name) FROM employees;








