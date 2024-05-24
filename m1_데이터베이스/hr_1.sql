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
    hire_date, round(months_between(sysdate,hire_date),1) FROM employees;

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

-- nvl() null을 0또는 다른 값으로 변환하는 함수
SELECT last_name,manager_id,
nvl(to_char(manager_id),'ceo') AS revised_id FROM employees;

--decode()    if문이나 case문과 같이 여러 경우를 선택할 수 있도록 하는 함수
--DECODE 함수는 단순한 조건에 기반하여 값을 반환합니다. 구문은 DECODE(expression, search1, result1, ..., searchN, resultN, default) 
--여기서 expression은 검사할 값을 나타내고, search와 result는 각각 조건과 해당 조건이 참일 때 반환할 값
--default는 모든 search 조건이 거짓일 때 반환할 기본 값 출력


SELECT last_name, department_id,
    DECODE(department_id,
            90,'경영지원실',
            60,'프로그래머',
            100,'인사부',
            '기타'
            ) 부서
FROM employees;

-- Q. employees 테이블에서 commission_pct가 null이 아닌 경우, 'A' null인 경우 'N'을 표시하는 쿼리를 작성
SELECT
    commission_pct as commission
    ,DECODE(commission_pct, null,'N','A') AS 변환
FROM
    employees
ORDER BY
    변환
;

--case()
--decode() 함수와 유사하나 decode() 함수는 조건이 동일한 경우만 가능하지만
--case() 함수는 다양한 비교연산자로 조건을 제시할 수 있다.
--CASE 문은 조건에 따라 다른 값을 반환하는 데 사용되며, DECODE보다 복잡한 조건을 표현할 수 있다. 
--구문은 CASE WHEN condition THEN result ... ELSE default END이다. 
SELECT 
    last_name, department_id,
    CASE 
        WHEN department_id = 90 THEN '경영지원실'
        WHEN department_id = 60 THEN '프로그래머'
        WHEN department_id = 100 THEN '인사부'
        ELSE '기타'
    END AS 소속
FROM
    employees;
    
-- Q. employees 테이블에서 salary가 20000 이상이면 'a', 10000과 20000 미만 사이면 'b', 그 이하면 'c'로 표시하는 쿼리를 작성하시오 (case)
SELECT
    last_name, salary,
    CASE 
        WHEN salary=20000 THEN 'a'
        WHEN salary>10000 AND salary<200000 THEN 'b'
        ELSE 'c' 
    END AS 등급
FROM
    employees;

--INSERT
--테이블에 데이터를 입력하는 방법은 두 가지 유형이 있으며 한 번에 한 건만 입력된다.
--a. INSERT INTO 테이블명 (COLUMN_LIST) VALUES (COLUMN_LIST에 넣을 VALUE_LIST);
--b. INSERT INTO 테이블명 VALUES (전체 COLUMN에 넣을 VALUE_LIST);

-- Concatenation : 콤마 대신에 사용하면 문자열이 연결되어 출력된다.
SELECT last_name , 'ls a ', job_id FROM employees;
SELECT last_name || 'ls a '|| job_id FROM employees;

-- UNION
-- UNION(합집합) INTERSECT(교집합) MINUS(차집합) UNION ALL(겹치는 것까지 포함)
SELECT first_name 이름, salary 급여, hire_date FROM employees
WHERE salary < 5000

UNION

SELECT first_name 이름 ,salary 급여, hire_date FROM employees
WHERE hire_date < '05/01/01'
;

SELECT first_name 이름, salary 급여, hire_date FROM employees
WHERE salary < 5000

MINUS

SELECT first_name 이름 ,salary 급여, hire_date FROM employees
WHERE hire_date < '05/01/01'
;

SELECT first_name 이름, salary 급여, hire_date FROM employees
WHERE salary < 5000

INTERSECT

SELECT first_name 이름 ,salary 급여, hire_date FROM employees
WHERE hire_date < '05/01/01'
;

SELECT first_name 이름, salary 급여, hire_date FROM employees
WHERE salary < 5000

UNION ALL

SELECT first_name 이름 ,salary 급여, hire_date FROM employees
WHERE hire_date < '05/01/01'
;

--CREATE VIEW 명령어는 오라클 SQL에서 테이블의 특정 부분이나 조인된 결과를 논리적인 뷰(view)로 만들 때 사용
--뷰는 데이터를 요약하거나 복잡한 조인을 단순화하며, 사용자에게 필요한 데이터만을 보여주는 데 유용
--뷰는 실제 테이블 데이터를 저장하지 않고, 대신 쿼리문 자체를 저장
--뷰의 주요 특징
--쿼리 단순화: 복잡한 쿼리를 뷰로 저장함으로써 사용자는 복잡한 쿼리문을 반복해서 작성할 필요 없이 간단하게 뷰를 참조할 수 있다.
--데이터 추상화: 뷰는 기본 테이블의 구조를 숨기고 사용자에게 필요한 데이터만을 보여줄 수 있어, 데이터 추상화를 제공.
--보안 강화: 뷰를 사용하면 특정 데이터에 대한 접근을 제한할 수 있으며, 사용자가 볼 수 있는 데이터의 범위를 제어할 수 있다.
--데이터 무결성 유지: 뷰를 사용하여 데이터를 수정하더라도, 이 변경사항이 기본 테이블의 데이터 무결성 규칙을 위반하지 않도록 관리할 수 있다.
CREATE VIEW employee_details AS
SELECT employee_id, last_name, department_id
FROM employees;

SELECT * FROM employee_details;

-- Q. employees 테이블에서 salary가 10000원 이상인 직원만을 포함하는 뷰 special_employee를 생성하는 SQL 명령문을 작성하시오.

CREATE VIEW special_employee AS
SELECT
    *
FROM
    employees
WHERE
    salary >= 10000
;

SELECT * FROM special_employee;

-- Q. employees 테이블에서 각 부서별 직원 수를 포함하는 뷰를 생성하세요.
CREATE VIEW department_empoyee_count AS
SELECT
    COUNT(department_id)
FROM
    employees
GROUP BY
    department_id
;

SELECT * FROM department_empoyee_count;

-- Q. employees 테이블에서 근속기간이 10년 이상인 직원을 포함하는 뷰를 생성하세요.

CREATE VIEW goinmul AS
SELECT
    last_name , trunc(sysdate - hire_date) AS 근속기간
FROM
    employees
WHERE
    trunc(sysdate-hire_Date) > 365 * 10
;

SELECT * FROM goinmul;

--TCL (Transaction Control Language)
--COMMIT: 현재 트랜잭션 내에서 수행된 모든 변경(INSERT, UPDATE, DELETE 등)을 데이터베이스에 영구적으로 저장.
--COMMIT 명령을 실행하면, 트랜잭션은 완료되며, 그 이후에는 변경 사항을 되돌릴 수 없다.
--ROLLBACK: 현재 트랜잭션 내에서 수행된 변경들을 취소하고, 데이터베이스를 트랜잭션이 시작하기 전의 상태로 되돌린다. 
--오류가 발생했거나 다른 이유로 트랜잭션을 취소해야 할 경우에 사용된다.
--SAVEPOINT: 트랜잭션 내에서 중간 체크포인트를 생성합니다. 오류가 발생할 경우, ROLLBACK을 사용하여 최근의 SAVEPOINT까지 되돌릴 수 있다.
--트랜잭션을 콘트롤하는 TCL(TRANSACTION CONTROL LANGUAGE)

-- members 테이블 생성
DROP TABLE members;

CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    email VARCHAR2(100),
    join_date DATE,
    status VARCHAR2(20)
);

INSERT INTO members (member_id, name, email, join_date, status) VALUES (1, 'John Doe', 'john@example.com', SYSDATE, 'Active');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (2, 'Jane Doe', 'jane@example.com', SYSDATE, 'Active');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (3, 'Mike Smith', 'mike@example.com', SYSDATE, 'Inactive');

INSERT INTO members (member_id, name, email, join_date, status) VALUES (4, 'Alice Johnson', 'alice@example.com', SYSDATE, 'Active');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (5, 'Bob Brown', 'bob@example.com', SYSDATE, 'Inactive');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (6, 'Bob Brown', 'bob@example.com', SYSDATE, 'Inactive');



SAVEPOINT sp1;

INSERT INTO members (member_id, name, email, join_date, status) VALUES (7, 'Bob Kim', 'bob7@example.com', SYSDATE, 'Inactive');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (8, 'Bob Kim', 'bob7@example.com', SYSDATE, 'Inactive');

ROLLBACK TO sp1;
ROLLBACK;
COMMIT;

DELETE FROM members WHERE member_id = 7;
DELETE FROM members WHERE member_id = 8;

SELECT * FROM members;

--Task1_0523. 
--orders라는 테이블을 생성하고, order_id, customer_id, order_date, amount, status라는 속성을 설정하세요.
--데이터를 5개 입력하세요.
--입력한 데이터 중 2개를 수정하세요.
--수정한 데이터를 취소하기 위해 롤백을 사용하세요.
--3개의 새로운 데이터를 입력하고, 그 중 마지막 데이터 입력만 취소한 후 나머지를 커밋하세요. 




--부서별 급여 현황
--테이블생성, 부서별 급여와 총 급여를 확인 할 수 있음.
--(급여의 합 평균 최솟값 최댓값, 총 직원수, 급여전체총합, 직원평균급여, 부서평균급여)
--table 만들기 부서별 급여를 대략적으로 보기
--사용할 테이블 확인
select * from jobs;
select * from departments;
select * from employees;
select * from job_history;

--부서 목록 확인
SELECT department_id
from employees 
group by department_id
order by department_id DESC;
-- 부서 목록 department_id : 10,20,30,40,50,60,70,80,90,100,110 그 외 나머지(120~200등..)는 없고 null 값이 있음.
--department_id 가 null 인 사람은 모두 job_id 에 맞는 department_id 를 부여해주려고함(데이터 무결성)
--1. department_id 가 null 값인 사람 찾기
select *
from employees
where department_id IS NULL;
--한명 밖에 없음. department_id : null, employee_id : 178, Job_id : SA_REP

--2. job_id 가 SA_REP 인 department_id 찾기 (직업에 맞는 부서 찾기)
select job_id, department_id
from job_history
where job_id IN 'SA_REP';
--SA_REP 의 department_id 는 80

--3. 수정 전 savepoint 생성
SAVEPOINT null_to_80;
------------------------SAVEPOINT---------------------------------

--4. 제약조건primary key 인 employee_id 로 찾아서 derpartment_id 를 80으로 수정
UPDATE employees
SET department_id = 80
WHERE employee_id = 178;

select * from employees where employee_id = 178;
--ROLLBACK null_to_80; -- savepoint로 가기
--commit;
--수정끝


-- 팀구성 및 년차별 샐러리
-- 각 부서마다 팀원은 몇명이고 어떤 포지션들이 있고 구성은 어떻게 되는지
SELECT 
    a.department_id , b.department_name, nvl(a.job_id,'Total') job_id, count(*) 직원수
FROM
    employees a
    ,departments b
WHERE
    a.department_id = b.department_id
GROUP BY ROLLUP
    ((a.department_id,b.department_name),a.job_id)
ORDER BY
    a.department_id
;