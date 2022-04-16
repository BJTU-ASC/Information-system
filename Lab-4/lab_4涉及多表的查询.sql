#By SiKong Qian 2020/3/30 lab_3&lab_4
SHOW TABLES;
DESCRIBE customers;
SELECT * FROM orders, customers;#笛卡尔积的组合形式
SELECT orderID, firstName, lastName
FROM orders
INNER JOIN customers
ON customers.custID = orders.custID;#Inner join
SELECT orderID, firstName, lastName
FROM orders, customers
WHERE customers.custID = orders.custID;#Inner join 的紧凑写法
SELECT orderID, firstName, lastName
FROM orders
NATURAL JOIN customers;#Natural join 名称相同联合
SELECT employees.firstName, employees.lastName, customers.city, customers.firstName, customers.lastName
FROM employees
NATURAL JOIN customers
ORDER BY employees.empID;#这种写法是不允许的，因为两个表有多组域名一致
SELECT firstName, lastName, employees.grade, salary, minSalary, maxSalary
FROM employees 
INNER JOIN grades 
ON grades.grade >= employees.grade 
AND salary NOT BETWEEN minSalary AND maxSalary;#inner join 用>or<的情况
select * from employees;
SELECT employees.firstName, employees.lastName, customers.firstName, customers.lastName
FROM employees
INNER JOIN orders
ON employees.empID = orders.salesPersonID
INNER JOIN customers
ON orders.custID = customers.custID;#通过orders表连接employees与customers
SELECT customers.firstName, customers.lastName
FROM employees
INNER JOIN orders
ON employees.empID = orders.salesPersonID
INNER JOIN customers
ON orders.custID = customers.custID
WHERE employees.empID=1;#找到编号为1的员工的服务对象
SELECT customers.firstName, customers.lastName
FROM employees, orders, customers
WHERE employees.empID = orders.salesPersonID
AND orders.custID = customers.custID
AND employees.empID=1;#inner join 的不同写法

SELECT countries_regions.name, countries_regions.continent
FROM countries_regions
INNER JOIN cities on cities.country = countries_regions.code
WHERE cities.name = "Windhoek";
SELECT cities.name, countries_regions.code
FROM countries_regions
INNER JOIN cities on cities.country = countries_regions.code
WHERE countries_regions.name = "Austria";
SELECT cities.name, countries_regions.code
FROM countries_regions
INNER JOIN cities on cities.country = countries_regions.code
WHERE countries_regions.population >= 100000000 AND cities.population >=12000000;

SELECT cities.name, countries_regions.code,(cities.population)/(countries_regions.population) AS ratio
FROM countries_regions
INNER JOIN cities on cities.country = countries_regions.code
ORDER BY ratio DESC LIMIT 10;

SELECT countries_regions.capital, countries_regions.code, countries_regions.name
FROM countries_regions
LEFT OUTER JOIN cities on cities.name = countries_regions.capital
WHERE countries_regions.continent = "Europe" AND cities.name IS NULL;

#第五题的答案写法 我觉得有些问题，应该去掉INNER JOIN cities ON countries_regions.code=cities.country 
select distinct countries_regions.capital, countries_regions.name 
from countries_regions 
INNER JOIN cities 
ON countries_regions.code=cities.country 
where countries_regions.continent="Europe" and countries_regions.capital 
not in (select cities.name 
		from cities 
		inner join countries_regions 
        where countries_regions.continent=”Europe”);

SELECT *
FROM cities
INNER JOIN(SELECT cities.name AS capitalName, cities.population AS capitalPopulation,countries_regions.code, countries_regions.capital
		   FROM cities
		   INNER JOIN  countries_regions on cities.name = countries_regions.capital
		   WHERE countries_regions.continent = "South America") t1
on cities.country = t1.code
WHERE cities.population > t1.capitalPopulation;

#第六题答案回答
Select distinct A.name, A.country, A.population as PopulationofCity, B.capital, B.population as PopulationofCapital 
from (select cities.name, cities.country, cities.population 
from cities 
inner join countries_regions 
on countries_regions.code= cities.country 
where countries_regions.continent="South America" and cities.name!=countries_regions.capital) as A 
inner join (select countries_regions.name, countries_regions.code, countries_regions.capital, cities.population 
	    from cities 
	    inner join countries_regions 
	    on countries_regions.code= cities.country 
	    where countries_regions.continent="South America" and cities.name=countries_regions.capital) as B 
on A.country=B.code where A.population>B.population;



