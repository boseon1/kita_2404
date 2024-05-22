-- [실습]
-- 현재 hr에 있는 7개 테이블들을 분석해서 인사관리에 의미있는 인사이트 5개 이상을 기술하세요.
-- 인사관리 개선을 위한 KPI 2개를 설정하고 이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증하세요.

-- 재직중 직무가 변경된 사원
SELECT
    a.first_name || ' ' || a.last_name AS 이름
    ,a.job_id AS "현재 직무코드"
    ,(SELECT job_title FROM jobs WHERE job_id = a.job_id) AS "현재 직무명"
    ,b.job_id AS "이전 직무코드"
    ,(SELECT job_title FROM jobs WHERE job_id = b.job_id) AS "이전 직무명"
FROM
    employees a
    , job_history b
WHERE
    a.employee_id = b.employee_id
    AND a.job_id != b.job_id
;

-- 입사한지 오래된 직원이 속한 부서의 정보
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

-- 가장 많은 직원이 속한 나라

-- sub 직원이 가장 많은 부서
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