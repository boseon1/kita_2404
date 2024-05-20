--������ Ÿ��
--������ (Numeric Types)
--NUMBER: ���� �������� ���� ������ Ÿ��. ����, �Ǽ�, ���� �Ҽ���, �ε� �Ҽ��� ���� ����
-- NUMBER�� NUMBER(38,0)�� ���� �ǹ̷� �ؼ�, Precision 38:�ڸ���, Scale 0�� �Ҽ��� ���� �ڸ���
-- NUMBER(10) : �ڸ��� 10�ڸ�, NUMBER(8,2) :8�ڸ� �̸鼭 �Ҽ��� 2�ڸ����� -> 8�ڸ����� �Ҽ��� 2�ڸ��� ����

--������ (Character Types)
--VARCHAR2(size): ���� ���� ���ڿ��� ����. size�� �ִ� ���� ���̸� ����Ʈ, Ȥ�� ���ڼ��� ����
--NVARCHAR2(size)�� ����� ������ ���� ����Ʈ ���� ��� �׻� ���� ������ ũ�Ⱑ ����
--CHAR(size): ���� ���� ���ڿ��� ����. ������ ���̺��� ª�� ���ڿ��� �ԷµǸ� �������� �������� ä����

--��¥ �� �ð��� (Date and Time Types)
--DATE: ��¥�� �ð��� ����. ������ Ÿ���� ��, ��, ��, ��, ��, �ʸ� ����
--DATE Ÿ���� ��¥�� �ð��� YYYY-MM-DD HH24:MI:SS �������� �����մϴ�.
--���� ���, 2024�� 5�� 20�� ���� 3�� 45�� 30�ʴ� 2024-05-20 15:45:30���� ����

--TIMESTAMP: ��¥�� �ð��� �� ���� ������ �������� ����
--���� �������� (Binary Data Types)
--BLOB: �뷮�� ���� �����͸� ����. �̹���, ����� ���� ���� �����ϴ� �� ����
--��Ը� ��ü�� (Large Object Types)
--CLOB: �뷮�� ���� �����͸� ����
--NCLOB: �뷮�� ������ ���� ���� �����͸� ����

--���� ���ڵ��� �ǹ�
--��ǻ�ʹ� ���ڷ� �̷���� �����͸� ó��. ���ڵ��� ���� ����(��: 'A', '��', '?')�� 
--����(�ڵ� ����Ʈ)�� ��ȯ�Ͽ� ��ǻ�Ͱ� �����ϰ� ������ �� �ְ� �Ѵ�.
--���� ���, ASCII ���ڵ������� �빮�� 'A'�� 65��, �ҹ��� 'a'�� 97�� ���ڵ�. 
--�����ڵ� ���ڵ������� 'A'�� U+0041, �ѱ� '��'�� U+AC00, �̸�Ƽ�� '?'�� U+1F60A�� ���ڵ�
--�ƽ�Ű�� 7��Ʈ�� ����Ͽ� �� 128���� ���ڸ� ǥ���ϴ� �ݸ� �����ڵ�� �ִ� 1,114,112���� ���ڸ� ǥ��

--ASCII ���ڵ�:
--���� 'A' -> 65 (10����) -> 01000001 (2����)
--���� 'B' -> 66 (10����) -> 01000010 (2����)

--�����ڵ�(UTF-8) ���ڵ�: 
--���� 'A' -> U+0041 -> 41 (16����) -> 01000001 (2����, ASCII�� ����)
--���� '��' -> U+AC00 -> EC 95 80 (16����) -> 11101100 10010101 10000000 (2����)

--CLOB: CLOB�� �Ϲ������� �����ͺ��̽��� �⺻ ���� ����(��: ASCII, LATIN1 ��)�� ����Ͽ� �ؽ�Ʈ �����͸� ����. 
--�� ������ �ַ� ����� ���� ���� ����Ʈ ���ڷ� �̷���� �ؽ�Ʈ�� �����ϴ� �� ���.
--NCLOB: NCLOB�� �����ڵ�(UTF-16)�� ����Ͽ� �ؽ�Ʈ �����͸� ����. ���� �ٱ��� ������ �ʿ��� ��, \
--�� �پ��� ���� ������ �ؽ�Ʈ �����͸� ������ �� ����. �ٱ��� ���ڰ� ���Ե� �����͸� ȿ�������� ó���� �� �ִ�.

-- VARCHAR2�� �� ���� ������� ���̸� ���� : ����Ʈ�� ����
-- ���� Ȯ�� ���


--�������� : 
--PRIMARY KEY : �� ���� �����ϰ� �ĺ��ϴ� ��(�Ǵ� ������ ����). �ߺ��ǰų� NULL ���� ������� �ʴ´�.
--FOREIGN KEY : �ٸ� ���̺��� �⺻ Ű�� �����ϴ� ��. ���� ���Ἲ�� ����
--UNIQUE : ���� �ߺ��� ���� ����� ���� ����. NULL���� ���
--NOT NULL : ���� NULL ���� ������� �ʴ´�.
--CHECK : �� ���� Ư�� ������ �����ؾ� ���� ���� (��: age > 18)
--DEFAULT : ���� ������� ���� �������� ���� ��� ���� �⺻���� ����


-- AUTHOR ���̺� ����
CREATE TABLE authors (
    id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    nationality VARCHAR2(50)
);

DROP TABLE authors;


-- Q. NEWBOOK�̶�� ���̺��� �����ϼ���.
CREATE TABLE newbook(
    bookid NUMBER,
    isbn NUMBER(13),
    bookname VARCHAR2(50) NOT NULL,
    author VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(30) NOT NULL,
    price NUMBER DEFAULT 10000 CHECK(price>1000),
    published_date DATE,
    PRIMARY KEY(bookid)
)
;

DROP TABLE newbook;

INSERT INTO 
    newbook(BOOKID,ISBN,BOOKNAME,AUTHOR,PUBLISHER,PRICE,PUBLISHED_DATE) 
VALUES
    (1, 9781234567890, 'SQL Guide', 'John Doe', 'TechBooks', 15000, TO_DATE('2024-05-20', 'YYYY-MM-DD'));

INSERT INTO 
    newbook(BOOKID,ISBN,BOOKNAME,AUTHOR,PUBLISHER,PRICE,PUBLISHED_DATE) 
VALUES
    (2, 9781234567890, 'SQL Guide', 'John Doe', 'TechBooks', 15000, TO_DATE('2024-05-20 15:45:30', 'YYYY-MM-DD HH24:MI:SS'));

COMMIT;

-- �÷� �߰�
ALTER TABLE newbook ADD author_id NUMBER;
-- �÷� ����
ALTER TABLE newbook DROP COLUMN author_id;
-- �÷�����
ALTER TABLE newbook MODIFY(isbn VARCHAR2(50));

DELETE FROM newbook;

DESC NEWBOOK;

SELECT 
    *
FROM
    newbook
;

-- ON DELETE CASCADE �ɼ��� �����Ǿ� �־�, newcustomer ���̺��� � ���� ���ڵ尡 �����Ǹ�, �ش� ���� ��� �ֹ���
-- neworders ���̺����� �ڵ����� ����
CREATE TABLE newcustomer(
    custid NUMBER PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(40),
    phone VARCHAR2(30)
);

CREATE TABLE neworders(
    orderid NUMBER,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    primary key(custid),
    FOREIGN KEY(custid) REFERENCES newcustomer(custid) ON DELETE CASCADE
)
;

INSERT INTO newcustomer VALUES(1,'KEVIN','���ﵿ','010-1234-1234');
INSERT INTO neworders VALUES(10,1,100,1000,SYSDATE);

COMMIT;

SELECT * FROM newcustomer;
SELECT * FROM neworders;

DELETE FROM newcustomer;
DELETE FROM neworders;


-- Q. 10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ��ϼ���. �� FOREGIN KEY�� �����Ͽ� ���� ���̺��� �����͸� ������ �ٸ� ���̺���
-- ���õǴ� �����͵� ��� �����ǵ��� �ϼ���.(��� �������� �� ���)
-- ��, �� ���̺� 5���� �����͸� �Է��ϰ� �ι�° ���̺� ù��° �����͸� �����ϰ� �ִ� �Ӽ��� �����Ͽ� ������ ����

CREATE TABLE GOGEK(
    custid VARCHAR2(50) PRIMARY KEY,
    brdt DATE,
    gender CHAR(1),
    p_num NUMBER(11),
    juso VARCHAR2(200)
)

CREATE TABLE 

    