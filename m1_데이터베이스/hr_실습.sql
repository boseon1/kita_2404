-- [�ǽ�]
-- ���� hr�� �ִ� 7�� ���̺���� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5�� �̻��� ����ϼ���.
-- �λ���� ������ ���� KPI 2���� �����ϰ� �̰͵��� ���̺���� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� �����ϼ���.

-- ������ ������ ����� ���
SELECT
    a.first_name || ' ' || a.last_name AS �̸�
    ,a.job_id AS "���� �����ڵ�"
    ,(SELECT job_title FROM jobs WHERE job_id = a.job_id) AS "���� ������"
    ,b.job_id AS "���� �����ڵ�"
    ,(SELECT job_title FROM jobs WHERE job_id = b.job_id) AS "���� ������"
FROM
    employees a
    , job_history b
WHERE
    a.employee_id = b.employee_id
    AND a.job_id != b.job_id
;

-- �Ի����� ������ ������ ���� �μ��� ����
WITH em_period AS(
    SELECT
        a.first_name || ' ' || a.last_name AS name
        ,RANK() OVER (ORDER BY trunc(SYSDATE-a.hire_date) desc) AS rank_emp
        ,a.department_id
        ,b.job_title
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
FROM
    DEPARTMENTS a
    ,em_period b
    ,LOCATIONS c
WHERE
    a.department_id = b.department_id
    and a.location_id = c.location_id
    and b.rank_emp = 1
;

-- ���� ���� ������ ���� ����

-- sub ������ ���� ���� �μ�
WITH empl_sub1 AS (
    SELECT
        a.department_id
        ,RANK() OVER(ORDER BY count(*) DESC) as rank
        ,COUNT(*)
    FROM
        employees a
    GROUP BY
        a.department_id
)

SELECT
    a.*
    ,b.location_id
    ,c.country_id
    ,(SELECT country_name FROM countries WHERE country_id = c.country_id) AS country_name
FROM
    empl_sub1 a
    ,departments b
    ,locations c
WHERE
    a.department_id = b.department_id
    AND b.location_id = c.location_id
    AND a.rank = 1
;