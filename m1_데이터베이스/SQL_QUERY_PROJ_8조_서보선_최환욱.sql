-- �ǽ� 2�� 1�� 
-- �б� ������ ���Ͽ� ���̺� 2�� �̻� DB�� �����ϰ� 3�� �̻� Ȱ���� �� �ִ� CASE�� ���弼��
-- ��� ����, ��������, ���� ����

DROP TABLE TEACHERS cascade constraints purge;
CREATE TABLE TEACHERS(
    NAME VARCHAR2(20), -- �̸�
    BIRTH DATE, -- ����
    AGE NUMBER, -- ����
    SX VARCHAR2(10),    --  ����
    PHONE VARCHAR2(15), --  �ڵ�����ȣ
    ADDRESS VARCHAR2(50), -- �ּ�
    SUBJECT VARCHAR2(10), -- ��� ����
    CLASS_ASSIGNED VARCHAR2(15), -- ��� ��
    PRIMARY KEY (CLASS_ASSIGNED)
);


DROP TABLE STUDENTS cascade constraints purge;
CREATE TABLE STUDENTS(
    NAME VARCHAR2(20), -- �л���
    STDID NUMBER(10), -- �л� ��ȣ
    BIRTH DATE, -- �л� ����
    AGE NUMBER, -- ����
    SX VARCHAR2(10), -- ����
    PHONE VARCHAR2(15), -- �ڵ��� ��ȣ
    ADDRESS VARCHAR2(50), -- �ּ�
    FAV_JUBJECT VARCHAR2(10), -- ����
    CLASS   VARCHAR2(15), -- ��
    FOREIGN KEY (CLASS) REFERENCES TEACHERS(CLASS_ASSIGNED) ON DELETE CASCADE
);

INSERT INTO TEACHERS VALUES ('�迵��', '1993-02-03', 29, '��', '010-1234-5678', '���� ����', '����', '2�г� 3��');
INSERT INTO TEACHERS VALUES ('��ö��', '1987-12-15', 34, '��', '010-9876-5432', '�λ� �ؿ��', '����', '1�г� 2��');
INSERT INTO TEACHERS VALUES ('�ڹμ�', '1990-08-20', 31, '��', '010-1234-5678', '���� ����', '����', '3�г� 1��');
INSERT INTO TEACHERS VALUES ('������', '1985-06-10', 36, '��', '010-5678-1234', '��õ ����', '����', '2�г� 2��');
INSERT INTO TEACHERS VALUES ('ȫ�浿', '1991-03-25', 30, '��', '010-9876-5432', '���� ����', '����', '1�г� 3��');
INSERT INTO TEACHERS VALUES ('�̿���', '1988-11-15', 33, '��', '010-3456-7890', '�뱸 ����', 'ü��', '3�г� 4��');
INSERT INTO TEACHERS VALUES ('��̿�', '1994-09-18', 27, '��', '010-5678-1234', '���� ����', '�̼�', '2�г� 1��');
INSERT INTO TEACHERS VALUES ('�ڽ�ȣ', '1982-07-20', 39, '��', '010-2345-6789', '��� �Ⱦ�', '����', '1�г� 12��');
INSERT INTO TEACHERS VALUES ('���ٿ�', '1993-05-30', 28, '��', '010-7890-1234', '��� ����', '�ѱ���', '3�г� 3��');
INSERT INTO TEACHERS VALUES ('������', '1997-04-08', 24, '��', '010-1234-5678', '�泲 â��', '����', '2�г� 17��');
INSERT INTO TEACHERS VALUES ('��öȣ', '1981-08-10', 40, '��', '010-3456-7890', '���� ����', '����', '1�г� 1��');
INSERT INTO TEACHERS VALUES ('������', '1989-10-05', 32, '��', '010-5678-1234', '���� ����', '����', '3�г� 2��');
INSERT INTO TEACHERS VALUES ('���¹�', '1996-01-12', 25, '��', '010-2345-6789', '��õ ����', '����', '1�г� 5��');
INSERT INTO TEACHERS VALUES ('�����', '1987-07-22', 34, '��', '010-7890-1234', '��� ���', '����', '2�г� 4��');
INSERT INTO TEACHERS VALUES ('�̿�ȣ', '1992-12-14', 29, '��', '010-1234-5678', '���� �߱�', 'ü��', '1�г� 4��');
INSERT INTO TEACHERS VALUES ('������', '1986-04-30', 35, '��', '010-3456-7890', '���� ����', '�̼�', '3�г� 19��');
INSERT INTO TEACHERS VALUES ('�̰���', '1998-11-05', 23, '��', '010-5678-1234', '�λ� ����', '����', '2�г� 8��');
INSERT INTO TEACHERS VALUES ('�赿ȣ', '1990-02-28', 31, '��', '010-2345-6789', '��� ����', '�ѱ���', '3�г� 17��');
INSERT INTO TEACHERS VALUES ('������', '1983-09-15', 38, '��', '010-7890-1234', '���� ����', '����', '1�г� 16��');
INSERT INTO TEACHERS VALUES ('���ؿ�', '1995-05-18', 26, '��', '010-1234-5678', '��� ����', '����', '2�г� 20��');
INSERT INTO TEACHERS VALUES ('������', '1980-12-10', 41, '��', '010-3456-7890', '���� ����', '����', '3�г� 8��');
INSERT INTO TEACHERS VALUES ('�ִٿ�', '1988-07-20', 33, '��', '010-9876-5432', '�λ� �ؿ��', '����', '1�г� 9��');
INSERT INTO TEACHERS VALUES ('�輺ȣ', '1993-04-03', 28, '��', '010-2345-6789', '��õ ����', '����', '2�г� 19��');
INSERT INTO TEACHERS VALUES ('�ڹ̿�', '1997-01-28', 24, '��', '010-7890-1234', '�뱸 ����', 'ü��', '1�г� 6��');
INSERT INTO TEACHERS VALUES ('���ȣ', '1981-10-08', 40, '��', '010-1234-5678', '���� ����', '�̼�', '2�г� 10��');
INSERT INTO TEACHERS VALUES ('������', '1994-09-03', 27, '��', '010-3456-7890', '���� ����', '����', '1�г� 17��');
INSERT INTO TEACHERS VALUES ('������', '1985-03-20', 36, '��', '010-5678-1234', '��� �Ⱦ�', '�ѱ���', '3�г� 20��');
INSERT INTO TEACHERS VALUES ('�ڿ���', '1998-11-22', 23, '��', '010-2345-6789', '��� ����', '����', '2�г� 9��');
INSERT INTO TEACHERS VALUES ('��μ�', '1991-06-07', 30, '��', '010-7890-1234', '���� ����', '����', '1�г� 10��');

SELECT * FROM TEACHERS;


INSERT INTO STUDENTS VALUES ('��ö��', 220634, '2006-03-15', 17, '��', '010-1234-5678', '���� ����', '����', '3�г� 3��');
INSERT INTO STUDENTS VALUES ('�̿���', 230223, '2007-04-20', 15, '��', '010-9876-5432', '�λ� �ؿ��', '����', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('�ڹ���', 240312, '2008-06-23', 14, '��', '010-2345-6789', '�뱸 ����', '����', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('����ȣ', 250506, '2007-09-08', 15, '��', '010-8765-4321', '��õ ����', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('�̼���', 260721, '2006-12-30', 16, '��', '010-3456-7890', '���� ����', '����', '3�г� 4��');
INSERT INTO STUDENTS VALUES ('���¿�', 270830, '2005-11-10', 17, '��', '010-7890-1234', '���� ����', '����', '1�г� 3��');
INSERT INTO STUDENTS VALUES ('������', 280917, '2006-01-20', 16, '��', '010-4567-8901', '���� �߱�', '�̼�', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 290102, '2007-03-05', 15, '��', '010-2345-6789', '��� ����', 'ü��', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('���ȣ', 300206, '2006-11-18', 16, '��', '010-7890-1234', '���� ����', '�ѱ���', '1�г� 2��');
INSERT INTO STUDENTS VALUES ('�̼���', 310301, '2008-04-30', 14, '��', '010-3456-7890', '��� ����', '�̼�', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('�ڿ���', 320413, '2005-06-15', 17, '��', '010-9876-5432', '���� ����', '����', '3�г� 4��');
INSERT INTO STUDENTS VALUES ('���ٿ�', 330520, '2006-07-20', 16, '��', '010-2345-6789', '���� ����', 'ü��', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 340606, '2005-03-04', 17, '��', '010-7890-1234', '�泲 â��', '�̼�', '2�г� 4��');
INSERT INTO STUDENTS VALUES ('������', 350707, '2008-01-20', 14, '��', '010-3456-7890', '���� ����', '����', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('�ֽ�ȣ', 360822, '2006-09-18', 16, '��', '010-1234-5678', '�λ� ����', '����', '1�г� 4��');
INSERT INTO STUDENTS VALUES ('�ڼ���', 370925, '2007-05-22', 15, '��', '010-9876-5432', '��� �Ⱦ�', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('�迵ȣ', 380107, '2005-08-07', 17, '��', '010-2345-6789', '���� ����', '�ѱ���', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 390215, '2006-04-15', 16, '��', '010-3456-7890', '���� ����', 'ü��', '1�г� 3��');
INSERT INTO STUDENTS VALUES ('�����', 400330, '2007-06-28', 15, '��', '010-1234-5678', '��õ ����', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 410406, '2005-02-09', 17, '��', '010-9876-5432', '��� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 420502, '2008-01-19', 14, '��', '010-2345-6789', '�뱸 �޼�', '�̼�', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('�̹���', 430603, '2006-06-12', 16, '��', '010-3456-7890', '���� ����', '����', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('�ڼ���', 440727, '2005-12-03', 16, '��', '010-1234-5678', '��� ���', '����', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 450817, '2008-06-28', 14, '��', '010-9876-5432', '���� ����', 'ü��', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 460920, '2007-11-18', 15, '��', '010-2345-6789', '���� �ϱ�', '����', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('����ȣ', 470002, '2006-09-07', 16, '��', '010-3456-7890', '�泲 ����', '����', '3�г� 1��');
INSERT INTO STUDENTS VALUES ('�̰���', 480106, '2005-08-23', 17, '��', '010-1234-5678', '���� ����', '����', '1�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 490225, '2008-04-12', 14, '��', '010-9876-5432', '��õ ����', '����', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('���̿�', 500312, '2007-11-05', 15, '��', '010-1234-5678', '���� ����', '�̼�', '1�г� 4��');
INSERT INTO STUDENTS VALUES ('��ö��', 510406, '2004-03-15', 18, '��', '010-1234-5678', '���� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('�̿���', 520423, '2005-04-20', 17, '��', '010-9876-5432', '�λ� �ؿ��', '����', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('�ڹ���', 530523, '2004-06-23', 17, '��', '010-2345-6789', '�뱸 ����', '����', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('����ȣ', 540606, '2003-09-08', 18, '��', '010-8765-4321', '��õ ����', '����', '2�г� 1��');
INSERT INTO STUDENTS VALUES ('�̼���', 550721, '2004-12-30', 17, '��', '010-3456-7890', '���� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('���¿�', 560830, '2003-11-10', 18, '��', '010-7890-1234', '���� ����', '����', '1�г� 3��');
INSERT INTO STUDENTS VALUES ('������', 570917, '2004-01-20', 18, '��', '010-4567-8901', '���� �߱�', '�̼�', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 580102, '2005-03-05', 17, '��', '010-2345-6789', '��� ����', 'ü��', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('���ȣ', 590206, '2004-11-18', 17, '��', '010-7890-1234', '���� ����', '�ѱ���', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('�̼���', 600301, '2006-04-30', 16, '��', '010-3456-7890', '��� ����', '�̼�', '2�г� 3��');
INSERT INTO STUDENTS VALUES ('�ڿ���', 610413, '2003-06-15', 18, '��', '010-9876-5432', '���� ����', '����', '3�г� 2��');
INSERT INTO STUDENTS VALUES ('���ٿ�', 620520, '2004-07-20', 17, '��', '010-2345-6789', '���� ����', 'ü��', '1�г� 1��');
INSERT INTO STUDENTS VALUES ('������', 630606, '2003-03-04', 18, '��', '010-7890-1234', '�泲 â��', '�̼�', '2�г� 2��');
INSERT INTO STUDENTS VALUES ('������', 640707, '2006-01-20', 16, '��', '010-3456-7890', '���� ����', '����', '3�г� 3��');

SELECT * FROM STUDENTS;


DROP TABLE SCOREBOARD cascade constraints purge;
CREATE TABLE SCOREBOARD(
    NAME VARCHAR2(20),          -- �л���
    STDID NUMBER(10),           -- �л� ��ȣ
    MATH1 NUMBER(10),           -- ���� 1�� ����
    MATH2 NUMBER(10),           -- ���� 2�� ����
    MATH3 NUMBER(10),           -- ���� 3�� ����
    SCORE_MATH VARCHAR2(10),    -- ���� ����
    PHYS1 NUMBER(10),           -- ���� 1�� ����
    PHYS2 NUMBER(10),           -- ���� 2�� ����
    PHYS3 NUMBER(10),           -- ���� 3�� ����
    SCORE_PHYS VARCHAR2(10),    -- ���� ����
    ABSENCE NUMBER(10),         -- �Ἦ �ϼ�
    FLUNK VARCHAR2(10)          -- ���� ����
);

INSERT	INTO	SCOREBOARD	VALUES	('��ö��',220634,74,84,56,NULL,63,78,89,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̿���',230223,30,30,78,NULL,40,64,52,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڹ���',240312,46,33,38,NULL,62,29,31,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('����ȣ',250506,80,35,47,NULL,70,64,97,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',260721,96,63,96,NULL,56,40,61,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���¿�',270830,81,73,33,NULL,61,51,44,NULL,7,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',280917,91,58,69,NULL,59,40,85,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',290102,83,64,63,NULL,63,96,69,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ȣ',300206,89,32,78,NULL,80,53,39,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',310301,37,63,63,NULL,67,27,68,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڿ���',320413,31,27,58,NULL,43,80,51,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ٿ�',330520,73,89,26,NULL,99,79,70,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',340606,26,61,62,NULL,40,31,86,NULL,10,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',350707,84,38,58,NULL,54,51,48,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ֽ�ȣ',360822,52,55,45,NULL,24,73,62,NULL,10,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڼ���',370925,47,68,44,NULL,72,48,69,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�迵ȣ',380107,56,69,90,NULL,98,49,88,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',390215,20,41,49,NULL,56,32,26,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�����',400330,43,21,79,NULL,39,52,24,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',410406,56,83,26,NULL,71,75,52,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',420502,83,83,71,NULL,38,98,44,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̹���',430603,40,77,27,NULL,94,77,73,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڼ���',440727,39,62,48,NULL,74,83,94,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',450817,91,82,91,NULL,37,45,20,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',460920,86,22,66,NULL,91,28,79,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('����ȣ',470002,50,23,40,NULL,62,41,49,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̰���',480106,58,32,43,NULL,58,43,66,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',490225,27,94,53,NULL,33,36,44,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���̿�',500312,69,78,21,NULL,48,23,61,NULL,5,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('��ö��',510406,31,88,99,NULL,54,21,95,NULL,7,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̿���',520423,30,47,27,NULL,57,84,58,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڹ���',530523,24,33,37,NULL,41,68,57,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('����ȣ',540606,66,41,48,NULL,48,50,25,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',550721,64,86,49,NULL,93,70,67,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���¿�',560830,92,95,56,NULL,23,48,39,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',570917,64,94,27,NULL,53,92,33,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',580102,73,83,33,NULL,97,98,58,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ȣ',590206,67,40,92,NULL,71,93,61,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�̼���',600301,78,41,57,NULL,21,92,22,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('�ڿ���',610413,75,51,84,NULL,54,76,26,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('���ٿ�',620520,55,33,53,NULL,81,53,51,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',630606,82,41,25,NULL,40,45,81,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('������',640707,30,57,72,NULL,54,32,96,NULL,6,NULL);

DROP TABLE RELOCATEE cascade constraints purge;

-- ������ ������ ��� ���̺� ����
CREATE TABLE RELOCATEE(
    NAME VARCHAR2(20),      -- ������ �̸�
    RELO_DATE DATE          -- ���� ����
);

INSERT	INTO	RELOCATEE	VALUES	('��öȣ', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('��ҿ�', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�ڽ¿�', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�ֹ���', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�̹���', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('������', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('�ּ���', TO_DATE('2024-09-01','YYYY-MM-DD'));

SELECT * FROM RELOCATEE;
    
SELECT * FROM TEACHERS;
SELECT * FROM STUDENTS;
SELECT * FROM SCOREBOARD;
SELECT * FROM RELOCATEE;

------------------------------ Q.�й� ���� �Ҽӵ� �л���� ��� �������� �˻�
SELECT S.STDID �й�, S.NAME �̸�, S.CLASS "�г�/��", T.NAME "���Ӽ�����"
FROM STUDENTS S 
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
ORDER BY "�г�/��";


------------------------------ Q.���� TABLE���� ����/���� ������ ���񿡼� 1��, 2��, 3��, ���迡 ���� ����ġ X 0.3�� ������ ����
------------------------------ �ջ� ������ �Ἦ�ϼ��� ���ؼ� ���� ����/���� ���� ������ SCORE_MATH�� SCORE_PHYS COLUMN�� UPDATE
UPDATE SCOREBOARD SET
SCORE_MATH = ROUND((MATH1 * 0.3 + MATH2 * 0.3 + MATH3 * 0.3) - ABSENCE),
SCORE_PHYS = ROUND((PHYS1 * 0.3 + PHYS2 * 0.3 + PHYS3 * 0.3) - ABSENCE);
SELECT * FROM SCOREBOARD;



------------------------------ Q. ���� ���� ���� ��� 1,2,3�� ����� ��������� ����� �ջ� �����κ��� 
------------------------------ 65�� �̻�: A, 64~55��: B, 54~45�� : C, 44~36�� D, 35�� ����: F �������� ���� ó���ؼ� 
------------------------------ GRADE_MATH�� GRADE_PHYS NEW COLUMN ���� �˻� ����
SELECT NAME, STDID, SCORE_MATH,
CASE
WHEN SCORE_MATH >= 65 THEN 'A'
WHEN SCORE_MATH BETWEEN 55 AND 64 THEN 'B'
WHEN SCORE_MATH BETWEEN 45 AND 54 THEN 'C'
WHEN SCORE_MATH BETWEEN 36 AND 44 THEN 'D'
ELSE 'F'
END AS GRADE_MATH,
SCORE_PHYS,
CASE
WHEN SCORE_PHYS >= 65 THEN 'A'
WHEN SCORE_PHYS BETWEEN 55 AND 64 THEN 'B'
WHEN SCORE_PHYS BETWEEN 45 AND 54 THEN 'C'
WHEN SCORE_PHYS BETWEEN 36 AND 44 THEN 'D'
ELSE 'F'
END AS GRADE_PHYS,
ABSENCE,
FLUNK
FROM SCOREBOARD;

------------------------------ Q.���� ���� ������ ���� ���а� ������ ������ �׷��̵� �ϰ�, �� ������ �����ڸ� �˻��ؼ� FLUNK �÷� UPDATE
UPDATE SCOREBOARD
SET FLUNK = CASE
WHEN TO_NUMBER(SCORE_MATH) <= 35 AND TO_NUMBER(SCORE_PHYS) <= 35 THEN '����'
WHEN TO_NUMBER(SCORE_MATH) <= 35 OR TO_NUMBER(SCORE_PHYS) <= 35 THEN '���'
ELSE 'PASS'
END;
SELECT * FROM SCOREBOARD;

------------------------------ Q.������ ���� Ȥ�� ���� ������ �ش��ϴ� �л��� ���� �������� ����Ʈ�� ����
SELECT
    S.NAME AS �л��̸�,
    S.CLASS AS "�г�/��",
    T.NAME AS ��米��,
    SB.FLUNK AS ���޿���
FROM SCOREBOARD SB
INNER JOIN STUDENTS S ON SB.STDID = S.STDID
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
WHERE SB.FLUNK IN ('����', '����');


------------------------------ Q.�� ���� ��ο��� ������ ���� �л��� ���� �������� ��� ����
SELECT
    S.NAME AS �л��̸�,
    S.CLASS AS "�г�/��",
    T.NAME AS "���� ��� ���� ����"
FROM SCOREBOARD SB
INNER JOIN STUDENTS S ON SB.STDID = S.STDID
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
WHERE SB.FLUNK IN ('����');

------------------------------ Q.�ݺ� ��� ������ ���� ���� �� ������ ���� (�г� ���� ����)
SELECT
    T.CLASS_ASSIGNED AS CLASS,
    ROUND(AVG(SB_MATH_SCORE),2) AS AVG_MATH_SCORE,
    T.NAME AS TEACHER_NAME
FROM TEACHERS T
JOIN STUDENTS S ON T.CLASS_ASSIGNED = S.CLASS
JOIN (SELECT STDID, AVG(TO_NUMBER(SCORE_MATH)) AS SB_MATH_SCORE
    FROM SCOREBOARD
    GROUP BY STDID) SB ON S.STDID = SB.STDID
GROUP BY T.CLASS_ASSIGNED, T.NAME
ORDER BY AVG_MATH_SCORE DESC, T.CLASS_ASSIGNED;

select
    a.class
    ,a.math_rank
    ,b.phys_rank
from
    (SELECT 
        b.class
        ,RANK() OVER (ORDER BY round(avg(a.score_math)) DESC) as math_rank
    FROM
        SCOREBOARD A
        ,STUDENTS B
    WHERE
        A.stdid = B.stdid
    group by
        b.class    
     ) a
     ,(SELECT 
            b.class
            ,RANK() OVER (ORDER BY round(avg(a.score_phys)) DESC) as phys_rank
        FROM
            SCOREBOARD A
            ,STUDENTS B
        WHERE
            A.stdid = B.stdid
        group by
            b.class
        ) b
where
    a.class = b.class
    and (a.math_rank = 1 or  b.phys_rank = 1)
;

SELECT 
    b.class
    ,a.score_math
    ,a.score_phys

FROM
    SCOREBOARD A
    ,STUDENTS B
WHERE
    A.stdid = B.stdid

  ;
--------------------------------------------------- Q.�ݺ� ��� ������ ���� ���� �� ������ ���� (1�г� ��)
SELECT
    T.CLASS_ASSIGNED AS CLASS,
    ROUND(AVG(SB_MATH_SCORE), 2) AS AVG_MATH_SCORE,
    T.NAME AS TEACHER_NAME
FROM TEACHERS T
JOIN STUDENTS S ON T.CLASS_ASSIGNED = S.CLASS
JOIN (SELECT STUDENTS.STDID,AVG(TO_NUMBER(SCORE_MATH)) AS SB_MATH_SCORE
    FROM SCOREBOARD
    JOIN STUDENTS ON SCOREBOARD.STDID = STUDENTS.STDID
    AND SUBSTR(STUDENTS.CLASS, 1, 1) = '1' 
    GROUP BY STUDENTS.STDID) SB ON S.STDID = SB.STDID
GROUP BY T.CLASS_ASSIGNED, T.NAME
ORDER BY AVG_MATH_SCORE DESC;

--------------------------------------------------- Q.�ݺ� ��� ������ ���� ���� �� ������ ���� (3�г� ��)
SELECT.
    T.CLASS_ASSIGNED AS CLASS,
    ROUND(AVG(SB_MATH_SCORE), 2) AS AVG_MATH_SCORE,
    T.NAME AS TEACHER_NAME
FROM TEACHERS T
JOIN STUDENTS S ON T.CLASS_ASSIGNED = S.CLASS
JOIN (SELECT STUDENTS.STDID,AVG(TO_NUMBER(SCORE_MATH)) AS SB_MATH_SCORE
    FROM SCOREBOARD
    JOIN STUDENTS ON SCOREBOARD.STDID = STUDENTS.STDID
    AND SUBSTR(STUDENTS.CLASS, 1, 1) = '3' 
    GROUP BY STUDENTS.STDID) SB ON S.STDID = SB.STDID
GROUP BY T.CLASS_ASSIGNED, T.NAME
ORDER BY AVG_MATH_SCORE DESC;


------------------------------ Q.STUDENT TABLE���� �л� ��ܿ� �г��� �����ؼ� ����
SELECT
    NAME AS STUDENT_NAME,
    STDID AS STUDENT_ID,
    AGE AS STUDENT_AGE,
    SUBSTR(CLASS, 1, 1) AS GRADE
FROM STUDENTS
ORDER BY GRADE;



--------------------------------------------------- Q. �г� �� �л� ���� ������ ��, ������ �� ��� �л� �� ������ ���� ������ ����
WITH StudentCount AS (
    SELECT SUBSTR(CLASS, 1, 1) AS GRADE, COUNT(*) AS NUM_STUDENTS
    FROM STUDENTS
    GROUP BY SUBSTR(CLASS, 1, 1)),
TeacherCount AS ( 
    SELECT SUBSTR(CLASS_ASSIGNED, 1, 1) AS GRADE, COUNT(*) AS NUM_TEACHERS
    FROM TEACHERS 
    GROUP BY SUBSTR(CLASS_ASSIGNED, 1, 1)),
StudentPerTeacher AS (
    SELECT S.GRADE, S.NUM_STUDENTS AS STUDENT_COUNT, T.NUM_TEACHERS AS TEACHER_COUNT,
        ROUND(S.NUM_STUDENTS / T.NUM_TEACHERS, 2) AS STUDENT_PER_TEACHER
    FROM StudentCount S
    JOIN TeacherCount T ON S.GRADE = T.GRADE)
SELECT SPT.GRADE, SPT.STUDENT_COUNT, SPT.TEACHER_COUNT, SPT.STUDENT_PER_TEACHER
FROM StudentPerTeacher SPT
ORDER BY
    SPT.STUDENT_PER_TEACHER DESC;


--------------------------------------------------- Q. ���ٰ� ������ �л����� ���� �л��� ���� ������ ����
UPDATE STUDENTS
SET CLASS = (SELECT  C.CLASS
            FROM (SELECT B.CLASS, COUNT(B.CLASS) AS CNT
                  FROM TEACHERS A, STUDENTS B
                  WHERE A.CLASS_ASSIGNED = B.CLASS AND B.CLASS LIKE '1%' AND A.NAME != '��öȣ'
                  GROUP BY B.CLASS
                  ORDER BY COUNT(B.CLASS)) C
            WHERE ROWNUM = 1)
WHERE CLASS = (SELECT CLASS_ASSIGNED
            FROM TEACHERS
            WHERE NAME = '��öȣ');


ROLLBACK;
DELETE FROM teachers WHERE name = '��öȣ';


SELECT
    a.name
FROM
    TEACHERS A
    ,RELOCATEE B
    ,STUDENTS C
WHERE
    A.NAME = B.NAME
    AND A.class_assigned = c.class
;
    