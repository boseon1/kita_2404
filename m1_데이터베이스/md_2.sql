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






















