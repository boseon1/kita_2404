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

DROP TABLE STUDENTS cascade constraints purge;


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

commit;



DROP TABLE SCOREBOARD cascade constraints purge;
CREATE TABLE SCOREBOARD(
    NAME VARCHAR2(20),
    STDID NUMBER(10),
    MATH1 NUMBER(10),
    MATH2 NUMBER(10),
    MATH3 NUMBER(10),
    SCORE_MATH VARCHAR2(10),
    PHYS1 NUMBER(10),
    PHYS2 NUMBER(10),
    PHYS3 NUMBER(10),
    SCORE_PHYS VARCHAR2(10),
    ABSENCE NUMBER(10),
    FLUNK VARCHAR2(10)
);

INSERT   INTO   SCOREBOARD   VALUES   ('��ö��',220634,74,84,56,NULL,63,78,89,NULL,1,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̿���',230223,30,30,78,NULL,40,64,52,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ڹ���',240312,46,33,38,NULL,62,29,31,NULL,1,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('����ȣ',250506,80,35,47,NULL,70,64,97,NULL,0,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̼���',260721,96,63,96,NULL,56,40,61,NULL,1,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���¿�',270830,81,73,33,NULL,61,51,44,NULL,7,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',280917,91,58,69,NULL,59,40,85,NULL,8,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',290102,83,64,63,NULL,63,96,69,NULL,8,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���ȣ',300206,89,32,78,NULL,80,53,39,NULL,2,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̼���',310301,37,63,63,NULL,67,27,68,NULL,4,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ڿ���',320413,31,27,58,NULL,43,80,51,NULL,3,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���ٿ�',330520,73,89,26,NULL,99,79,70,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',340606,26,61,62,NULL,40,31,86,NULL,10,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',350707,84,38,58,NULL,54,51,48,NULL,4,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ֽ�ȣ',360822,52,55,45,NULL,24,73,62,NULL,10,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ڼ���',370925,47,68,44,NULL,72,48,69,NULL,4,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�迵ȣ',380107,56,69,90,NULL,98,49,88,NULL,4,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',390215,20,41,49,NULL,56,32,26,NULL,8,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�����',400330,43,21,79,NULL,39,52,24,NULL,2,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',410406,56,83,26,NULL,71,75,52,NULL,6,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',420502,83,83,71,NULL,38,98,44,NULL,2,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̹���',430603,40,77,27,NULL,94,77,73,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ڼ���',440727,39,62,48,NULL,74,83,94,NULL,8,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',450817,91,82,91,NULL,37,45,20,NULL,1,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',460920,86,22,66,NULL,91,28,79,NULL,0,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('����ȣ',470002,50,23,40,NULL,62,41,49,NULL,3,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̰���',480106,58,32,43,NULL,58,43,66,NULL,2,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',490225,27,94,53,NULL,33,36,44,NULL,3,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���̿�',500312,69,78,21,NULL,48,23,61,NULL,5,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('��ö��',510406,31,88,99,NULL,54,21,95,NULL,7,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̿���',520423,30,47,27,NULL,57,84,58,NULL,6,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ڹ���',530523,24,33,37,NULL,41,68,57,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('����ȣ',540606,66,41,48,NULL,48,50,25,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̼���',550721,64,86,49,NULL,93,70,67,NULL,1,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���¿�',560830,92,95,56,NULL,23,48,39,NULL,0,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',570917,64,94,27,NULL,53,92,33,NULL,0,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',580102,73,83,33,NULL,97,98,58,NULL,8,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���ȣ',590206,67,40,92,NULL,71,93,61,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�̼���',600301,78,41,57,NULL,21,92,22,NULL,2,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('�ڿ���',610413,75,51,84,NULL,54,76,26,NULL,8,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('���ٿ�',620520,55,33,53,NULL,81,53,51,NULL,9,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',630606,82,41,25,NULL,40,45,81,NULL,6,NULL);
INSERT   INTO   SCOREBOARD   VALUES   ('������',640707,30,57,72,NULL,54,32,96,NULL,6,NULL);

SELECT * FROM SCOREBOARD;


DROP TABLE RELOCATEE cascade constraints purge;
-- ������ ������ ��� ���̺� ����
CREATE TABLE RELOCATEE(
    NAME VARCHAR2(20),
    RELO_DATE DATE
);

INSERT   INTO   RELOCATEE   VALUES   ('��öȣ', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('������', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('������', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('��ҿ�', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('������', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('�ڽ¿�', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('�ֹ���', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('������', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('�̹���', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('������', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT   INTO   RELOCATEE   VALUES   ('�ּ���', TO_DATE('2024-09-01','YYYY-MM-DD'));

SELECT * FROM RELOCATEE;


-- FURTHER WORK
/*TABLE ���� ���� 1�� 2�� 3��, ��� ���� (I) Ư�� ���� ���ؼ� GRADE �ű�� �� (2) Ư�� ���� ������ ��� ��� 
TABLE ���ٰ� ������ ��� 
TABLE ��ȯ �л��� ��� 
ERD;
*/

-- Q. �й� ���� �Ҽӵ� �л���� ��� �������� �˻�
SELECT S.STDID �й�, S.NAME �̸�, S.CLASS "�г�/��", T.NAME "���Ӽ�����"
FROM STUDENTS S 
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
ORDER BY "�г�/��";
--WHERE T.NAME = '���̿�' OR T.NAME = '�����';

-- ���ٰ� �������� �Ҽӵ� �л��� �ٸ� ������ ��ġ

-- ���ٰ� ������ �л����� ���� �л��� ���� ������ ����
UPDATE students
SET
    class = (SELECT
                c.class
            FROM
                (SELECT
                     b.class
                    , count(b.class) as cnt
                FROM
                    teachers a
                    , students b
                WHERE
                    a.class_assigned = b.class
                    AND b.class like '1%'
                    AND a.name != '��öȣ'
                GROUP BY
                    b.class
                ORDER BY
                    count(b.class), class
                ) c
            WHERE
                rownum = 1)
WHERE
    class = (
        SELECT
            class_assigned
        FROM 
            teachers
        WHERE   
            name = '��öȣ'
        )
;

DELETE FROM teachers WHERE name = '��öȣ';
    
rollback;

select * from students where class like '1%' order by class;