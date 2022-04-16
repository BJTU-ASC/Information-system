SELECT * FROM unis;#查找整个表
SELECT name, city, region FROM unis;#找特定的列
SELECT DISTINCT region FROM unis;#同一区域只显示一次
SELECT name FROM unis WHERE city = "Manchester";#利用谓词进行限制
SELECT name FROM unis WHERE region IN ("North West", "North East");#in操作符可以匹配一个列表的值
SELECT name FROM unis WHERE founded BETWEEN 1960 AND 1969;#between操作符指一个区间
SELECT name FROM unis WHERE region LIKE "North%";#liKE可以指定搜寻包含某一部分的项目
SELECT * FROM unis WHERE region LIKE "East%";
SELECT name, region FROM unis WHERE region != "North West";#注意！=和not like这种操作符不会将NULL的结果搜索出来
SELECT * FROM unis WHERE founded IS NULL;#用ISNULL来查询NULL
SELECT name FROM unis WHERE city IS NULL OR region IS NULL;#AND OR NOT 与或非
