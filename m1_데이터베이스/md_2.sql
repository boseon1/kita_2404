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


-- ���밪
SELECT ABS(-78) , ABS(+78)
FROM dual;

-- �ݿø�
SELECT ROUND(4.875,1)
FROM dual;

-- Q. ���� ��� �ֹ� �ݾ��� ��������� �ݿø� �� ���� ���Ͻÿ�.
SELECT * FROM ORDERS;

SELECT 
custid ����ȣ, ROUND(AVG(saleprice),-2) ����ֹ��ݾ�,AVG(saleprice)
FROM orders 
GROUP BY custid;


-- Q. '�½�����'���� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�.
SELECT bookname , length(bookname) ���ڼ�
, lengthb(bookname) ����Ʈ��
from book
where publisher = '�½�����'
;


--  [�ǽ� - 2�� 1��]
-- �б� ������ ���Ͽ� ���̺� 3�� �̻����� db�� �����ϰ� 3�� �̻� Ȱ���� �� �ִ� case�� ���弼��.
-- ������, �������� , �������� ...
-- 
drop table student;
drop table school;

create table school (
    stNum number primary key -- �й�
    ,grade NUMBER -- �г�
    , class NUMBER -- ��
    , score NUMBER -- ����
    , enter DATE NOT NULL -- ������
    , graduate DATE -- ������
)
;
create table student (
    stNum NUMBER -- �й�
    ,birth date -- ����
    ,name VARCHAR2(50) -- �̸�
    ,sx char -- ���� M,F
    ,address VARCHAR2(100) -- �ּ�
    ,phone varchar2(20) -- ��ȭ��ȣ
    , foreign key (stNum) references school(stNum) on delete cascade
)
;

CREATE TABLE teacher (
    teacherID NUMBER PRIMARY KEY -- ���� ID
    ,tname VARCHAR2(50) -- �̸�
    ,subject VARCHAR2(50) -- ����
    ,class NUMBER
    ,stNum NUMBER -- �й� (�ܷ�Ű)
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
INSERT INTO student VALUES (1, TO_DATE('2010-05-05', 'YYYY-MM-DD'), 'ȫ�浿', 'M', '���ѹα� ����', '01012345678');
INSERT INTO student VALUES (4, TO_DATE('2010-02-15', 'YYYY-MM-DD'), '������', 'M', '���ѹα� ����', '01056789012');
INSERT INTO student VALUES (5, TO_DATE('2010-08-21', 'YYYY-MM-DD'), '�ֹ̳�', 'F', '���ѹα� ����', '01067890123');
INSERT INTO student VALUES (6, TO_DATE('2010-11-30', 'YYYY-MM-DD'), '��ö��', 'M', '���ѹα� �λ�', '01078901234');
INSERT INTO student VALUES (7, TO_DATE('2010-03-10', 'YYYY-MM-DD'), '�̿���', 'F', '���ѹα� �뱸', '01089012345');

-- Inserts for students born in 2012
INSERT INTO student VALUES (2, TO_DATE('2012-06-12', 'YYYY-MM-DD'), '�迵��', 'F', '���ѹα� �λ�', '01023456789');
INSERT INTO student VALUES (8, TO_DATE('2012-01-22', 'YYYY-MM-DD'), '������', 'F', '���ѹα� ��õ', '01090123456');
INSERT INTO student VALUES (9, TO_DATE('2012-09-05', 'YYYY-MM-DD'), '���Ѻ�', 'M', '���ѹα� ����', '01001234567');
INSERT INTO student VALUES (10, TO_DATE('2012-11-18', 'YYYY-MM-DD'), '������', 'F', '���ѹα� ���', '01012345679');
INSERT INTO student VALUES (11, TO_DATE('2012-03-23', 'YYYY-MM-DD'), '������', 'M', '���ѹα� ����', '01023456780');

-- Inserts for students born in 1998
INSERT INTO student VALUES (3, TO_DATE('1998-07-23', 'YYYY-MM-DD'), '��ö��', 'M', '���ѹα� ��õ', '01034567890');
INSERT INTO student VALUES (12, TO_DATE('1998-02-11', 'YYYY-MM-DD'), '�ڹμ�', 'M', '���ѹα� �뱸', '01045678901');
INSERT INTO student VALUES (13, TO_DATE('1998-05-29', 'YYYY-MM-DD'), '������', 'F', '���ѹα� ����', '01056789012');
INSERT INTO student VALUES (14, TO_DATE('1998-10-15', 'YYYY-MM-DD'), '�ֿ���', 'M', '���ѹα� �λ�', '01067890123');
INSERT INTO student VALUES (15, TO_DATE('1998-12-20', 'YYYY-MM-DD'), '���Ƹ�', 'F', '���ѹα� ���', '01078901234');

commit;

select * from school order by stnum;
select * from student order by stnum;


-- �������� 2016~2018������ ������ ��պ��� ���� �л��� �̸�,�ּ�,����,������
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

-- ���� �뱸�� �л� ����
delete from school
where
    stnum = (select stnum from student where address like '%�뱸%')
;

commit;



-- ���� ����
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (1, '�迵��', '����', 1, 1);

-- ���� ����
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (2, '��ö��', '����', 2, 2);

-- ���� ����
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (3, '�ڹ���', '����', 3, 3);

-- ���� ����
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (4, 'John Smith', '����', 4, 4);

-- �߱��� ����
INSERT INTO teacher (teacherID, tname, subject, class, stNum) VALUES (5, '��?', '�߱���', 5, 5);



-- Q. DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�.
SELECT 
    SYSDATE, TO_CHAR(SYSDATE, 'YYYY-mm-dd HH:MI:SS day') SYSDATE1
FROM DUAL;


-- Q. �̸�, ��ȭ��ȣ�� ���Ե� ������ ���̽ÿ�. ��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ���Ͻÿ�
-- NVL �Լ��� ���� NULL�� ��� �������� ����ϰ�, NULL�� �ƴϸ� ���� ���� �״�� ����Ѵ�. �Լ� : NVL("��","������")
SELECT name �̸�, NVL(phone,'����ó����') ��ȭ��ȣ
FROM customer;


-- Q. ����Ͽ��� ����ȣ, �̸�, ��ȭ��Ȧ�� ���� �θ� ���̽ÿ�.
-- ROWNUM : ����Ŭ���� �ڵ����� �����ϴ� ���� ���� ������ ����Ǵ� ���� �� �࿡ �Ϸù�ȣ�� �ڵ����� �Ҵ�.
SELECT rownum ����, custid ����ȣ, name �̸�, phone ��ȭ��ȣ
FROM customer
WHERE rownum < 3;


