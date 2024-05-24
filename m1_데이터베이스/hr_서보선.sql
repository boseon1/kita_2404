-- [실습]
-- 현재 hr에 있는 7개 테이블들을 분석해서 인사관리에 의미있는 인사이트 5개 이상을 기술하세요.
-- 인사관리 개선을 위한 KPI 2개를 설정하고 이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증하세요.

-- 1.직무가 변경된 사원
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
FROM
    departments a
    ,em_period b
    ,locations c
WHERE
    a.department_id = b.department_id
    and a.location_id = c.location_id
    and b.rank_emp = 1
;


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

-- 도시별 평균급여
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
-- 테이블명 : TA_MANAGEMENT
-- 샘플데이터 
/*
CREATE TABLE TA_MANAGEMENT(
    EMPLOYEE_ID NUMBER,
    WORK_YEAR DATE ,
    ABSENCE_DAYS NUMBER,
    AVG_WORK_HOURS_PER_WEEK NUMBER
)
*/

DROP TABLE TA_MANAGEMENT;

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


COMMIT;


SELECT * FROM TA_MANAGEMENT;

-- 기존 사원테이블과 부서테이블로 결근이 가장 많은 사원과부서, 근무를 가장 많이한 사원과 부서 조회

-- 결근을 가장많이 한 사원, 근무를 가장 많이 한 사원
-- 사원이름,결근일수,근무시간

-- 연도별 결근 가장 많이 한 직원
WITH year_absence_rank AS(
    SELECT
        e.employee_id
        ,e.first_name || ' ' || e.last_name AS name 
        ,t.work_year
        ,RANK() OVER(PARTITION BY t.work_year ORDER BY t.absence_days DESC) AS rank_year    --  연도별로 결근일수가 많은 사람을 구한다
        ,t.absence_days 
    FROM
        ta_management t
        ,employees e
    WHERE
        t.employee_id = e.employee_id
)
-- 연도별 근무를 가장많이 한 사원
,year_work_rank AS(
    SELECT
        e.employee_id
        ,e.first_name || ' ' || e.last_name AS name 
        ,t.work_year
        ,RANK() OVER(PARTITION BY t.work_year ORDER BY t.avg_work_hours_per_week DESC) AS rank_week
        ,t.avg_work_hours_per_week
    FROM
        ta_management t
        ,employees e
    WHERE   
        t.employee_id = e.employee_id
)

SELECT
    a.work_year
    ,a.name AS "결근일수가 많은 사원"
    ,a.absence_days "결근 일수"
    ,b.name "야근시간이 많은 사원"
    ,b.avg_work_hours_per_week "야근 시간"
FROM
    year_absence_rank a
    ,year_work_rank b
WHERE
    a.work_year = b.work_year
    AND a.rank_year = 1 
    AND b.rank_week = 1
;



-- 인력유지 퇴사자 사유
-- 퇴사자 정보 테이블 , 퇴사자들의 지역/급여/직급/직무를 가짜 정보로 다 넣은 다음에 해당 테이블를 조회해서 가장 퇴사자가많은 지역, 퇴사자가 많은 급여,
-- resignation
/*
    EMPLOYEE_ID 외부키 -- 기존 EMPLOYEES테이블에 없는 정보
    START_DATE
    END_DATE
    JOB_ID
    JOB_TITLE
    DEPARTMENT_ID
    DEPARTMENT_NAME 
    퇴사 사유    
    
    EMPLOYEE_ID	NUMBER(6,0)
    START_DATE	DATE
    END_DATE	DATE
    JOB_ID	VARCHAR2(10 BYTE)
    DEPARTMENT_ID	NUMBER(4,0)
*/
-- 

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

INSERT INTO resignation VALUES (67, TO_DATE('2021-09-05', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), 'SA_MAN', 'Sales Manager', 50, 'Shipping', '회사 경영 정책 변화');
INSERT INTO resignation VALUES (18, TO_DATE('2022-03-12', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), 'HR_REP', 'Human Resources Representative', 100, 'Finance', '직무 불만족');
INSERT INTO resignation VALUES (82, TO_DATE('2021-12-30', 'YYYY-MM-DD'), TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'AC_ACCOUNT', 'Public Accountant', 190, 'Contracting', '이직');
INSERT INTO resignation VALUES (57, TO_DATE('2022-04-18', 'YYYY-MM-DD'), TO_DATE('2022-12-05', 'YYYY-MM-DD'), 'FI_MGR', 'Finance Manager', 70, 'Public Relations', '회사 경영 정책 변화');
INSERT INTO resignation VALUES (39, TO_DATE('2022-02-28', 'YYYY-MM-DD'), TO_DATE('2022-10-15', 'YYYY-MM-DD'), 'PU_MAN', 'Purchasing Manager', 160, 'Benefits', '경제적 이유');
INSERT INTO resignation VALUES (67, TO_DATE('2021-10-10', 'YYYY-MM-DD'), TO_DATE('2022-06-25', 'YYYY-MM-DD'), 'ST_CLERK', 'Stock Clerk', 130, 'Corporate Tax', '다른 분야로의 전직');
INSERT INTO resignation VALUES (29, TO_DATE('2021-08-20', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'SH_CLERK', 'Shipping Clerk', 50, 'Shipping', '경제적 이유');
INSERT INTO resignation VALUES (93, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 60, 'IT', '회사 퇴행');
INSERT INTO resignation VALUES (50, TO_DATE('2021-11-28', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'MK_MAN', 'Marketing Manager', 20, 'Marketing', '직무 불만족');
INSERT INTO resignation VALUES (15, TO_DATE('2021-07-22', 'YYYY-MM-DD'), TO_DATE('2022-03-10', 'YYYY-MM-DD'), 'PR_REP', 'Public Relations Representative', 250, 'Retail Sales', '경영 철학의 불일치');
INSERT INTO resignation VALUES (107, TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 60, 'IT', '급여 불만족');
INSERT INTO resignation VALUES (88, TO_DATE('2022-03-05', 'YYYY-MM-DD'), TO_DATE('2022-10-20', 'YYYY-MM-DD'), 'PU_MAN', 'Purchasing Manager', 160, 'Benefits', '직무 불만족');
INSERT INTO resignation VALUES (22, TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'PR_REP', 'Public Relations Representative', 190, 'Contracting', '경제적 이유');
INSERT INTO resignation VALUES (93, TO_DATE('2021-12-12', 'YYYY-MM-DD'), TO_DATE('2022-07-28', 'YYYY-MM-DD'), 'HR_REP', 'Human Resources Representative', 100, 'Finance', '이직');
INSERT INTO resignation VALUES (55, TO_DATE('2022-02-08', 'YYYY-MM-DD'), TO_DATE('2022-09-23', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 200, 'Operations', '경제적 이유');
INSERT INTO resignation VALUES (81, TO_DATE('2021-08-17', 'YYYY-MM-DD'), TO_DATE('2022-03-03', 'YYYY-MM-DD'), 'AC_MGR', 'Accounting Manager', 60, 'IT', '직무 불만족');
INSERT INTO resignation VALUES (19, TO_DATE('2021-10-28', 'YYYY-MM-DD'), TO_DATE('2022-06-12', 'YYYY-MM-DD'), 'AC_ACCOUNT', 'Public Accountant', 70, 'Public Relations', '회사 경영 정책 변화');
INSERT INTO resignation VALUES (61, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), 'SA_MAN', 'Sales Manager', 80, 'Sales', '가족 이유로 인한 퇴사');
INSERT INTO resignation VALUES (37, TO_DATE('2021-07-04', 'YYYY-MM-DD'), TO_DATE('2022-02-18', 'YYYY-MM-DD'), 'MK_MAN', 'Marketing Manager', 160, 'Benefits', '이직');
INSERT INTO resignation VALUES (49, TO_DATE('2022-04-22', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), 'PU_MAN', 'Purchasing Manager', 100, 'Finance', '경제적 이유');
INSERT INTO resignation VALUES (84, TO_DATE('2021-11-10', 'YYYY-MM-DD'), TO_DATE('2022-06-25', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 200, 'Operations', '직무 불만족');
INSERT INTO resignation VALUES (29, TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), 'ST_MAN', 'Stock Manager', 120, 'Treasury', '이직');
INSERT INTO resignation VALUES (73, TO_DATE('2021-09-03', 'YYYY-MM-DD'), TO_DATE('2022-04-18', 'YYYY-MM-DD'), 'FI_MGR', 'Finance Manager', 70, 'Public Relations', '경제적 이유');
INSERT INTO resignation VALUES (59, TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2023-01-29', 'YYYY-MM-DD'), 'SH_CLERK', 'Shipping Clerk', 140, 'Control And Credit', '급여 불만족');
INSERT INTO resignation VALUES (15, TO_DATE('2021-08-07', 'YYYY-MM-DD'), TO_DATE('2022-03-22', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 150, 'Shareholder Services', '경제적 이유');
INSERT INTO resignation VALUES (78, TO_DATE('2021-10-25', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'MK_MAN', 'Marketing Manager', 160, 'Benefits', '직무 불만족');
INSERT INTO resignation VALUES (43, TO_DATE('2022-03-18', 'YYYY-MM-DD'), TO_DATE('2022-10-02', 'YYYY-MM-DD'), 'MK_REP', 'Marketing Representative', 170, 'Manufacturing', '경제적 이유');
INSERT INTO resignation VALUES (102, TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2022-07-16', 'YYYY-MM-DD'), 'HR_REP', 'Human Resources Representative', 180, 'Construction', '회사 퇴행');
INSERT INTO resignation VALUES (36, TO_DATE('2022-01-05', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 'PR_REP', 'Public Relations Representative', 190, 'Contracting', '급여 불만족');
INSERT INTO resignation VALUES (63, TO_DATE('2021-09-14', 'YYYY-MM-DD'), TO_DATE('2022-04-29', 'YYYY-MM-DD'), 'IT_PROG', 'Programmer', 200, 'Operations', '직무 불만족');

COMMIT;

    

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




