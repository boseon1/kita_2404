--Task1_0523. 
--orders라는 테이블을 생성하고, order_id, customer_id, order_date, amount, status라는 속성을 설정하세요.
--데이터를 5개 입력하세요.
--입력한 데이터 중 2개를 수정하세요.
--수정한 데이터를 취소하기 위해 롤백을 사용하세요.
--3개의 새로운 데이터를 입력하고, 그 중 마지막 데이터 입력만 취소한 후 나머지를 커밋하세요. (마지막데이터 입력하기 전에 savepoint실행)

DROP TABLE orders;

CREATE TABLE orders (
    order_id NUMBER NOT NULL PRIMARY KEY
    ,customer_id NUMBER NOT NULL
    ,order_date DATE
    ,amount NUMBER
    ,status VARCHAR2(20)
)
;

INSERT INTO orders VALUES (1,1,TO_DATE('2023-05-05','YYYY-MM-DD'),1000,'발송');
INSERT INTO orders VALUES (2,1,TO_DATE('2023-12-05','YYYY-MM-DD'),500,'완료');
INSERT INTO orders VALUES (3,1,TO_DATE('2024-05-05','YYYY-MM-DD'),20000,'배송');
INSERT INTO orders VALUES (4,1,TO_DATE('2024-01-05','YYYY-MM-DD'),8000,'접수');
INSERT INTO orders VALUES (5,1,TO_DATE('2024-05-23','YYYY-MM-DD'),12000,NULL);

SELECT * FROM orders ORDER BY order_id;

SAVEPOINT orders_sp1;

UPDATE orders
SET
    status = '완료'
WHERE
    order_id = 1
;

UPDATE orders
SET
    status = '발송'
WHERE
    order_id = 5
;

SELECT * FROM orders ORDER BY order_id;

ROLLBACK TO orders_sp1;

SELECT * FROM orders ORDER BY order_id;

INSERT INTO orders 
VALUES (6,1,TO_DATE('2024-02-15','YYYY-MM-DD'),9000,'완료');

INSERT INTO orders 
VALUES (7,1,TO_DATE('2024-05-17','YYYY-MM-DD'),100000,'완료');

SELECT * FROM orders ORDER BY order_id;

SAVEPOINT orders_sp2;

INSERT INTO orders 
VALUES (8,1,TO_DATE('2024-05-17','YYYY-MM-DD'),17000,'배송');

SELECT * FROM orders ORDER BY order_id;

ROLLBACK TO orders_sp2;


SELECT * FROM orders ORDER BY order_id;

commit;

SELECT * FROM orders ORDER BY order_id;
