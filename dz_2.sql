CREATE DATABASE IF NOT EXISTS dz_2 ;

USE dz_2;
 
DROP TABLE sales;

CREATE TABLE sales(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales(order_date, count_product) VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-01', 21),
('2022-01-01', 124),
('2022-01-01', 341);

SELECT * FROM sales;

ALTER TABLE sales 
ADD type_order VARCHAR(45);
UPDATE sales SET type_order=
CASE
	WHEN count_product > 300 THEN 'Большой заказ'
	WHEN count_product > 99 THEN 'Средний заказ'
	ELSE 'Маленький заказ'
END;

SELECT id, type_order FROM sales;	

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(45) NOT NULL,
    amount DECIMAL (8,5) DEFAULT (0.000),
    order_status VARCHAR(45)
);

INSERT INTO orders(employee_id, amount, order_status) VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT employee_id, order_status, 
CASE 
	WHEN order_status = 'OPEN' THEN 'Order is in open state.'
	WHEN order_status = 'CLOSED' THEN 'Order is closed.'
	WHEN order_status = 'CANCELLED' THEN 'Order is cancelled.'
    ELSE 'Status unknown'
    END AS full_order_status
FROM orders;