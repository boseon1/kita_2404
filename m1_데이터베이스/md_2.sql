SELECT * FROM BOOK;
SELECT BOOKID FROM BOOK;

SELECT * FROM CUSTOMER;
SELECT * FROM IMPORTED_BOOK;
SELECT * FROM ORDERS;

-- DISTINCT : 중복없이 출력
SELECT DISTINCT PUBLISHER FROM BOOK;

-- Q. 가격이 10,000원 이상인 도서를 검색
SELECT * FROM BOOK
WHERE PRICE >= 10000
;

-- Q. 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.(2가지 방법)
SELECT * FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 20000;

SELECT * FROM BOOK
WHERE PRICE BETWEEN 10000 AND 20000;

-- Task1_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.(3가지 방법)
-- Task2_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색

-- LIKE는 정확히 '축구의 역사'와 일치하는 행만 선택
SELECT BOOKNAME, PUBLISHER FROM BOOK
WHERE BOOKNAME LIKE '축구의 역사';

-- '축구'가 포함된 출판사
SELECT BOOKNAME, PUBLISHER FROM BOOK
WHERE BOOKNAME LIKE '%축구%';

-- 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서
SELECT BOOKNAME ,PUBLISHER FROM BOOK
WHERE BOOKNAME LIKE '_구%';

-- Task3_0517. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.

-- ORDER BY : 기본 오름차순 정렬(ASC) ,내림차순 정렬(DESC)
-- 오름차순 정렬
SELECT * FROM BOOK
ORDER BY PRICE;

-- 내림차순 정렬
SELECT * FROM BOOK
ORDER BY PRICE DESC;

-- Q. 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
SELECT * FROM BOOK
ORDER BY PRICE, BOOKNAME;

SELECT SUM(SALEPRICE) AS "총 판매액"
FROM ORDERS 
WHERE CUSTID = 2;

-- GROUP BY : 데이터를 특정 기준에 따라 그룹화하는데 사용, 이를 통해 집계 함수(SUM,AVG,MAX,MIN,COUNT)를 이용
SELECT 
    SUM(saleprice) AS total
    ,AVG(saleprice) AS average
    ,MIN(saleprice) AS mininum
    ,MAX(saleprice) AS maximum
FROM 
    ORDERS
;

-- 총판매액을 custid 기준으로 그룹화
SELECT 
    custid 
    , COUNT(*) AS 도서수량
    , SUM(saleprice) AS "총 판매액"
FROM
    ORDERS
GROUP BY
    custid
;

-- bookid가 5보다 큰 조건
SELECT 
    custid 
    , COUNT(*) AS 도서수량
    , SUM(saleprice) AS "총 판매액"
FROM
    ORDERS
WHERE
    bookid > 5
GROUP BY
    custid
;

-- 도서수량이 2보다 큰 조건
SELECT 
    custid 
    , COUNT(*) AS 도서수량
    , SUM(saleprice) AS "총 판매액"
FROM
    ORDERS
WHERE
    bookid > 5
GROUP BY
    custid
HAVING COUNT(*) > 2
;

-- Q. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

SELECT 
    SUM(A.SALEPRICE) AS "총 판매액"
FROM
    ORDERS A
    ,CUSTOMER B
WHERE
    A.CUSTID = B.CUSTID
    AND B.NAME = '김연아'
;

-- Q. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT
    B.NAME AS 고객명
    ,A.BOOKNAME AS 도서명    
FROM
    BOOK A
    , CUSTOMER B
    , ORDERS C
WHERE
    A.BOOKID = C.BOOKID
    AND B.CUSTID = C.CUSTID
ORDER BY
    B.NAME
;

SELECT
    customer.name, book.bookname
FROM
    orders
INNER JOIN customer ON orders.custid = customer.custid
INNER JOIN book ON orders.bookid = book.bookid;


-- Q.가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT
    B.NAME
    ,A.bookname
FROM
    BOOK A
    ,CUSTOMER B
    ,ORDERS C
WHERE
    A.BOOKID = C.BOOKID
    AND B.CUSTID = C.CUSTID
    AND A.PRICE = 20000
;


-- JOIN은 두 개 이상의 테이블을 연결하여 관련된 데이터를 결합할 때 사용
-- 내부 조인 (Inner Join)
SELECT customer.name, orders.saleprice
FROM customer
INNER JOIN orders ON customer.custid =orders.custid
;

-- 왼쪽 외부 조인 (Left Outer Join) : . 두 번째 테이블에 일치하는 데이터가 없는 경우 NULL 값이 사용
SELECT customer.name, orders.saleprice
FROM customer
LEFT OUTER JOIN orders ON customer.custid = orders.custid;

--  오른쪽 외부 조인 (Right Outer Join) : 첫 번째 테이블에 일치하는 데이터가 없는 경우 NULL 값이 사용
SELECT customer.name, orders.saleprice
FROM customer
RIGHT OUTER JOIN
orders ON customer.custid = orders.custid
;

--  FULL OUTER JOIN : 일치하는 데이터가 없는 경우 해당 테이블에서는 NULL 값이 사용
SELECT customer.name, orders.saleprice
FROM customer
FULL OUTER JOIN orders ON customer.custid = orders.custid;

--CROSS JOIN : 두 테이블 간의 모든 가능한 조합을 생성
SELECT customer.name, orders.saleprice
FROM customer
CROSS JOIN orders;

-- Q. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오 (2가지 방법, where, join)
SELECT
    customer.name
    ,orders.saleprice
FROM
    customer 
left outer join orders ON orders.custid = customer.custid

;

SELECT
    a.name 
    ,NVL(b.saleprice,0) AS 총액
FROM
    customer a
    , orders b
where
    a.custid = b.custid(+)
order by
    a.name
;
    
-- 부속 질의 서브쿼리
SELECT * FROM customer;
SELECT CUSTID FROM orders;
-- Q. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT name
FROM customer
WHERE custid in (SELECT custid FROM orders)
;

--Q. ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT
    C.name
FROM
    BOOK A
    , ORDERS B
    , CUSTOMER C
WHERE
    A.bookid = B.bookid
    AND B.custid = C.custid
    AND A.publisher = '대한미디어'
;

SELECT
    NAME
FROM
    CUSTOMER
WHERE
    CUSTID IN (SELECT 
                    CUSTID 
                FROM 
                    ORDERS 
                WHERE 
                    bookid IN (SELECT 
                                    bookid 
                                FROM 
                                    book 
                                WHERE 
                                    publisher = '대한미디어'))
;
--Q. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT
    A.bookname as 도서명
    ,A.price as 도서가격
    ,B.price as 평균가격
FROM
    BOOK A
    ,(SELECT 
        publisher
        ,AVG(price) as price
    FROM 
        BOOK    
    GROUP BY 
        publisher) B
WHERE 
    A.publisher = B.publisher
    AND A.price > B.price
;

-- 강사님 풀이
SELECT b1.bookname
FROM BOOK b1
WHERE b1.price > (SELECT avg(b2.price) FROM book b2 WHERE b2.publisher = b1.publisher)
;

--Q. 도서를 주문하지 않은 고객의 이름을 보이시오.
SELECT
    A.name
FROM
    CUSTOMER A
    ,ORDERS B
WHERE
    A.custid = B.custid(+)
    AND B.custid IS NULL
;

-- 강사님 풀이
SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid FROM orders);


--Q. 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT
    DISTINCT A.name
    ,A.address
FROM
    CUSTOMER A
    ,ORDERS B
WHERE
    A.custid = B.custid(+)
    AND B.custid IS NOT NULL
ORDER BY
    A.name
;

-- 강사님 풀이
SELECT name "고객 이름", address "고객 주소"
FROM customer
WHERE custid IN (SELECT custid FROM orders);


-- 절대값
SELECT ABS(-78) , ABS(+78)
FROM dual;

-- 반올림
SELECT ROUND(4.875,1)
FROM dual;

-- Q. 고객별 평균 주문 금액을 백원단위로 반올림 한 값을 구하시오.
SELECT * FROM ORDERS;

SELECT 
custid 고객번호, ROUND(AVG(saleprice),-2) 평균주문금액,AVG(saleprice)
FROM orders 
GROUP BY custid;


-- Q. '굿스포츠'에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 보이시오.
SELECT bookname , length(bookname) 글자수
, lengthb(bookname) 바이트수
from book
where publisher = '굿스포츠'
;


--  [실습 - 2인 1조]
-- 학교 관리를 위하여 테이블 3개 이상으로 db를 구축하고 3개 이상 활용할 수 있는 case를 만드세요.
-- 출결관리, 학적관리 , 성적관리 ...
-- 
drop table student;
drop table school;

create table school (
    stNum number primary key -- 학번
    ,grade NUMBER -- 학년
    , class NUMBER -- 반
    , score NUMBER -- 점수
    , enter DATE NOT NULL -- 입학일
    , graduate DATE -- 졸업일
)
;
create table student (
    stNum NUMBER -- 학번
    ,birth date -- 생일
    ,name VARCHAR2(50) -- 이름
    ,sx char -- 성별 M,F
    ,address VARCHAR2(100) -- 주소
    ,phone varchar2(20) -- 전화번호
    , foreign key (stNum) references school(stNum) on delete cascade
)
;

CREATE TABLE teacher (
    teacherID NUMBER PRIMARY KEY -- 교사 ID
    ,tname VARCHAR2(50) -- 이름
    ,subject VARCHAR2(50) -- 과목
    ,class NUMBER
    ,stNum NUMBER -- 학번 (외래키)
    ,FOREIGN KEY (stNum) REFERENCES school(stNum) ON DELETE CASCADE
    ,FOREIGN KEY (class) REFERENCES school(class) ON DELETE CASCADE
);
-- Inserts for 2018 admission
INSERT INTO school VALUES (1, 3, 5, 90, TO_DATE('2018-03-02', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'));
INSERT INTO school VALUES (4, 2, 1, 87, TO_DATE('2018-03-02', 'YYYY-MM-DD'), NULL);
INSERT INTO school VALUES (5, 1, 4, 82, TO_DATE('2018-03-02', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'));
INSERT INTO school VALUES (6, 4, 3, 91, TO_DATE('2018-03-02', 'YYYY-MM-DD'), NULL);
INSERT INTO school VALUES (7, 3, 2, 88, TO_DATE('2018-03-02', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'));


-- Inserts for 2020 admission
INSERT INTO school VALUES (2, 2, 3, 85, TO_DATE('2020-03-02', 'YYYY-MM-DD'),null);
INSERT INTO school VALUES (9, 1, 2, 83, TO_DATE('2020-03-02', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'));
INSERT INTO school VALUES (10, 3, 1, 89, TO_DATE('2020-03-02', 'YYYY-MM-DD'),null);
INSERT INTO school VALUES (11, 4, 4, 92, TO_DATE('2020-03-02', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'));
INSERT INTO school VALUES (12, 2, 5, 76, TO_DATE('2020-03-02', 'YYYY-MM-DD'),null);


-- Inserts for 2016 admission
INSERT INTO school VALUES (3, 1, 1, 78, TO_DATE('2016-03-02', 'YYYY-MM-DD'), TO_DATE('2022-02-24', 'YYYY-MM-DD'));
INSERT INTO school VALUES (14, 2, 2, 80, TO_DATE('2016-03-02', 'YYYY-MM-DD'), NULL);
INSERT INTO school VALUES (15, 3, 4, 85, TO_DATE('2016-03-02', 'YYYY-MM-DD'), TO_DATE('2022-02-24', 'YYYY-MM-DD'));
INSERT INTO school VALUES (13, 4, 1, 90, TO_DATE('2016-03-02', 'YYYY-MM-DD'), NULL);
INSERT INTO school VALUES (8, 1, 5, 77, TO_DATE('2016-03-02', 'YYYY-MM-DD'), TO_DATE('2022-02-24', 'YYYY-MM-DD'));

-- Inserts for students born in 2010
INSERT INTO student VALUES (1, TO_DATE('2010-05-05', 'YYYY-MM-DD'), '홍길동', 'M', '대한민국 서울', '01012345678');
INSERT INTO student VALUES (4, TO_DATE('2010-02-15', 'YYYY-MM-DD'), '박지성', 'M', '대한민국 대전', '01056789012');
INSERT INTO student VALUES (5, TO_DATE('2010-08-21', 'YYYY-MM-DD'), '최미나', 'F', '대한민국 광주', '01067890123');
INSERT INTO student VALUES (6, TO_DATE('2010-11-30', 'YYYY-MM-DD'), '김철수', 'M', '대한민국 부산', '01078901234');
INSERT INTO student VALUES (7, TO_DATE('2010-03-10', 'YYYY-MM-DD'), '이영희', 'F', '대한민국 대구', '01089012345');

-- Inserts for students born in 2012
INSERT INTO student VALUES (2, TO_DATE('2012-06-12', 'YYYY-MM-DD'), '김영희', 'F', '대한민국 부산', '01023456789');
INSERT INTO student VALUES (8, TO_DATE('2012-01-22', 'YYYY-MM-DD'), '정수빈', 'F', '대한민국 인천', '01090123456');
INSERT INTO student VALUES (9, TO_DATE('2012-09-05', 'YYYY-MM-DD'), '최한별', 'M', '대한민국 서울', '01001234567');
INSERT INTO student VALUES (10, TO_DATE('2012-11-18', 'YYYY-MM-DD'), '한지민', 'F', '대한민국 경기', '01012345679');
INSERT INTO student VALUES (11, TO_DATE('2012-03-23', 'YYYY-MM-DD'), '오세훈', 'M', '대한민국 강원', '01023456780');

-- Inserts for students born in 1998
INSERT INTO student VALUES (3, TO_DATE('1998-07-23', 'YYYY-MM-DD'), '이철수', 'M', '대한민국 인천', '01034567890');
INSERT INTO student VALUES (12, TO_DATE('1998-02-11', 'YYYY-MM-DD'), '박민수', 'M', '대한민국 대구', '01045678901');
INSERT INTO student VALUES (13, TO_DATE('1998-05-29', 'YYYY-MM-DD'), '유지수', 'F', '대한민국 서울', '01056789012');
INSERT INTO student VALUES (14, TO_DATE('1998-10-15', 'YYYY-MM-DD'), '최영준', 'M', '대한민국 부산', '01067890123');
INSERT INTO student VALUES (15, TO_DATE('1998-12-20', 'YYYY-MM-DD'), '윤아름', 'F', '대한민국 경기', '01078901234');

commit;

select * from school order by stnum;
select * from student order by stnum;


-- 입학일이 2016~2018사이의 점수가 평균보다 높은 학생의 이름,주소,점수,입학일
SELECT 
    b.name ,b.address ,a.score ,a.enter
FROM
    SCHOOL A
    ,student B
WHERE
    a.stnum = b.stnum
    and enter between TO_DATE('2016','YYYY') and TO_DATE('2018','YYYY')
    and score > (select avg(score) from school)
;

-- 집이 대구인 학생 전학
delete from school
where
    stnum = (select stnum from student where address like '%대구%')
;

commit;



-- 국어 교사
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (1, '김영희', '국어', 1, 1);

-- 수학 교사
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (2, '이철수', '수학', 2, 2);

-- 과학 교사
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (3, '박민지', '과학', 3, 3);

-- 영어 교사
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (4, 'John Smith', '영어', 4, 4);

-- 중국어 교사
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (5, '王?', '중국어', 5, 5);



-- Q. DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오.
SELECT 
    SYSDATE, TO_CHAR(SYSDATE, 'YYYY-mm-dd HH:MI:SS day') SYSDATE1
FROM DUAL;


-- Q. 이름, 전화번호가 포함된 곡객목록을 보이시오. 단, 전화번호가 없는 고객은 '연락처없음'으로 표시하시오
-- NVL 함수는 값이 NULL인 경우 지정값을 출력하고, NULL이 아니면 원래 값을 그대로 출력한다. 함수 : NVL("값","지정값")
SELECT name 이름, NVL(phone,'연락처없음') 전화번호
FROM customer;


-- Q. 고객목록에서 고객번호, 이름, 전화번홀르 앞의 두명만 보이시오.
-- ROWNUM : 오라클에서 자동으로 제공하는 가상 열로 쿼리가 진행되는 동안 각 행에 일련번호를 자동으로 할당.
SELECT rownum 순번, custid 고객번호, name 이름, phone 전화번호
FROM customer
WHERE rownum < 3;


