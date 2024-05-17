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
