select * from employees;

-- Q. 사번이 120번인 사람의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력
SELECT
    e.employee_id 사번, e.first_name 이름, e.last_name 성, e.job_id 업무, J.job_title 업무명
FROM
    employees E
INNER JOIN jobs J ON E.job_id = J.job_id
WHERE
    E.employee_id = 120
;

-- FIRST_NAME || ' ' || LAST_NAME AS 이름: FIRST_NAME과 LAST_NAME을 공백으로 연결하여
-- 하나의 문자열로 합치고, 이 결과의 별칭을 이름으로 지정

SELECT
    e.employee_id 사번, e.first_name || ' ' || e.last_name AS 이름, e.job_id 업무, J.job_title 업무명
FROM
    employees E
    ,jobs J 
WHERE
    E.employee_id = 120
    and e.job_id = j.job_id
;

-- Q. 2005년 상반기에 입사한 사람들의 이름(Full name)만 출력
SELECT
    first_name || ' ' || last_name as 이름
    ,hire_date 입사일
FROM
    employees
WHERE
    --TO_CHAR(hire_date,'yymmdd') >= '050701'
    TO_CHAR(hire_date,'YY/MM') between '05/01' AND '05/06'
;
-- _을 와일드카드가 아닌 문자로 취급하고 싶을 때 escape 옵션을 사용
select * from employees where job_id like '%\_A%';
select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#';


-- IN : OR 대신 사용
SELECT * FROM employees WHERE manager_id = 101 or manager_id = 102 or manager_id = 103;
SELECT * FROM employees WHERE manager_id in (101,102,103);

-- Q. 업무 SA_MAN, IT_PROG, ST_MAN 인 사람만 출력
SELECT
    *
FROM
    employees
WHERE
    job_id in ('SA_MAN','IT_PROG','ST_MAN')
;

-- IS NULL / IS NOT NULL
-- null 값인지를 확인할 경우 = 비교 연산자를 사용하지 않고 is null을 사용한다.
SELECT * FROM employees WHERE commission_pct is null;
SELECT * FROM employees WHERE commission_pct is not null;

-- ORDER BY
-- ORDER BY 컬럼명 [ASC | DESC]
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary asc, last_name desc;

-- DUAL 테이블
-- mod 나머지
SELECT * FROM employees WHERE mod (employee_id,2) = 1;
SELECT mod(10,3) FROM dual;

-- round()
SELECT round(355.9555) FROM dual;
SELECT round(355.9555,2 ) FROM dual;
SELECT round(355.9555,-2) FROM dual;

-- trunc() 버림 함수. 지정한 자리수 이하를 버린 결과 제공
SELECT trunc(45.5555,1) FROM dual;

-- ceil() 무조건 올림
SELECT ceil(45.111) FROM dual;

-- Q. HR EMPLOYEES 테이블에서 이름, 급여, 10% 인상된 급여를 출력하세요.
SELECT last_name 이름, salary 급여, salary*1.1 "인상된 급여"
FROM employees;

-- Q. EMPLOYEE_ID 가 홀수인 직원의 EMPLOYEE_ID와 LAST_NAME을 출력하세요

SELECT
    employee_id , last_name
FROM
    employees
WHERE
    mod(employee_id,2) = 1
ORDER BY
    employee_id
;

SELECT employee_id 사원번호, last_name 이름
FROM employees
WHERE employee_id IN (SELECT employee_id FROM employees WHERE mod(employee_id,2) = 1)
;

-- Q. EMPLOYEES 테이블에서 commission_pct의 Null 값 갯수를 출력하세요.
SELECT COUNT(*) FROM employees WHERE commission_pct IS NULL;

-- Q. EMPLOYEES 테이블에서 deparment_id가 없는 직원을 추출하여 position을 '신입' 으로 출력하세요. (position 열을 추가)
SELECT
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID
    , NVL(DEPARTMENT_ID,0) AS position
    , DECODE(DEPARTMENT_ID, NULL, '신입') AS POSITION
FROM
    employees
WHERE
    department_id IS NULL
;

-- 날짜 관련
SELECT SYSDATE FROM dual;
SELECT SYSDATE+1 FROM dual;
SELECT SYSDATE-1 FROM dual;

SELECT
    last_name, sysdate, hire_date, round(sysdate-hire_date), trunc(sysdate-hire_date) 근무기간 
FROM
    employees
;

-- add_months() 특정 개월 수를 더한 날짜를 구한다.
SELECT
    last_name, hire_date, add_months(hire_date,6) revised_date 
FROM
    employees
;

-- last_day() 해당월의 마지막 날짜를 반환하는 함수
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

-- next_day() 해당 날짜를 기준으로 다음에 오는 요일에 해당하는 날짜를 변환
-- 일~토, 1~7로 표현 가능
SELECT
    hire_date, next_day(hire_date,'월') 
FROM
    employees
;

SELECT
    hire_date, next_day(hire_date,2) 
FROM
    employees
;

-- months_between() 날짜와 날짜 사이의 개월수를 구한다.(개월 수를 소수점 첫째자리까지)
SELECT 
    hire_date, round(months_been(sysdate,hire_date),1) FROM employees;

-- 형 변환 함수 : to_date()
-- '2023-01-01'이라는 문자열을 날짜 타입으로 변환
SELECT TO_DATE('2023-01-01','YYYY/MM/DD') FROM dual;

-- TO_CHAR(날짜) 날짜를 문자로 변환
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD Day HH24MISS') FROM dual;

--형식
--YYYY       네 자리 연도
--YY      두 자리 연도
--YEAR      연도 영문 표기
--MM      월을 숫자로
--MON      월을 알파벳으로
--DD      일을 숫자로
--DAY      요일 표현
--DY      요일 약어 표현
--D      요일 숫자 표현
--AM 또는 PM   오전 오후
--HH 또는 HH12   12시간
--HH24      24시간
--MI      분
--SS      초

-- Q. 현재 날짜(SYSDATE)를 'YYYY/MM/DD' 형식의 문자열로 변환하세요.
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') , SYSDATE FROM dual;

-- Q. '01-01-2023'이라는 문자열을 날짜 타입으로 변환하세요.
SELECT TO_DATE('01-01-2023','MM-DD-YYYY'), TO_CHAR(TO_DATE('01-01-2023','MM-DD-YYYY'),'MM-DD-YYYY') FROM dual;
-- Q. 현재 날짜와 시간(SYSDATE)을 'YYYY-MM-DD HH24:MI:SS' 형식의 문자열로 변환하세요.
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual;
-- Q. '2023-01-01 15:30:00'이라는 문자열을 날짜 및 시간 타입으로 변환하세요.
SELECT TO_DATE('2023-01-01 15:30:00','YYYY-MM-DD HH24:MI:SS') FROM dual;

--to_char( 숫자 )   숫자를 문자로 변환
--9      한 자리의 숫자 표현      ( 1111, ‘99999’ )      1111   
--0      앞 부분을 0으로 표현      ( 1111, ‘099999’ )      001111
--$      달러 기호를 앞에 표현      ( 1111, ‘$99999’ )      $1111
--.      소수점을 표시         ( 1111, ‘99999.99’ )      1111.00
--,      특정 위치에 , 표시      ( 1111, ‘99,999’ )      1,111
--MI      오른쪽에 - 기호 표시      ( 1111, ‘99999MI’ )      1111-
--PR      음수값을 <>로 표현      ( -1111, ‘99999PR’ )      <1111>
--EEEE      과학적 표현         ( 1111, ‘99.99EEEE’ )      1.11E+03
--V      10을 n승 곱한값으로 표현   ( 1111, ‘999V99’ )      111100
--B      공백을 0으로 표현      ( 1111, ‘B9999.99’ )      1111.00
--L      지역통화         ( 1111, ‘L9999’ )

SELECT salary, to_char(salary, '0999999') FROM employees;
SELECT salary, to_char(-salary, '999999PR') FROM employees;

-- 1111 -> 1.11E+03
SELECT TO_CHAR(11111,'9.999EEEE') FROM dual;
SELECT TO_CHAR(-11111,'999999MI') FROM dual;

-- width_bucket() 지정값,최소값,최대값, bucket 개수
SELECT width_bucket(92,0,100,10) FROM dual; -- 0~100 까지 10개단위로 잘라서 구분한다 92는 10번째에 해당
SELECT width_bucket(100,0,100,10) FROM dual;


-- Q. empoyees 테이블의 salary를 5개 등급으로 표시하세요
SELECT MAX(salary) max, min(salary) min FROM employees;

SELECT salary, WIDTH_BUCKET(salary,2100,24001,5) AS grade
FROM employees;

-- 문자 함수 Character Function
-- upper()
SELECT upper('Hello World') FROm dual;
-- lower() 소문자 변환
SELECT lower('Hello World') FROM dual;

-- Q. last_name이 Seo인 직원의 last_name과 salary를 구하세요.(Seo, SEO, seo 모두 검출)
SELECT
    last_name
    ,salary
FROM
    employees
WHERE
    1=1
    AND lower(last_name) = 'seo'
;

-- initcat() 첫글자만 대문자
SELECT job_id, initcap(job_id) FROM employees; 

-- length() 문자열의 길이
SELECT job_id, length(job_id) FROM employees;

-- instr() 문자열, 찾을 문자, 찾을 위치, 찾은 문자 중 몇번째
SELECT instr('Hello World','o',3,2) from dual;

-- substr() 문자열,시작위치, 개수
SELECT substr('Hello World', 3,3) FROM dual;
SELECT substr('Hello World', 9 ,3) FROM dual;
SELECT substr('Hello World',-3,3) FROM dual;

-- lpad() 오른쪽 정렬 후 왼쪽에 문자를 채운다.
SELECT lpad('Hello World',20,'#') FROM dual;

-- rpad() 왼쪽 정렬 후 오른쪽에 문자를 채운다.
SELECT rpad('Hello World',20,'#') FROM dual;

-- ltrim()
SELECT ltrim('aaaHello Worldaaa','a') FROM dual;
SELECT ltrim('    Hello World    ') FROM dual;

-- rtrim()
SELECT rtrim('aaaHello Worldaaa','a') FROM dual;
SELECT rtrim('    Hello World    ') FROM dual;

SELECT last_name FROM employees;
SELECT last_name as 이름, ltrim(last_name, 'A') AS 변환
FROM employees;

-- trim
SELECT trim('   Hello World      ') FROM dual;

-- 앞 뒤의 특정 문자 제거
SELECT last_name, trim('A' FROM last_name) FROM employees;








