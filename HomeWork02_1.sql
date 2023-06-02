-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.

CREATE DATABASE IF NOT EXISTS home_work_2;
USE home_work_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE, 
    count_product INT
);

INSERT sales (order_date, count_product)
VALUE 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT *
FROM sales;


-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id AS "id заказа",
CASE
	WHEN count_product < 100
		THEN "Маленький заказ"
	WHEN count_product BETWEEN 100 AND 300
		THEN "Средний заказ"
	WHEN count_product > 300 
		THEN "Больщой заказ"
	ELSE "Ошибка в данных"
END AS "Тип заказа"
FROM sales;
        
        
-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45),
    amount DECIMAL(5,2),
    order_status VARCHAR(45)
);

INSERT orders (employee_id, amount, order_status) 
VALUE
	("e03", 15.00, "OPEN"),
	("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
	("e04", 9.50, "CANCELLED");
                    
SELECT *
FROM orders;

SELECT 
	id,
    employee_id,
    amount,
    order_status,
CASE
	WHEN order_status = "OPEN"
		THEN "Order is in open state"
	WHEN order_status = "CLOSED"
		THEN "Order is closed"
	WHEN order_status = "CANCELLED"
		THEN "Order is cancelled"
	ELSE "Error"
END AS "Comments"
FROM orders;