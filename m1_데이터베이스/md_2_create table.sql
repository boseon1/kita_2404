--데이터 타입
--숫자형 (Numeric Types)
--NUMBER: 가장 범용적인 숫자 데이터 타입. 정수, 실수, 고정 소수점, 부동 소수점 수를 저장
-- NUMBER는 NUMBER(38,0)와 같은 의미로 해석, Precision 38:자릿수, Scale 0은 소수점 이하 자릿수
-- NUMBER(10) : 자릿수 10자리, NUMBER(8,2) :8자리 이면서 소숫점 2자리까지 -> 8자리에는 소수점 2자리도 포함

--문자형 (Character Types)
--VARCHAR2(size): 가변 길이 문자열을 저장. size는 최대 문자 길이를 바이트, 혹은 글자수로 지정
--NVARCHAR2(size)의 사이즈를 지정할 때는 바이트 단위 대신 항상 문자 단위로 크기가 지정
--CHAR(size): 고정 길이 문자열을 저장. 지정된 길이보다 짧은 문자열이 입력되면 나머지는 공백으로 채워짐

--날짜 및 시간형 (Date and Time Types)
--DATE: 날짜와 시간을 저장. 데이터 타입은 년, 월, 일, 시, 분, 초를 포함
--DATE 타입은 날짜와 시간을 YYYY-MM-DD HH24:MI:SS 형식으로 저장합니다.
--예를 들어, 2024년 5월 20일 오후 3시 45분 30초는 2024-05-20 15:45:30으로 저장

--TIMESTAMP: 날짜와 시간을 더 상세히 나노초 단위까지 저장
--이진 데이터형 (Binary Data Types)
--BLOB: 대량의 이진 데이터를 저장. 이미지, 오디오 파일 등을 저장하는 데 적합
--대규모 객체형 (Large Object Types)
--CLOB: 대량의 문자 데이터를 저장
--NCLOB: 대량의 국가별 문자 집합 데이터를 저장

--문자 인코딩의 의미
--컴퓨터는 숫자로 이루어진 데이터를 처리. 인코딩을 통해 문자(예: 'A', '가', '?')를 
--숫자(코드 포인트)로 변환하여 컴퓨터가 이해하고 저장할 수 있게 한다.
--예를 들어, ASCII 인코딩에서는 대문자 'A'를 65로, 소문자 'a'를 97로 인코딩. 
--유니코드 인코딩에서는 'A'를 U+0041, 한글 '가'를 U+AC00, 이모티콘 '?'를 U+1F60A로 인코딩
--아스키는 7비트를 사용하여 총 128개의 문자를 표현하는 반면 유니코드는 최대 1,114,112개의 문자를 표현

--ASCII 인코딩:
--문자 'A' -> 65 (10진수) -> 01000001 (2진수)
--문자 'B' -> 66 (10진수) -> 01000010 (2진수)

--유니코드(UTF-8) 인코딩: 
--문자 'A' -> U+0041 -> 41 (16진수) -> 01000001 (2진수, ASCII와 동일)
--문자 '가' -> U+AC00 -> EC 95 80 (16진수) -> 11101100 10010101 10000000 (2진수)

--CLOB: CLOB은 일반적으로 데이터베이스의 기본 문자 집합(예: ASCII, LATIN1 등)을 사용하여 텍스트 데이터를 저장. 
--이 때문에 주로 영어와 같은 단일 바이트 문자로 이루어진 텍스트를 저장하는 데 사용.
--NCLOB: NCLOB은 유니코드(UTF-16)를 사용하여 텍스트 데이터를 저장. 따라서 다국어 지원이 필요할 때, \
--즉 다양한 언어로 구성된 텍스트 데이터를 저장할 때 적합. 다국어 문자가 포함된 데이터를 효율적으로 처리할 수 있다.

-- VARCHAR2는 두 가지 방식으로 길이를 정의 : 바이트와 문자
-- 설정 확인 방법


--제약조건 : 
--PRIMARY KEY : 각 행을 고유하게 식별하는 열(또는 열들의 조합). 중복되거나 NULL 값을 허용하지 않는다.
--FOREIGN KEY : 다른 테이블의 기본 키를 참조하는 열. 참조 무결성을 유지
--UNIQUE : 열에 중복된 값이 없어야 함을 지정. NULL값이 허용
--NOT NULL : 열에 NULL 값을 허용하지 않는다.
--CHECK : 열 값이 특정 조건을 만족해야 함을 지정 (예: age > 18)
--DEFAULT : 열에 명시적인 값이 제공되지 않을 경우 사용될 기본값을 지정


-- AUTHOR 테이블 생성
CREATE TABLE authors (
    id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    nationality VARCHAR2(50)
);

DROP TABLE authors;


-- Q. NEWBOOK이라는 테이블을 생성하세요.
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

-- 컬럼 추가
ALTER TABLE newbook ADD author_id NUMBER;
-- 컬럼 삭제
ALTER TABLE newbook DROP COLUMN author_id;
-- 컬럼수정
ALTER TABLE newbook MODIFY(isbn VARCHAR2(50));

DELETE FROM newbook;

DESC NEWBOOK;

SELECT 
    *
FROM
    newbook
;

-- ON DELETE CASCADE 옵션이 설정되어 있어, newcustomer 테이블에서 어떤 고객의 레코드가 삭제되면, 해당 고객의 모든 주문이
-- neworders 테이블에서도 자동으로 삭제
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

INSERT INTO newcustomer VALUES(1,'KEVIN','역삼동','010-1234-1234');
INSERT INTO neworders VALUES(10,1,100,1000,SYSDATE);

COMMIT;

SELECT * FROM newcustomer;
SELECT * FROM neworders;

DELETE FROM newcustomer;
DELETE FROM neworders;


-- Q. 10개의 속성으로 구성되는 테이블 2개를 작성하세요. 단 FOREGIN KEY를 적용하여 한쪽 테이블의 데이터를 삭제시 다른 테이블의
-- 관련되는 데이터도 모두 삭제되도록 하세요.(모든 제약조건 을 사용)
-- 단, 각 테이블에 5개의 데이터를 입력하고 두번째 테이블에 첫번째 데이터를 참조하고 있는 속성을 선택하여 데이터 삭제

CREATE TABLE GOGEK(
    custid VARCHAR2(50) PRIMARY KEY,
    brdt DATE,
    gender CHAR(1),
    p_num NUMBER(11),
    juso VARCHAR2(200)
)

CREATE TABLE 

    