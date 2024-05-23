-- [실습]
-- 현재 hr에 있는 7개 테이블들을 분석해서 인사관리에 의미있는 인사이트 5개 이상을 기술하세요.
-- 인사관리 개선을 위한 KPI 2개를 설정하고 이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증하세요.

-- 1.재직중 직무가 변경된 사원
SELECT
    a.first_name || ' ' || a.last_name AS 이름
    ,a.job_id AS "현재 직무코드"
    ,c1.job_title AS "현재 직무명"
    ,b.job_id AS "이전 직무코드"
    ,c2.job_title AS "이전 직무명"
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
    이름
;


-- 2.입사한지 오래된 직원이 속한 부서의 정보
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
        WHEN INSTR(ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12,1),'.') = 0 -- 근속기간이 정확하게 년도로 떨어지지않고 개월수가 더 있는지 확인
            THEN TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date))/12 || '년' -- 개월수가 없으면 년도만 표시
        WHEN INSTR(ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12,1),'.') > 0 
            THEN TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12) || '년' || TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,hire_date),12)) || '개월' --  개월수가 있을경우 개월수까지 표시
    END AS "근속 기간"
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
    TRUNC(23.4) || '년' || (ROUND(23.4,1)-TRUNC(23.4)) || '월'
FROM
    dual
;
SELECT SUBSTR(TO_CHAR(22.4, '9999.9999'), INSTR(TO_CHAR(22.4, '9999.9999'), '.') + 1) AS fractional_part
FROM dual;

-- 3.가장 많은 직원이 속한 나라

-- sub 직원이 가장 많은 부서
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
    a.cnt AS 인원수
    ,b.department_name AS 부서명
    ,(SELECT country_name FROM countries WHERE country_id = c.country_id) AS 나라이름
FROM
    empl_sub1 a
    ,departments b
    ,locations c
WHERE
    a.department_id = b.department_id
    AND b.location_id = c.location_id
    AND a.rank = 1
;

-- 4.급여 평균이 높은 부서
SELECT
    RANK() OVER(ORDER BY TRUNC(avg(salary)) DESC) AS "평균 급여 순위"
    ,TRUNC(avg(salary)) AS "평균 급여"
    ,b.department_name 부서명
FROM
    employees a
    ,departments b
WHERE
    a.department_id = b.department_id
group by
    a.department_id,b.department_name
;

-- 5.각 부서의 평균 급여와 도시별 평균 급여 같이 보여주기

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
    b.department_name AS 부서명
    ,TRUNC(AVG(a.salary)) AS "부서 평균 급여"
    ,d.city AS 도시명
    ,d.salary AS "도시 평균 급여"
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

-- 근태관리 테이블 - 사원ID,년도, 결근일수 , 주당평균근무시간(주당 40시간) - 기존 사원테이블과 부서테이블로 결근이 가장 많은 사원과부서, 근무를 가장 많이한 사원과 부서 조회
-- 샘플데이터 

-- 인력유지 퇴사자 사유
-- 퇴사자 정보 테이블 , 퇴사자들의 지역/급여/직급/직무를 가짜 정보로 다 넣은 다음에 해당 테이블를 조회해서 가장 퇴사자가많은 지역, 퇴사자가 많은 급여,
/*
    EMPLOYEE_ID -- 기존 EMPLOYEES테이블에 없는 정보
    START_DATE
    END_DATE
    JOB_ID
    JOB_TITLE
    DEPARTMENT_ID
    DEPARTMENT_NAME 
    퇴사 사유    
*/
-- 
    

-- 테이블 삭제
DROP TABLE loc;

-- 테이블 생성
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

-- 테이블에 들어갈 정보 조회
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

-- 조회된 정보들 테이블에 저장
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




