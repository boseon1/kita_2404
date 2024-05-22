-- 실습 2인 1조 
-- 학교 관리를 위하여 테이블 2개 이상 DB로 구축하고 3개 이상 활용할 수 있는 CASE를 만드세요
-- 출결 관리, 학적관리, 성적 관리

DROP TABLE TEACHERS cascade constraints purge;
CREATE TABLE TEACHERS(
    NAME VARCHAR2(20), -- 이름
    BIRTH DATE, -- 생일
    AGE NUMBER, -- 나이
    SX VARCHAR2(10),    --  성별
    PHONE VARCHAR2(15), --  핸드폰번호
    ADDRESS VARCHAR2(50), -- 주소
    SUBJECT VARCHAR2(10), -- 담당 과목
    CLASS_ASSIGNED VARCHAR2(15), -- 담당 반
    PRIMARY KEY (CLASS_ASSIGNED)
);


DROP TABLE STUDENTS cascade constraints purge;
CREATE TABLE STUDENTS(
    NAME VARCHAR2(20), -- 학생명
    STDID NUMBER(10), -- 학생 번호
    BIRTH DATE, -- 학생 생일
    AGE NUMBER, -- 나이
    SX VARCHAR2(10), -- 성별
    PHONE VARCHAR2(15), -- 핸드폰 번호
    ADDRESS VARCHAR2(50), -- 주소
    FAV_JUBJECT VARCHAR2(10), -- 과목
    CLASS   VARCHAR2(15), -- 반
    FOREIGN KEY (CLASS) REFERENCES TEACHERS(CLASS_ASSIGNED) ON DELETE CASCADE
);

INSERT INTO TEACHERS VALUES ('김영희', '1993-02-03', 29, '여', '010-1234-5678', '서울 강남', '영어', '2학년 3반');
INSERT INTO TEACHERS VALUES ('이철수', '1987-12-15', 34, '남', '010-9876-5432', '부산 해운대', '과학', '1학년 2반');
INSERT INTO TEACHERS VALUES ('박민수', '1990-08-20', 31, '남', '010-1234-5678', '서울 서초', '수학', '3학년 1반');
INSERT INTO TEACHERS VALUES ('정지은', '1985-06-10', 36, '여', '010-5678-1234', '인천 남구', '국어', '2학년 2반');
INSERT INTO TEACHERS VALUES ('홍길동', '1991-03-25', 30, '남', '010-9876-5432', '대전 동구', '역사', '1학년 3반');
INSERT INTO TEACHERS VALUES ('이영수', '1988-11-15', 33, '남', '010-3456-7890', '대구 수성', '체육', '3학년 4반');
INSERT INTO TEACHERS VALUES ('김미영', '1994-09-18', 27, '여', '010-5678-1234', '광주 서구', '미술', '2학년 1반');
INSERT INTO TEACHERS VALUES ('박승호', '1982-07-20', 39, '남', '010-2345-6789', '경기 안양', '음악', '1학년 12반');
INSERT INTO TEACHERS VALUES ('정다영', '1993-05-30', 28, '여', '010-7890-1234', '경북 포항', '한국사', '3학년 3반');
INSERT INTO TEACHERS VALUES ('이지현', '1997-04-08', 24, '여', '010-1234-5678', '경남 창원', '영어', '2학년 17반');
INSERT INTO TEACHERS VALUES ('김철호', '1981-08-10', 40, '남', '010-3456-7890', '전남 목포', '과학', '1학년 1반');
INSERT INTO TEACHERS VALUES ('박지은', '1989-10-05', 32, '여', '010-5678-1234', '서울 강서', '수학', '3학년 2반');
INSERT INTO TEACHERS VALUES ('정승민', '1996-01-12', 25, '남', '010-2345-6789', '인천 연수', '국어', '1학년 5반');
INSERT INTO TEACHERS VALUES ('김민지', '1987-07-22', 34, '여', '010-7890-1234', '경기 고양', '역사', '2학년 4반');
INSERT INTO TEACHERS VALUES ('이영호', '1992-12-14', 29, '남', '010-1234-5678', '대전 중구', '체육', '1학년 4반');
INSERT INTO TEACHERS VALUES ('최현우', '1986-04-30', 35, '남', '010-3456-7890', '광주 동구', '미술', '3학년 19반');
INSERT INTO TEACHERS VALUES ('이가연', '1998-11-05', 23, '여', '010-5678-1234', '부산 사하', '음악', '2학년 8반');
INSERT INTO TEACHERS VALUES ('김동호', '1990-02-28', 31, '남', '010-2345-6789', '경북 경주', '한국사', '3학년 17반');
INSERT INTO TEACHERS VALUES ('장지은', '1983-09-15', 38, '여', '010-7890-1234', '전북 전주', '영어', '1학년 16반');
INSERT INTO TEACHERS VALUES ('정준우', '1995-05-18', 26, '남', '010-1234-5678', '경기 수원', '과학', '2학년 20반');
INSERT INTO TEACHERS VALUES ('이지민', '1980-12-10', 41, '여', '010-3456-7890', '서울 강남', '수학', '3학년 8반');
INSERT INTO TEACHERS VALUES ('최다영', '1988-07-20', 33, '여', '010-9876-5432', '부산 해운대', '국어', '1학년 9반');
INSERT INTO TEACHERS VALUES ('김성호', '1993-04-03', 28, '남', '010-2345-6789', '인천 남구', '역사', '2학년 19반');
INSERT INTO TEACHERS VALUES ('박미영', '1997-01-28', 24, '여', '010-7890-1234', '대구 수성', '체육', '1학년 6반');
INSERT INTO TEACHERS VALUES ('김승호', '1981-10-08', 40, '남', '010-1234-5678', '서울 강서', '미술', '2학년 10반');
INSERT INTO TEACHERS VALUES ('이지은', '1994-09-03', 27, '여', '010-3456-7890', '대전 동구', '음악', '1학년 17반');
INSERT INTO TEACHERS VALUES ('최지우', '1985-03-20', 36, '남', '010-5678-1234', '경기 안양', '한국사', '3학년 20반');
INSERT INTO TEACHERS VALUES ('박영수', '1998-11-22', 23, '남', '010-2345-6789', '경북 포항', '영어', '2학년 9반');
INSERT INTO TEACHERS VALUES ('김민수', '1991-06-07', 30, '여', '010-7890-1234', '전남 목포', '과학', '1학년 10반');

SELECT * FROM TEACHERS;


INSERT INTO STUDENTS VALUES ('김철수', 220634, '2006-03-15', 17, '남', '010-1234-5678', '서울 강남', '영어', '3학년 3반');
INSERT INTO STUDENTS VALUES ('이영희', 230223, '2007-04-20', 15, '여', '010-9876-5432', '부산 해운대', '과학', '2학년 2반');
INSERT INTO STUDENTS VALUES ('박민지', 240312, '2008-06-23', 14, '여', '010-2345-6789', '대구 수성', '수학', '1학년 1반');
INSERT INTO STUDENTS VALUES ('정성호', 250506, '2007-09-08', 15, '남', '010-8765-4321', '인천 남구', '국어', '2학년 1반');
INSERT INTO STUDENTS VALUES ('이수진', 260721, '2006-12-30', 16, '여', '010-3456-7890', '광주 동구', '역사', '3학년 4반');
INSERT INTO STUDENTS VALUES ('김태영', 270830, '2005-11-10', 17, '남', '010-7890-1234', '서울 송파', '음악', '1학년 3반');
INSERT INTO STUDENTS VALUES ('박현수', 280917, '2006-01-20', 16, '남', '010-4567-8901', '대전 중구', '미술', '2학년 2반');
INSERT INTO STUDENTS VALUES ('정지은', 290102, '2007-03-05', 15, '여', '010-2345-6789', '경기 수원', '체육', '3학년 1반');
INSERT INTO STUDENTS VALUES ('김승호', 300206, '2006-11-18', 16, '남', '010-7890-1234', '서울 강동', '한국사', '1학년 2반');
INSERT INTO STUDENTS VALUES ('이수진', 310301, '2008-04-30', 14, '여', '010-3456-7890', '경북 포항', '미술', '2학년 3반');
INSERT INTO STUDENTS VALUES ('박영민', 320413, '2005-06-15', 17, '남', '010-9876-5432', '전남 목포', '음악', '3학년 4반');
INSERT INTO STUDENTS VALUES ('정다영', 330520, '2006-07-20', 16, '여', '010-2345-6789', '서울 마포', '체육', '1학년 1반');
INSERT INTO STUDENTS VALUES ('이재현', 340606, '2005-03-04', 17, '남', '010-7890-1234', '경남 창원', '미술', '2학년 4반');
INSERT INTO STUDENTS VALUES ('김지현', 350707, '2008-01-20', 14, '여', '010-3456-7890', '서울 서초', '수학', '3학년 1반');
INSERT INTO STUDENTS VALUES ('최승호', 360822, '2006-09-18', 16, '남', '010-1234-5678', '부산 사하', '국어', '1학년 4반');
INSERT INTO STUDENTS VALUES ('박수민', 370925, '2007-05-22', 15, '여', '010-9876-5432', '경기 안양', '과학', '2학년 1반');
INSERT INTO STUDENTS VALUES ('김영호', 380107, '2005-08-07', 17, '남', '010-2345-6789', '대전 서구', '한국사', '3학년 2반');
INSERT INTO STUDENTS VALUES ('이현주', 390215, '2006-04-15', 16, '여', '010-3456-7890', '서울 강서', '체육', '1학년 3반');
INSERT INTO STUDENTS VALUES ('정재원', 400330, '2007-06-28', 15, '남', '010-1234-5678', '인천 부평', '영어', '2학년 1반');
INSERT INTO STUDENTS VALUES ('최지훈', 410406, '2005-02-09', 17, '남', '010-9876-5432', '경북 경주', '수학', '3학년 2반');
INSERT INTO STUDENTS VALUES ('김지영', 420502, '2008-01-19', 14, '여', '010-2345-6789', '대구 달서', '미술', '1학년 1반');
INSERT INTO STUDENTS VALUES ('이민재', 430603, '2006-06-12', 16, '남', '010-3456-7890', '서울 송파', '국어', '2학년 3반');
INSERT INTO STUDENTS VALUES ('박수진', 440727, '2005-12-03', 16, '여', '010-1234-5678', '경기 고양', '역사', '3학년 1반');
INSERT INTO STUDENTS VALUES ('정지원', 450817, '2008-06-28', 14, '남', '010-9876-5432', '전북 전주', '체육', '1학년 1반');
INSERT INTO STUDENTS VALUES ('김은지', 460920, '2007-11-18', 15, '여', '010-2345-6789', '광주 북구', '음악', '2학년 2반');
INSERT INTO STUDENTS VALUES ('최준호', 470002, '2006-09-07', 16, '남', '010-3456-7890', '경남 진주', '과학', '3학년 1반');
INSERT INTO STUDENTS VALUES ('이가영', 480106, '2005-08-23', 17, '여', '010-1234-5678', '서울 강북', '수학', '1학년 2반');
INSERT INTO STUDENTS VALUES ('박진우', 490225, '2008-04-12', 14, '남', '010-9876-5432', '인천 연수', '국어', '2학년 3반');
INSERT INTO STUDENTS VALUES ('정미영', 500312, '2007-11-05', 15, '여', '010-1234-5678', '서울 동작', '미술', '1학년 4반');
INSERT INTO STUDENTS VALUES ('김철수', 510406, '2004-03-15', 18, '남', '010-1234-5678', '서울 강남', '영어', '3학년 2반');
INSERT INTO STUDENTS VALUES ('이영희', 520423, '2005-04-20', 17, '여', '010-9876-5432', '부산 해운대', '과학', '2학년 2반');
INSERT INTO STUDENTS VALUES ('박민지', 530523, '2004-06-23', 17, '여', '010-2345-6789', '대구 수성', '수학', '1학년 1반');
INSERT INTO STUDENTS VALUES ('정성호', 540606, '2003-09-08', 18, '남', '010-8765-4321', '인천 남구', '국어', '2학년 1반');
INSERT INTO STUDENTS VALUES ('이수진', 550721, '2004-12-30', 17, '여', '010-3456-7890', '광주 동구', '역사', '3학년 2반');
INSERT INTO STUDENTS VALUES ('김태영', 560830, '2003-11-10', 18, '남', '010-7890-1234', '서울 송파', '음악', '1학년 3반');
INSERT INTO STUDENTS VALUES ('박현수', 570917, '2004-01-20', 18, '남', '010-4567-8901', '대전 중구', '미술', '2학년 2반');
INSERT INTO STUDENTS VALUES ('정지은', 580102, '2005-03-05', 17, '여', '010-2345-6789', '경기 수원', '체육', '3학년 2반');
INSERT INTO STUDENTS VALUES ('김승호', 590206, '2004-11-18', 17, '남', '010-7890-1234', '서울 강동', '한국사', '1학년 1반');
INSERT INTO STUDENTS VALUES ('이수진', 600301, '2006-04-30', 16, '여', '010-3456-7890', '경북 포항', '미술', '2학년 3반');
INSERT INTO STUDENTS VALUES ('박영민', 610413, '2003-06-15', 18, '남', '010-9876-5432', '전남 목포', '음악', '3학년 2반');
INSERT INTO STUDENTS VALUES ('정다영', 620520, '2004-07-20', 17, '여', '010-2345-6789', '서울 마포', '체육', '1학년 1반');
INSERT INTO STUDENTS VALUES ('이재현', 630606, '2003-03-04', 18, '남', '010-7890-1234', '경남 창원', '미술', '2학년 2반');
INSERT INTO STUDENTS VALUES ('김지현', 640707, '2006-01-20', 16, '여', '010-3456-7890', '서울 서초', '수학', '3학년 3반');

SELECT * FROM STUDENTS;


DROP TABLE SCOREBOARD cascade constraints purge;
CREATE TABLE SCOREBOARD(
    NAME VARCHAR2(20),          -- 학생명
    STDID NUMBER(10),           -- 학생 번호
    MATH1 NUMBER(10),           -- 수학 1차 점수
    MATH2 NUMBER(10),           -- 수학 2차 점수
    MATH3 NUMBER(10),           -- 수학 3차 점수
    SCORE_MATH VARCHAR2(10),    -- 수학 점수
    PHYS1 NUMBER(10),           -- 물리 1차 점수
    PHYS2 NUMBER(10),           -- 물리 2차 점수
    PHYS3 NUMBER(10),           -- 물리 3차 점수
    SCORE_PHYS VARCHAR2(10),    -- 물리 점수
    ABSENCE NUMBER(10),         -- 결석 일수
    FLUNK VARCHAR2(10)          -- 유급 여부
);

INSERT	INTO	SCOREBOARD	VALUES	('김철수',220634,74,84,56,NULL,63,78,89,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이영희',230223,30,30,78,NULL,40,64,52,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박민지',240312,46,33,38,NULL,62,29,31,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정성호',250506,80,35,47,NULL,70,64,97,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이수진',260721,96,63,96,NULL,56,40,61,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김태영',270830,81,73,33,NULL,61,51,44,NULL,7,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박현수',280917,91,58,69,NULL,59,40,85,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정지은',290102,83,64,63,NULL,63,96,69,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김승호',300206,89,32,78,NULL,80,53,39,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이수진',310301,37,63,63,NULL,67,27,68,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박영민',320413,31,27,58,NULL,43,80,51,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정다영',330520,73,89,26,NULL,99,79,70,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이재현',340606,26,61,62,NULL,40,31,86,NULL,10,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김지현',350707,84,38,58,NULL,54,51,48,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('최승호',360822,52,55,45,NULL,24,73,62,NULL,10,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박수민',370925,47,68,44,NULL,72,48,69,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김영호',380107,56,69,90,NULL,98,49,88,NULL,4,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이현주',390215,20,41,49,NULL,56,32,26,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정재원',400330,43,21,79,NULL,39,52,24,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('최지훈',410406,56,83,26,NULL,71,75,52,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김지영',420502,83,83,71,NULL,38,98,44,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이민재',430603,40,77,27,NULL,94,77,73,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박수진',440727,39,62,48,NULL,74,83,94,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정지원',450817,91,82,91,NULL,37,45,20,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김은지',460920,86,22,66,NULL,91,28,79,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('최준호',470002,50,23,40,NULL,62,41,49,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이가영',480106,58,32,43,NULL,58,43,66,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박진우',490225,27,94,53,NULL,33,36,44,NULL,3,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정미영',500312,69,78,21,NULL,48,23,61,NULL,5,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김철수',510406,31,88,99,NULL,54,21,95,NULL,7,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이영희',520423,30,47,27,NULL,57,84,58,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박민지',530523,24,33,37,NULL,41,68,57,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정성호',540606,66,41,48,NULL,48,50,25,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이수진',550721,64,86,49,NULL,93,70,67,NULL,1,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김태영',560830,92,95,56,NULL,23,48,39,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박현수',570917,64,94,27,NULL,53,92,33,NULL,0,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정지은',580102,73,83,33,NULL,97,98,58,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김승호',590206,67,40,92,NULL,71,93,61,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이수진',600301,78,41,57,NULL,21,92,22,NULL,2,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('박영민',610413,75,51,84,NULL,54,76,26,NULL,8,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('정다영',620520,55,33,53,NULL,81,53,51,NULL,9,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('이재현',630606,82,41,25,NULL,40,45,81,NULL,6,NULL);
INSERT	INTO	SCOREBOARD	VALUES	('김지현',640707,30,57,72,NULL,54,32,96,NULL,6,NULL);

DROP TABLE RELOCATEE cascade constraints purge;

-- 교육부 전근자 명단 테이블 생성
CREATE TABLE RELOCATEE(
    NAME VARCHAR2(20),      -- 전근자 이름
    RELO_DATE DATE          -- 전근 일자
);

INSERT	INTO	RELOCATEE	VALUES	('김철호', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('박준혁', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('김지현', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('김소연', TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('이지훈', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('박승우', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('최민지', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('윤하은', TO_DATE('2024-08-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('이민준', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('장지우', TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT	INTO	RELOCATEE	VALUES	('최성민', TO_DATE('2024-09-01','YYYY-MM-DD'));

SELECT * FROM RELOCATEE;
    
SELECT * FROM TEACHERS;
SELECT * FROM STUDENTS;
SELECT * FROM SCOREBOARD;
SELECT * FROM RELOCATEE;

------------------------------ Q.분반 별로 소속된 학생들과 담당 선생님을 검색
SELECT S.STDID 학번, S.NAME 이름, S.CLASS "학년/반", T.NAME "담임선생님"
FROM STUDENTS S 
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
ORDER BY "학년/반";


------------------------------ Q.성적 TABLE에서 수학/물리 각각의 과목에서 1차, 2차, 3차, 시험에 대해 가중치 X 0.3을 적용한 시험
------------------------------ 합산 점수에 결석일수를 감해서 최종 수학/물리 과목 점수를 SCORE_MATH와 SCORE_PHYS COLUMN에 UPDATE
UPDATE SCOREBOARD SET
SCORE_MATH = ROUND((MATH1 * 0.3 + MATH2 * 0.3 + MATH3 * 0.3) - ABSENCE),
SCORE_PHYS = ROUND((PHYS1 * 0.3 + PHYS2 * 0.3 + PHYS3 * 0.3) - ABSENCE);
SELECT * FROM SCOREBOARD;



------------------------------ Q. 수학 물리 과목 모두 1,2,3차 시험과 출결점수로 산출된 합산 점수로부터 
------------------------------ 65점 이상: A, 64~55점: B, 54~45점 : C, 44~36점 D, 35점 이하: F 학점으로 성적 처리해서 
------------------------------ GRADE_MATH와 GRADE_PHYS NEW COLUMN 으로 검색 쿼리
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

------------------------------ Q.위와 같은 로직에 따라 수학과 물리의 점수를 그래이딩 하고, 각 과목의 낙제자를 검색해서 FLUNK 컬럼 UPDATE
UPDATE SCOREBOARD
SET FLUNK = CASE
WHEN TO_NUMBER(SCORE_MATH) <= 35 AND TO_NUMBER(SCORE_PHYS) <= 35 THEN '유급'
WHEN TO_NUMBER(SCORE_MATH) <= 35 OR TO_NUMBER(SCORE_PHYS) <= 35 THEN '경고'
ELSE 'PASS'
END;
SELECT * FROM SCOREBOARD;

------------------------------ Q.성적이 유급 혹은 잠정 보류에 해당하는 학생과 담임 선생님의 리스트를 쿼리
SELECT
    S.NAME AS 학생이름,
    S.CLASS AS "학년/반",
    T.NAME AS 담당교사,
    SB.FLUNK AS 유급여부
FROM SCOREBOARD SB
INNER JOIN STUDENTS S ON SB.STDID = S.STDID
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
WHERE SB.FLUNK IN ('보류', '유급');


------------------------------ Q.두 과목 모두에서 낙제한 유급 학생과 담임 선생님의 명단 쿼리
SELECT
    S.NAME AS 학생이름,
    S.CLASS AS "학년/반",
    T.NAME AS "하위 고과 예정 교사"
FROM SCOREBOARD SB
INNER JOIN STUDENTS S ON SB.STDID = S.STDID
INNER JOIN TEACHERS T ON S.CLASS = T.CLASS_ASSIGNED
WHERE SB.FLUNK IN ('유급');

------------------------------ Q.반별 평균 점수가 가장 높은 반 순서로 정렬 (학년 구분 없이)
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
--------------------------------------------------- Q.반별 평균 점수가 가장 높은 반 순서로 정렬 (1학년 만)
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

--------------------------------------------------- Q.반별 평균 점수가 가장 높은 반 순서로 정렬 (3학년 만)
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


------------------------------ Q.STUDENT TABLE에서 학생 명단에 학년을 추출해서 쿼리
SELECT
    NAME AS STUDENT_NAME,
    STDID AS STUDENT_ID,
    AGE AS STUDENT_AGE,
    SUBSTR(CLASS, 1, 1) AS GRADE
FROM STUDENTS
ORDER BY GRADE;



--------------------------------------------------- Q. 학년 별 학생 수와 선생님 수, 선생님 한 명당 학생 수 비율이 높은 순으로 정리
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


--------------------------------------------------- Q. 전근갈 교사의 학생들을 가장 학생이 적은 반으로 배정
UPDATE STUDENTS
SET CLASS = (SELECT  C.CLASS
            FROM (SELECT B.CLASS, COUNT(B.CLASS) AS CNT
                  FROM TEACHERS A, STUDENTS B
                  WHERE A.CLASS_ASSIGNED = B.CLASS AND B.CLASS LIKE '1%' AND A.NAME != '김철호'
                  GROUP BY B.CLASS
                  ORDER BY COUNT(B.CLASS)) C
            WHERE ROWNUM = 1)
WHERE CLASS = (SELECT CLASS_ASSIGNED
            FROM TEACHERS
            WHERE NAME = '김철호');


ROLLBACK;
DELETE FROM teachers WHERE name = '김철호';


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
    