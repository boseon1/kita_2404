--Task1_0520. 10개의 속성으로 구성되는 테이블 2개를 작성하세요. 단 FOREGIN KEY를 적용하여 한쪽 테이블의 데이터를 삭제시 다른 테이블의
-- 관련되는 데이터도 모두 삭제되도록 하세요.(모든 제약조건 을 사용)
-- 단, 각 테이블에 5개의 데이터를 입력하고 두번째 테이블에 첫번째 데이터를 참조하고 있는 속성을 선택하여 데이터 삭제

CREATE TABLE cust(
    custid VARCHAR2(50) PRIMARY KEY ,
    name VARCHAR2(20),
    brdt DATE ,
    height
    gender CHAR(1),
    m_carrier VARCHAR2(10),
    p_num NUMBER(11),
    juso VARCHAR2(200),
    nation VARCHAR2(50),
    rdate DATE 
)
;





--Task2_0520. Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE 
    CUSTOMER 
SET 
    ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '김연아')
WHERE
    NAME = '박세리'
;

SELECT * FROM CUSTOMER;
    
--Task3_0520.도서 제목에 ‘야구’가 포함된 도서를 ‘농구’로 변경한 후 도서 목록, 가격을 보이시오.
UPDATE
    BOOK
SET
    bookname = replace(book.bookname,'야구','농구')
;

SELECT * FROM BOOK;

select 
    replace(book.bookname,'야구','농구')
from
    book
;

--Task4_0520. 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
SELECT
    SUBSTR(NAME,1,1) AS 성
    ,COUNT(*) AS 인원수
FROM
    CUSTOMER
GROUP BY
    SUBSTR(NAME,1,1)
ORDER BY
    COUNT(*) DESC
;

--Task5_0520. 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT
    orderid
    ,ORDERDATE
    ,orderdate +10 AS 확정일자
FROM
    ORDERS
ORDER BY
    orderid
;

--Task6_0520.마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 
--단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 표시한다.
SELECT
    ORDERID
    ,TO_CHAR(ORDERDATE,'YYYY-MM-DD day') as 주문일
    ,CUSTID
    ,BOOKID
FROM
    ORDERS
;
--Task7_0520. 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
SELECT
    ORDERID
    ,SALEPRICE
FROM
    ORDERS
WHERE
    SALEPRICE <= (SELECT AVG(SALEPRICE) FROM ORDERS)
ORDER BY
    ORDERID 
;

--Task8_0520. 대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT
    SUM(B.SALEPRICE) AS "총 판매액"
FROM
    CUSTOMER A
    ,ORDERS B
WHERE
    A.CUSTID = B.CUSTID
    AND A.ADDRESS LIKE '%대한민국%'    
;








































