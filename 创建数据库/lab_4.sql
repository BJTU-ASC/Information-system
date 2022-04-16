Create Schema lab_3;
DROP TABLE IF EXISTS lab_3.orders;
DROP TABLE IF EXISTS lab_3.employees;
DROP TABLE IF EXISTS lab_3.employees_USA;
DROP TABLE IF EXISTS lab_3.customers;
DROP TABLE IF EXISTS lab_3.grades;

CREATE TABLE lab_3.grades (
	grade int(11) NOT NULL PRIMARY KEY,
	minSalary int(11),
	maxSalary int(11)
);

INSERT INTO lab_3.grades VALUES(1, 10000, 20000);
INSERT INTO lab_3.grades VALUES(2, 18000, 25000);
INSERT INTO lab_3.grades VALUES(3, 22000, 30000);
INSERT INTO lab_3.grades VALUES(4, 28000, 35000);
INSERT INTO lab_3.grades VALUES(5, 30000, 40000);


CREATE TABLE lab_3.customers (
  custID int(11) NOT NULL PRIMARY KEY,
  city varchar(20),
  firstName varchar(20),
  lastName varchar(20)
);

INSERT INTO lab_3.customers VALUES (1,'London','Fred','Smith');
INSERT INTO lab_3.customers VALUES (2,'Chester','Scott','Jones');
INSERT INTO lab_3.customers VALUES (3,'Preston','Will','Davies');
INSERT INTO lab_3.customers VALUES (4,'London','John','Hunter');

CREATE TABLE lab_3.employees (
  empID int(11) NOT NULL PRIMARY KEY,
  firstName varchar(20),
  lastName varchar(20),
  city varchar(20),
  grade int(11),
  salary int(11),
  FOREIGN KEY (grade) REFERENCES lab_3.grades(grade)
);

INSERT INTO lab_3.employees VALUES (1,'John','Doe','Preston', 4, 27000);
INSERT INTO lab_3.employees VALUES (2,'Maggie','Smith','Brighton', 5, 38000);
INSERT INTO lab_3.employees VALUES (3,'Alan','Lee','London', 2, 26000);


CREATE TABLE lab_3.employees_USA (
  empID int(11) NOT NULL PRIMARY KEY,
  firstName varchar(20),
  lastName varchar(20),
  city varchar(20)
);

INSERT INTO lab_3.employees_USA VALUES (1,'James','Johnson','Chicago');
INSERT INTO lab_3.employees_USA VALUES (2,'Mary','Brown','Boston');
INSERT INTO lab_3.employees_USA VALUES (3,'Linda','Adams','Oakland');


CREATE TABLE lab_3.orders (
  orderID int(11) NOT NULL PRIMARY KEY,
  salesPersonID int(11) NOT NULL,
  custID int(11) NOT NULL,
  FOREIGN KEY (salesPersonID) REFERENCES lab_3.employees(empID),
  FOREIGN KEY (custID) REFERENCES lab_3.customers(custID)
);

INSERT INTO lab_3.orders VALUES (1001,1,3);
INSERT INTO lab_3.orders VALUES (1002,1,2);
INSERT INTO lab_3.orders VALUES (1003,3,4);