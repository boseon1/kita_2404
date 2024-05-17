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
