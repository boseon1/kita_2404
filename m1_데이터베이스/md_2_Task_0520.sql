--Task1_0520. 10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ��ϼ���. �� FOREGIN KEY�� �����Ͽ� ���� ���̺��� �����͸� ������ �ٸ� ���̺���
-- ���õǴ� �����͵� ��� �����ǵ��� �ϼ���.(��� �������� �� ���)
-- ��, �� ���̺� 5���� �����͸� �Է��ϰ� �ι�° ���̺� ù��° �����͸� �����ϰ� �ִ� �Ӽ��� �����Ͽ� ������ ����

CREATE TABLE cust(
    custid VARCHAR2(50) PRIMARY KEY ,
    name VARCHAR2(20),
    brdt DATE ,
    gender CHAR(1),
    m_carrier VARCHAR2(10),
    p_num NUMBER(11),
    juso VARCHAR2(200),
    nation VARCHAR2(50),
    rdate DATE 
)
;



--Task2_0520. Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE 
    CUSTOMER 
SET 
    ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '�迬��')
WHERE
    NAME = '�ڼ���'
;

SELECT * FROM CUSTOMER;
    
--Task3_0520.���� ���� ���߱����� ���Ե� ������ ���󱸡��� ������ �� ���� ���, ������ ���̽ÿ�.
UPDATE
    BOOK
SET
    bookname = replace(book.bookname,'�߱�','��')
;

SELECT * FROM BOOK;

select 
    replace(book.bookname,'�߱�','��')
from
    book
;

--Task4_0520. ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
SELECT
    SUBSTR(NAME,1,1) AS ��
    ,COUNT(*) AS �ο���
FROM
    CUSTOMER
GROUP BY
    SUBSTR(NAME,1,1)
ORDER BY
    COUNT(*) DESC
;

--Task5_0520. ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT
    ORDERDATE
    ,orderdate +10 AS Ȯ������
FROM
    ORDERS
ORDER BY
    ORDERDATE
;

--Task6_0520.���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. 
--�� �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ���Ѵ�.
SELECT
    ORDERID
    ,TO_CHAR(ORDERDATE,'YYYY-MM-DD day') as �ֹ���
    ,CUSTID
    ,BOOKID
FROM
    ORDERS
;
--Task7_0520. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
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

--Task8_0520. ���ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT
    SUM(B.SALEPRICE) AS "�� �Ǹž�"
FROM
    CUSTOMER A
    ,ORDERS B
WHERE
    A.CUSTID = B.CUSTID
    AND A.ADDRESS LIKE '%���ѹα�%'    
;








































