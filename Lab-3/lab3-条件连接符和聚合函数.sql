CREATE TABLE unis 
(name VARCHAR(40) NOT NULL PRIMARY KEY,
city VARCHAR(20),
region VARCHAR(20),
students INT,
founded INT
);
Insert INTO unis SELECT *FROM lec_2.unis;#将一个表的数据复制到另一个表（各列名称与类型需相同）
SELECT * FROM unis WHERE region="NORTH WEST";
SELECT *FROM unis WHERE  city="Oxford" AND students>=20000;
SELECT name FROM unis WHERE city IS NOT NULL;
SELECT name,founded FROM unis ORDER BY founded ASC LIMIT 3;
SELECT u.name AS University
FROM unis AS u 
WHERE u.students > 20000;
SELECT AVG(students) AS AverageStudents FROM unis;
SELECT AVG(founded) AS Averagefounded FROM unis WHERE region="North west";
SELECT region,avg(students) FROM unis GROUP BY region;
SELECT city, sum(students) FROM unis GROUP BY city;
SELECT * FROM countries_regions;
DESCRIBE countries_regions;#介绍表的结构
SELECT capital FROM countries_regions WHERE name = "Togo";
SELECT name FROM  countries_regions ORDER BY area DESC LIMIT 5;
SELECT distinct continent FROM countries_regions ORDER BY continent ASC;
SELECT count(id) FROM countries_regions;
SELECT SUM(population) FROM countries_regions;
SELECT SUM(area) AS continentarea,continent 
FROM countries_regions 
GROUP BY continent 
ORDER BY continentarea DESC;
SELECT count(name) AS currencycount, currency 
FROM countries_regions 
GROUP BY currency 
ORDER BY currencycount DESC; 
SELECT population/area AS populationdensity, name 
FROM countries_regions 
WHERE population>=100000000  
ORDER BY populationdensity desc limit 5;   