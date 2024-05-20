-- Task1_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.(3���� ���)
SELECT * FROM BOOK
WHERE (PUBLISHER = '�½�����') OR (PUBLISHER = '���ѹ̵��');

SELECT * FROM BOOK
WHERE PUBLISHER IN ('�½�����','���ѹ̵��');

SELECT * FROM BOOK
WHERE PUBLISHER LIKE '�½�����' OR PUBLISHER LIKE '���ѹ̵��';

SELECT 
    *
FROM
    book
WHERE
    publisher = '�½�����'
UNION
SELECT 
    *
FROM
    book
WHERE
    publisher = '���ѹ̵��'
;

-- Task2_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻�
SELECT * FROM BOOK
WHERE PUBLISHER != '�½�����' AND PUBLISHER != '���ѹ̵��';

SELECT * FROM BOOK
WHERE PUBLISHER NOT IN ('�½�����','���ѹ̵��');

SELECT * FROM BOOK
WHERE PUBLISHER NOT LIKE '�½�����' AND PUBLISHER NOT LIKE '���ѹ̵��';

-- Task3_0517. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
SELECT 
    * 
FROM 
    BOOK
WHERE
    BOOKNAME LIKE '%�౸%'
    AND PRICE >= 20000
;

--Task4_0517. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
2	�迬��	���ѹα� ����	000-6000-0001;
SELECT 
    A.NAME
    ,B.custid
    , SUM(B.saleprice) AS "�� �Ǹž�"
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

--Task5_0517. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--��, �� �� �̻� ������ ���� ���Ͻÿ�.
SELECT 
    B.CUSTID
    ,COUNT(B.BOOKID) "�� ����"
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

-- ����� Ǯ��
SELECT
    custid
    , COUNT(*) AS "��������"
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2
;

--Task6_0517. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT
    A.NAME AS ����
    , B.SALEPRICE AS "���� �Ǹ� ����"
FROM
    CUSTOMER A
    , ORDERS B
WHERE
    A.CUSTID = B.CUSTID
ORDER BY
    A.NAME
;
    
--Task7_0517. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT
    A.NAME AS ����
    , SUM(B.SALEPRICE) AS "���� �Ǹ� ����"
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

    









