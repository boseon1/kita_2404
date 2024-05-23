-- [�ǽ�]
-- ���� hr�� �ִ� 7�� ���̺���� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5�� �̻��� ����ϼ���.
-- �λ���� ������ ���� KPI 2���� �����ϰ� �̰͵��� ���̺���� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� �����ϼ���.

-- 1.������ ������ ����� ���
SELECT
    a.first_name || ' ' || a.last_name AS �̸�
    ,a.job_id AS "���� �����ڵ�"
    ,c1.job_title AS "���� ������"
    ,b.job_id AS "���� �����ڵ�"
    ,c2.job_title AS "���� ������"
FROM
    employees a
    , job_history b
    , jobs c1
    , jobs c2
WHERE
    a.employee_id = b.employee_id
    AND a.job_id = c1.job_id
    AND b.job_id = c2.job_id
    AND a.job_id != b.job_id
ORDER BY
    �̸�
;


-- 2.�Ի����� ������ ������ ���� �μ��� ����
WITH em_period AS(
    SELECT
        a.first_name || ' ' || a.last_name AS name
        ,RANK() OVER (ORDER BY trunc(SYSDATE-a.hire_date) desc) AS rank_emp
        ,a.department_id
        ,b.job_title
        ,a.hire_date
    FROM
        employees a
        ,jobs b
    WHERE
        a.job_id = b.job_id
)

SELECT
    b.name
    ,a.department_name
    ,b.job_title
    ,c.city
    ,c.street_address
    ,TO_CHAR(b.hire_date,'YYYY-MM-DD') as hire_date
    , CASE 
        WHEN INSTR(ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12,1),'.') = 0 -- �ټӱⰣ�� ��Ȯ�ϰ� �⵵�� ���������ʰ� �������� �� �ִ��� Ȯ��
            THEN TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date))/12 || '��' -- �������� ������ �⵵�� ǥ��
        WHEN INSTR(ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12,1),'.') > 0 
            THEN TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12) || '��' || TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,hire_date),12)) || '����' --  �������� ������� ���������� ǥ��
    END AS "�ټ� �Ⱓ"
    ,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12,1)
FROM
    departments a
    ,em_period b
    ,locations c
WHERE
    a.department_id = b.department_id
    and a.location_id = c.location_id
    and b.rank_emp = 1
;

SELECT
    TRUNC(23.4) || '��' || (ROUND(23.4,1)-TRUNC(23.4)) || '��'
FROM
    dual
;
SELECT SUBSTR(TO_CHAR(22.4, '9999.9999'), INSTR(TO_CHAR(22.4, '9999.9999'), '.') + 1) AS fractional_part
FROM dual;

-- 3.���� ���� ������ ���� ����

-- sub ������ ���� ���� �μ�
WITH empl_sub1 AS (
    SELECT
        a.department_id
        ,RANK() OVER(ORDER BY count(*) DESC) as rank
        ,COUNT(*) AS cnt
    FROM
        employees a
    GROUP BY
        a.department_id
)

SELECT
    a.cnt AS �ο���
    ,b.department_name AS �μ���
    ,(SELECT country_name FROM countries WHERE country_id = c.country_id) AS �����̸�
FROM
    empl_sub1 a
    ,departments b
    ,locations c
WHERE
    a.department_id = b.department_id
    AND b.location_id = c.location_id
    AND a.rank = 1
;

-- 4.�޿� ����� ���� �μ�
SELECT
    RANK() OVER(ORDER BY TRUNC(avg(salary)) DESC) AS "��� �޿� ����"
    ,TRUNC(avg(salary)) AS "��� �޿�"
    ,b.department_name �μ���
FROM
    employees a
    ,departments b
WHERE
    a.department_id = b.department_id
group by
    a.department_id,b.department_name
;

-- 5.�� �μ��� ��� �޿��� ���ú� ��� �޿� ���� �����ֱ�

WITH city_salary AS (
    SELECT
        TRUNC(avg(a.salary)) AS salary
        ,c.city AS city
    FROM
        employees a
        ,departments b
        ,locations c
    WHERE
        a.department_id = b.department_id
        AND b.location_id = c.location_id
    group by
        c.city
)

SELECT
    b.department_name AS �μ���
    ,TRUNC(AVG(a.salary)) AS "�μ� ��� �޿�"
    ,d.city AS ���ø�
    ,d.salary AS "���� ��� �޿�"
FROM
    employees a
    ,departments b
    ,locations c
    ,city_salary d
WHERE
    a.department_id = b.department_id
    AND b.location_id = c.location_id
    AND c.city = d.city
GROUP BY
    b.department_name
    ,d.city
    ,d.salary
;

-- ���°��� ���̺� - ���ID,�⵵, ����ϼ� , �ִ���ձٹ��ð�(�ִ� 40�ð�) - ���� ������̺�� �μ����̺�� ����� ���� ���� ������μ�, �ٹ��� ���� ������ ����� �μ� ��ȸ
-- ���õ����� 

-- �η����� ����� ����
-- ����� ���� ���̺� , ����ڵ��� ����/�޿�/����/������ ��¥ ������ �� ���� ������ �ش� ���̺� ��ȸ�ؼ� ���� ����ڰ����� ����, ����ڰ� ���� �޿�,
/*
    EMPLOYEE_ID -- ���� EMPLOYEES���̺� ���� ����
    START_DATE
    END_DATE
    JOB_ID
    JOB_TITLE
    DEPARTMENT_ID
    DEPARTMENT_NAME 
    ��� ����    
*/
-- 
    

-- ���̺� ����
DROP TABLE loc;

-- ���̺� ����
CREATE TABLE loc (
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
    loc 
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

commit;

SELECT * FROM loc;




