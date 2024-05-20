SELECT * FROM BOOK;
SELECT BOOKID FROM BOOK;

SELECT * FROM CUSTOMER;
SELECT * FROM IMPORTED_BOOK;
SELECT * FROM ORDERS;

-- DISTINCT : �ߺ����� ���
SELECT DISTINCT PUBLISHER FROM BOOK;

-- Q. ������ 10,000�� �̻��� ������ �˻�
SELECT * FROM BOOK
WHERE PRICE >= 10000
;

-- Q. ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.(2���� ���)
SELECT * FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 20000;

SELECT * FROM BOOK
WHERE PRICE BETWEEN 10000 AND 20000;

-- Task1_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.(3���� ���)
-- Task2_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻�

-- LIKE�� ��Ȯ�� '�౸�� ����'�� ��ġ�ϴ� �ุ ����
SELECT BOOKNAME, PUBLISHER FROM BOOK
WHERE BOOKNAME LIKE '�౸�� ����';

-- '�౸'�� ���Ե� ���ǻ�
SELECT BOOKNAME, PUBLISHER FROM BOOK
WHERE BOOKNAME LIKE '%�౸%';

-- �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ����
SELECT BOOKNAME ,PUBLISHER FROM BOOK
WHERE BOOKNAME LIKE '_��%';

-- Task3_0517. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.

-- ORDER BY : �⺻ �������� ����(ASC) ,�������� ����(DESC)
-- �������� ����
SELECT * FROM BOOK
ORDER BY PRICE;

-- �������� ����
SELECT * FROM BOOK
ORDER BY PRICE DESC;

-- Q. ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
SELECT * FROM BOOK
ORDER BY PRICE, BOOKNAME;

SELECT SUM(SALEPRICE) AS "�� �Ǹž�"
FROM ORDERS 
WHERE CUSTID = 2;

-- GROUP BY : �����͸� Ư�� ���ؿ� ���� �׷�ȭ�ϴµ� ���, �̸� ���� ���� �Լ�(SUM,AVG,MAX,MIN,COUNT)�� �̿�
SELECT 
    SUM(saleprice) AS total
    ,AVG(saleprice) AS average
    ,MIN(saleprice) AS mininum
    ,MAX(saleprice) AS maximum
FROM 
    ORDERS
;

-- ���Ǹž��� custid �������� �׷�ȭ
SELECT 
    custid 
    , COUNT(*) AS ��������
    , SUM(saleprice) AS "�� �Ǹž�"
FROM
    ORDERS
GROUP BY
    custid
;

-- bookid�� 5���� ū ����
SELECT 
    custid 
    , COUNT(*) AS ��������
    , SUM(saleprice) AS "�� �Ǹž�"
FROM
    ORDERS
WHERE
    bookid > 5
GROUP BY
    custid
;

-- ���������� 2���� ū ����
SELECT 
    custid 
    , COUNT(*) AS ��������
    , SUM(saleprice) AS "�� �Ǹž�"
FROM
    ORDERS
WHERE
    bookid > 5
GROUP BY
    custid
HAVING COUNT(*) > 2
;

-- Q. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

SELECT 
    SUM(A.SALEPRICE) AS "�� �Ǹž�"
FROM
    ORDERS A
    ,CUSTOMER B
WHERE
    A.CUSTID = B.CUSTID
    AND B.NAME = '�迬��'
;

-- Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
SELECT
    B.NAME AS ����
    ,A.BOOKNAME AS ������    
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


-- Q.������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
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


-- JOIN�� �� �� �̻��� ���̺��� �����Ͽ� ���õ� �����͸� ������ �� ���
-- ���� ���� (Inner Join)
SELECT customer.name, orders.saleprice
FROM customer
INNER JOIN orders ON customer.custid =orders.custid
;

-- ���� �ܺ� ���� (Left Outer Join) : . �� ��° ���̺� ��ġ�ϴ� �����Ͱ� ���� ��� NULL ���� ���
SELECT customer.name, orders.saleprice
FROM customer
LEFT OUTER JOIN orders ON customer.custid = orders.custid;

--  ������ �ܺ� ���� (Right Outer Join) : ù ��° ���̺� ��ġ�ϴ� �����Ͱ� ���� ��� NULL ���� ���
SELECT customer.name, orders.saleprice
FROM customer
RIGHT OUTER JOIN
orders ON customer.custid = orders.custid
;

--  FULL OUTER JOIN : ��ġ�ϴ� �����Ͱ� ���� ��� �ش� ���̺����� NULL ���� ���
SELECT customer.name, orders.saleprice
FROM customer
FULL OUTER JOIN orders ON customer.custid = orders.custid;

--CROSS JOIN : �� ���̺� ���� ��� ������ ������ ����
SELECT customer.name, orders.saleprice
FROM customer
CROSS JOIN orders;

-- Q. ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ� (2���� ���, where, join)
SELECT
    customer.name
    ,orders.saleprice
FROM
    customer 
left outer join orders ON orders.custid = customer.custid

;

SELECT
    a.name 
    ,NVL(b.saleprice,0) AS �Ѿ�
FROM
    customer a
    , orders b
where
    a.custid = b.custid(+)
order by
    a.name
;
    
-- �μ� ���� ��������
SELECT * FROM customer;
SELECT CUSTID FROM orders;
-- Q. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT name
FROM customer
WHERE custid in (SELECT custid FROM orders)
;

--Q. �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT
    C.name
FROM
    BOOK A
    , ORDERS B
    , CUSTOMER C
WHERE
    A.bookid = B.bookid
    AND B.custid = C.custid
    AND A.publisher = '���ѹ̵��'
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
                                    publisher = '���ѹ̵��'))
;
--Q. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
SELECT
    A.bookname as ������
    ,A.price as ��������
    ,B.price as ��հ���
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

-- ����� Ǯ��
SELECT b1.bookname
FROM BOOK b1
WHERE b1.price > (SELECT avg(b2.price) FROM book b2 WHERE b2.publisher = b1.publisher)
;

--Q. ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
SELECT
    A.name
FROM
    CUSTOMER A
    ,ORDERS B
WHERE
    A.custid = B.custid(+)
    AND B.custid IS NULL
;

-- ����� Ǯ��
SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid FROM orders);


--Q. �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
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

-- ����� Ǯ��
SELECT name "�� �̸�", address "�� �ּ�"
FROM customer
WHERE custid IN (SELECT custid FROM orders);






















