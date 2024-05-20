-- Task1_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.(3가지 방법)
SELECT * FROM BOOK
WHERE (PUBLISHER = '굿스포츠') OR (PUBLISHER = '대한미디어');

SELECT * FROM BOOK
WHERE PUBLISHER IN ('굿스포츠','대한미디어');

SELECT * FROM BOOK
WHERE PUBLISHER LIKE '굿스포츠' OR PUBLISHER LIKE '대한미디어';

SELECT 
    *
FROM
    book
WHERE
    publisher = '굿스포츠'
UNION
SELECT 
    *
FROM
    book
WHERE
    publisher = '대한미디어'
;

-- Task2_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색
SELECT * FROM BOOK
WHERE PUBLISHER != '굿스포츠' AND PUBLISHER != '대한미디어';

SELECT * FROM BOOK
WHERE PUBLISHER NOT IN ('굿스포츠','대한미디어');

SELECT * FROM BOOK
WHERE PUBLISHER NOT LIKE '굿스포츠' AND PUBLISHER NOT LIKE '대한미디어';

-- Task3_0517. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT 
    * 
FROM 
    BOOK
WHERE
    BOOKNAME LIKE '%축구%'
    AND PRICE >= 20000
;

--Task4_0517. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
2	김연아	대한민국 서울	000-6000-0001;
SELECT 
    A.NAME
    ,B.custid
    , SUM(B.saleprice) AS "총 판매액"
FROM 
    CUSTOMER A
    ,ORDERS B
WHERE
    A.CUSTID = B.CUSTID
    AND A.CUSTID = 2
GROUP BY
    A.NAME
    ,b.custid
;

--Task5_0517. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
--단, 두 권 이상 구매한 고객만 구하시오.
SELECT 
    B.CUSTID
    ,COUNT(B.BOOKID) "총 수량"
FROM
    BOOK A
    , ORDERS B
WHERE
    A.BOOKID = B.BOOKID
    AND A.PRICE >= 8000
GROUP BY
    B.CUSTID
HAVING
    COUNT(B.BOOKID) >= 2
ORDER BY
    B.CUSTID    
;

-- 강사님 풀이
SELECT
    custid
    , COUNT(*) AS "도서수량"
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2
;

--Task6_0517. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT
    A.NAME AS 고객명
    , B.SALEPRICE AS "도서 판매 가격"
FROM
    CUSTOMER A
    , ORDERS B
WHERE
    A.CUSTID = B.CUSTID
ORDER BY
    A.NAME
;
    
--Task7_0517. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT
    A.NAME AS 고객명
    , SUM(B.SALEPRICE) AS "도서 판매 가격"
FROM
    CUSTOMER A
    , ORDERS B
WHERE
    A.CUSTID = B.CUSTID
GROUP BY
    A.NAME
ORDER BY
    A.NAME
;

    









