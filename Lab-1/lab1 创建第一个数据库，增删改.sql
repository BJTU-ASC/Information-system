create schema lab1;#创建一个名为lab1的数据库

create database lab11;#MYSQL 中schema和database是一个东东

show databases;#展示当前dbms中的所有数据库

CREATE TABLE employees#在default数据库下创建一个名为order的表
(   employeeID INTEGER NOT NULL PRIMARY KEY, #列名 数据类型 约束 （主键）
	lastName VARCHAR(20) NOT NULL,
	firstName VARCHAR(20) NOT NULL,
	jobTitle VARCHAR(30) NOT NULL,
	dob	DATE	NOT NULL,
	address VARCHAR(50),
	city VARCHAR(20),
	country VARCHAR(20),
	phoneExt INTEGER NOT NULL
	);

CREATE TABLE orders		
(orderID INTEGER NOT NULL PRIMARY KEY,
customerID INTEGER NOT NULL,
custOrderRef VARCHAR(30),
salesPersonID INTEGER NOT NULL,
FOREIGN KEY (salesPersonID) REFERENCES employees(employeeID)#初始化时设置外键
);
#ALTER TABLE orders ADD FOREIGN KEY (salesPersonID) REFERENCES employees(employeeID); 在初始化后设置外键的方法
#ALTER TABLE orders ADD orderDate DATE;在初始化之外设置列 列的名称为orderDate 数据类型为DATE 默认可以为null
#ALTER TABLE orders DROP orderDate;#删除某列

INSERT INTO employees 
VALUES (1, "Lowe", "Zenaida", "Sales Representative", "1969-11-28", "964-8399 Molestie St.", "Santa Ana", "USA", 1055);#向employees表中插入这样一条记录

select * from employees;#select*及查询全部
DESCRIBE orders; #对orders表进行描述

INSERT INTO orders VALUES (2, 1, "a fake item", 30);#错误，外键检测失败 该条记录的salesPersonID为30 在表employees的employeeID中不存在

DROP table ORDERS;#删除orders表
UPDATE employees SET jobTitle = "Sales Manager" WHERE employeeID = 1;#改数据 在employees表中将employeeid为1的记录的职位改为销售经理

DELETE FROM orders WHERE orderID = 1;#直接删除orderid为1的行