---------------------- Entities: EMPLOYEES,DEPARTMENTS,JOBS,JOB_HISTORY,LOCATIONS,COUNTRIES,REGIONS
---------------------- Attributes:  
-- EMPLOYEES: EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
-- DEPARTMENTS: DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
-- JOBS: JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
-- JOB_HISTORY: EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID
-- LOCATIONS: LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID
-- COUNTRIES: COUNTRY_ID, COUNTRY_NAME, COUNTRY_NAME, REGION_ID
-- REGIONS: REGION_ID, REGION_NAME

-- 실습
-- 현재 hr에 있는 7개 테이블을 분석해서 인사관리에 의미있는 인사이트 5개 이상을 기술하세요
-- 인사관리 개선을 위한 KPI 2개를 설정하고 이것들을 테이블의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증하세요

-- VIEW POINTS: (1) 인사 DB 관리 측면 (DATA 간 CONSISTENCY ISSUE, 충분한 DATA 확보 여부) 
--              (2) 인력 관리/평가 측면 (근태, 개인 목표 지표 달성 MONITORING)에서 보완점
--              (3) 인적 역량 향상/경쟁력 강화를 위한 인사관리 SYSTEM의 구축에 필요한 보안점
--              (4) GREAT WORK PLACE(GWP), WORK-LIFE BALANCE를 위한 HR-DB나 인사 관리

-- INSIGHT-1 : 인사 DB 관리 측면에서 현재 7개의 EMPLOYEES,DEPARTMENTS,JOBS,JOB_HISTORY,LOCATIONS,COUNTRIES,REGIONS TABLE이 있지만 REDUNDANCY가 많고 비효율적 
            -- ROCATION/CONTRY/REGION 는 한 TABLE로 통합관리하는게 효율적, EMPLOYEES/DEPARTMENT는 일부 중복 요소를 EMPLOYEES로 통합 관리할 필요가 있음
            -- TABLE 간 PRIMARY/FOREIGN KEY 종속성 부여 필요

-- INSIGHT-2 : DATA간 INCONSISTENCY ISSUE & REDUDANCY 문제
            -- (EMPLOYEES 테이블의 MANAGER_ID와 EMPLOYEES 테이블에 개인별로 ASSIGN된 DEPARTMENT_ID로 DEPARTMENTS 테이블에서의 DEPARTMENT별 MANAGER_ID간 미스매치 
            -- 부서 ASSIGN이 안된 직원 (KIMBERELY GRANT)
            -- DEPARTMENTS에서 DEPARTMENT_ID: 120~270에 대해 MANAGER가 ASSIGN 안됨 (부서원이 존재 하지 않아서 문제는 되지 않지만, 그렇더라도 REDUNDANT DATA)
            -- 직원 핸드폰 번호에 INVALID FORMAT의 전화 번호 미국: XXX.XXX.XXXX (O), 영국: (0XX(X).XXX(X).XXXX TYPE), 

-- INSIGHT-3 : 인력 관리/평가 측면 HR 부서 MANDATORY DB의 부재
            -- (관리) 근태 관리 DB BUILDING이 필요
            -- (관리) 과다 근무자, 잉여 근무자 관리 SYSTEM 필요 ==> 인력 재조정
            -- (관리) HR의 핵심: 인력 확보/유지. 그런 의미에서 퇴사자들에대한 정보의 부재 (JOB-HISTORY, 퇴직원인 분석, 근속,부서,연봉, 이직,..)
            -- (평가) 성과 관리 DB BUILDING이 필요 (개인별 ==> INDIVIDUAL_PERF, 부서별: DEPARTMENTS==> DEPARTMENT_PERF)
            -- (평가) 개인 (개인 연차별, 지역별, 부서별, 직무별,..) SALARY 분석 쿼리 필요
            
-- INSIGHT-4 : 조직원 역량 강화를 위한 관리 DB의 부재            
            -- 저역량 직원들에 대한 업무 SKILL-UP 기회 보장: 
               저평가자(저연봉자)을 위한 교육/MENTORING 제도 (MENTOR:상위평가자/선배, MENTEE: 저평가자)
            -- 업무 성과에 따른 성과금 명복의 COMMISSION PERCENT는 SALES 부서에만 책정
            
-- INSIGHT-5 : GREAT WORK PLACE (GWP), WORK - LIFE BALANCE를 위한 HR-DB나 관리 프로그램 부재(회사/조직의 영속성/개선)
            -- 임직원 건강 (건진/지병/업무/부서 STRESS...) 관련 DB의 부재
            -- 근무 시간 조정 DB(개인별/부서멸 인력 충원 근무시간 BALANCE 유도를 위한 DB)
            -- HR 부서에서 명상/마음건강/건진... 프로그램 개설/관리 

-- REMARKS: DB내 DATA간 INCONSISTENCY ISSUE 중요성

--------------------------------------------- KPI (Key Performance Indicator/index) ---------------------------------------------
-- Key: (1) 중요성, (2) 측정 가능한 정량적 지표, (3) 시기별 관리 가능

-- KPI-1 : (1-1) DB의 REDUNDANCY 제거, 기존 TABLE을 COMPACT하게 개선, DATA INCONSISTENCY 제거
              -- EMPLOYEES&(DEPARTMENT 일부 속성) ==> EMPLOYEES_NEW TABLE
              -- LOCATIONS/COUNTRIES/REGIONS ==> LOCATIONS 통합 관리
              -- PRIMARY/FOREIGN KEY 설정
        -- (1-2) 인사관리 개선위한 신규 DATA TABLE 생성/관리
              -- 근태 (TA_MANAGEMENT), 성과 (INDIVIDUAL_PERF,DEPARTMENTS==>DEPARTMENT_PERF), 퇴직자(RESIGNEE) 관리 DB TABLE 생성
              
-- KPI-2 : 인적 자원 관리의 개선
              -- 근태 (TA_MANAGEMENT) DB ==> 쿼리 ==> 근무 과다자, 부실 근태자 도출 ==> 업무 BALANCE/부서 조정, 명상 프로그램 권고
              -- 목표 대비 성과 관리 (개인/부서 합산) DB ==> 쿼리 ==> 상벌(INCENTIVE 부여)자 선정
              -- 하위 성과자를 위한 교육 프로그램 및 MENTOR/MENTEE 프로그램 기획/ 대상자 선정.
              -- 건강 관리 / 면답 관리 DB ==> 인사 특이점 발굴


--------------------------------------------------------------------------------- FLATTEN ALL DB TO REVIEW DATA CONSISTENCY
DROP VIEW EMPLOYEES_NEW;
CREATE VIEW EMPLOYEES_NEW AS
SELECT 
    E.EMPLOYEE_ID 사번,
    E.FIRST_NAME || ' ' || E.LAST_NAME 이름,
    E.EMAIL 이메일,
    E.PHONE_NUMBER 핸드폰번호,
    E.HIRE_DATE 입사일자,
    FLOOR(MONTHS_BETWEEN(SYSDATE, E.HIRE_DATE) / 12) 연차,
    E.SALARY 급여,
    CASE WHEN E.SALARY BETWEEN J.MIN_SALARY AND J.MAX_SALARY THEN 'IN_RANGE' ELSE 'OUT_RANGE' END AS 급여범위,
    DECODE(E.COMMISSION_PCT, NULL, 'N', E.COMMISSION_PCT) 매출성과,
    E.JOB_ID  담당업무,
    E.MANAGER_ID 담당매니저ID,
    M.FIRST_NAME || ' ' || M.LAST_NAME AS 담당매니저,
    E.DEPARTMENT_ID 부서ID,
    D.DEPARTMENT_NAME 부서명,
    D.MANAGER_ID 담당매니저ID2,
    DECODE(E.MANAGER_ID, D.MANAGER_ID, '정합', '부정합') AS 매니저정합성,
    L.CITY 근무도시,
    C.COUNTRY_ID 근무국가,
    R.REGION_NAME 근무대륙
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
        -- 담당매니저ID VS. 담당매니저ID2 부터 데이터 부정합성 확인
        -- 모든 인사 관리 DB에는 단순 직원의 정보만 있어 1~2개의 DB로 통합 관리하는 것이 효율적임
        -- DEPARTMENTS에서 DEPARTMENT_ID: 120~270에 대해 MANAGER가 ASSIGN 안됨 (부서원이 존재 하지 않아서 문제는 되지 않지만, 그렇더라도 REDUNDANT DATA) 확인

SELECT * FROM EMPLOYEES_NEW 
WHERE 부서명 IS NULL;            

            -- 직원 핸드폰 번호에 INVALID FORMAT의 전화 번호 미국: XXX.XXX.XXXX (O), 영국: (0XX(X).XXX(X).XXXX TYPE) 확인
SELECT 
    사번,이름,핸드폰번호,근무국가,
    CASE
        WHEN 근무국가 = 'UK' AND (REGEXP_LIKE(핸드폰번호, '^0[0-9]{2}\.[0-9]{4}\.[0-9]{4}$') OR REGEXP_LIKE(핸드폰번호, '^0[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')) THEN 'PASS'
        WHEN 근무국가 = 'US' AND REGEXP_LIKE(핸드폰번호, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 'PASS'
        ELSE 'FAIL'
    END AS VALID_HP
FROM 
    EMPLOYEES_NEW;

-------------------------------------------------------------------------------------------------------------------------------
SELECT 
    사번, 
    이름, 
    연차, 
    급여,
    담당업무, 
    부서명, 
    근무도시, 
    근무국가, 
    근무대륙,
    ROUND(AVG(급여) OVER (PARTITION BY 연차)) AS 연차별평균급여,
    ROUND(AVG(급여) OVER (PARTITION BY 담당업무)) AS 담당업무별평균급여,
    ROUND(AVG(급여) OVER (PARTITION BY 부서명)) AS 부서별평균급여,
    ROUND(AVG(급여) OVER (PARTITION BY 근무도시)) AS 근무도시별평균급여,
    ROUND(AVG(급여) OVER (PARTITION BY 근무국가)) AS 근무국가별평균급여,
    ROUND(AVG(급여) OVER (PARTITION BY 근무대륙)) AS 근무대륙별평균급여
FROM 
    EMPLOYEES_NEW;




DROP VIEW EMPLOYEES_NEW;
DROP TABLE EMPLOYEES_NEW CASCADE CONSTRAINTS PURGE;

--------------------------------------------------------------- VIEW가 아닌 실재 NEW TABLE을 생성
-- EMPLOYEES_NEW 테이블 생성
CREATE TABLE EMPLOYEES_NEW (
    사번 NUMBER,
    이름 VARCHAR2(100),
    이메일 VARCHAR2(100),
    핸드폰번호 VARCHAR2(20),
    입사일자 DATE,
    연차 NUMBER,
    급여 NUMBER,
    급여범위 VARCHAR2(20),
    매출성과 VARCHAR2(10),
    담당업무 VARCHAR2(100),
    담당매니저ID NUMBER,
    담당매니저 VARCHAR2(100),
    부서ID NUMBER,
    부서명 VARCHAR2(100),
    담당매니저ID2 NUMBER,
    매니저정합성 VARCHAR2(10),
    근무도시 VARCHAR2(100),
    근무국가 VARCHAR2(2),
    근무대륙 VARCHAR2(100)
);

-- EMPLOYEES_NEW에 데이터 INSERT
INSERT INTO EMPLOYEES_NEW (
    사번,
    이름,
    이메일,
    핸드폰번호,
    입사일자,
    연차,
    급여,
    급여범위,
    매출성과,
    담당업무,
    담당매니저ID,
    담당매니저,
    부서ID,
    부서명,
    담당매니저ID2,
    매니저정합성,
    근무도시,
    근무국가,
    근무대륙
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
    DECODE(E.MANAGER_ID, D.MANAGER_ID, '정합', '부정합'),
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

SELECT * FROM EMPLOYEES_NEW ORDER BY 사번;

------------------------------------------------------------- INVALID TYPE 전화 번호 수정
UPDATE EMPLOYEES_NEW
SET 핸드폰번호 = 
    CASE 
        WHEN 근무국가 = 'UK' THEN 
            CASE 
                WHEN REGEXP_LIKE(핸드폰번호, '^0[0-9]{2}\.[0-9]{4}\.[0-9]{4}$') OR 
                     REGEXP_LIKE(핸드폰번호, '^0[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 
                         핸드폰번호
                ELSE
                    '0' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0')
            END
        WHEN 근무국가 = 'US' THEN 
            CASE 
                WHEN REGEXP_LIKE(핸드폰번호, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$') THEN 
                    핸드폰번호
                ELSE
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 999)), 3, '0') || '.' ||
                    LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0')
            END
    END;

SELECT * FROM EMPLOYEES_NEW;
------------------------------------------------------------- 매니저부정합 수정
UPDATE EMPLOYEES_NEW SET 담당매니저ID = 담당매니저ID2;

------------------------------------------------------------- 부서 누락 직원 (KIMBERELY GRANT) DATA 수정
UPDATE EMPLOYEES_NEW
SET 
    담당매니저ID = 145,
    부서ID = 80,
    부서명 = 'Sales',
    근무도시 = 'Oxford',
    근무국가 = 'UK',
    근무대륙 = 'Europe'
WHERE 사번 = 178;

--------------------------------여기 부터 검증 필요

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;
SELECT * FROM JOB_HISTORY;
SELECT * FROM LOCATIONS;
SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;



