--Task1_0523. 
--orders��� ���̺��� �����ϰ�, order_id, customer_id, order_date, amount, status��� �Ӽ��� �����ϼ���.
--�����͸� 5�� �Է��ϼ���.
--�Է��� ������ �� 2���� �����ϼ���.
--������ �����͸� ����ϱ� ���� �ѹ��� ����ϼ���.
--3���� ���ο� �����͸� �Է��ϰ�, �� �� ������ ������ �Է¸� ����� �� �������� Ŀ���ϼ���. (������������ �Է��ϱ� ���� savepoint����)

DROP TABLE orders;

CREATE TABLE orders (
    order_id NUMBER NOT NULL PRIMARY KEY
    ,customer_id NUMBER NOT NULL
    ,order_date DATE
    ,amount NUMBER
    ,status VARCHAR2(20)
)
;

INSERT INTO orders VALUES (1,1,TO_DATE('2023-05-05','YYYY-MM-DD'),1000,'�߼�');
INSERT INTO orders VALUES (2,1,TO_DATE('2023-12-05','YYYY-MM-DD'),500,'�Ϸ�');
INSERT INTO orders VALUES (3,1,TO_DATE('2024-05-05','YYYY-MM-DD'),20000,'���');
INSERT INTO orders VALUES (4,1,TO_DATE('2024-01-05','YYYY-MM-DD'),8000,'����');
INSERT INTO orders VALUES (5,1,TO_DATE('2024-05-23','YYYY-MM-DD'),12000,NULL);

SELECT * FROM orders ORDER BY order_id;

SAVEPOINT orders_sp1;

UPDATE orders
SET
    status = '�Ϸ�'
WHERE
    order_id = 1
;

UPDATE orders
SET
    status = '�߼�'
WHERE
    order_id = 5
;

SELECT * FROM orders ORDER BY order_id;

ROLLBACK TO orders_sp1;

SELECT * FROM orders ORDER BY order_id;

INSERT INTO orders 
VALUES (6,1,TO_DATE('2024-02-15','YYYY-MM-DD'),9000,'�Ϸ�');

INSERT INTO orders 
VALUES (7,1,TO_DATE('2024-05-17','YYYY-MM-DD'),100000,'�Ϸ�');

SELECT * FROM orders ORDER BY order_id;

SAVEPOINT orders_sp2;

INSERT INTO orders 
VALUES (8,1,TO_DATE('2024-05-17','YYYY-MM-DD'),17000,'���');

SELECT * FROM orders ORDER BY order_id;

ROLLBACK TO orders_sp2;


SELECT * FROM orders ORDER BY order_id;

commit;

SELECT * FROM orders ORDER BY order_id;
