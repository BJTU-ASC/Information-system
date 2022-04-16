# Lab 3

## Ps：对上节的一点补充
对LIKE通配符的补充

SELECT * FROM Customers WHERE City LIKE '_ondon’; 选择第一个字母不确定但是后五个字母是ondon的项

SELECT * FROM Customers WHERE City LIKE '[王,李]%’;选择以王或李开头的项

不等的三个表达方式
<>, !=, NOT LIKE

## 1.	条件连接符
NOT 使用NOT连接的单个条件不能满足，这样的项符合条件。

AND 使用AND连接的多个条件都必须被满足，这样的项符合条件。

Example

SELECT * FROM unis WHERE region="NORTH WEST“ AND founded >= 1969;

   <img width="275" alt="image" src="https://user-images.githubusercontent.com/102899160/163667050-023d6502-c282-43d6-8a53-8e819e0d290d.png">

OR 使用OR连接的多个条件只需有一个被满足，这样的项符合条件。

Example

SELECT * FROM unis WHERE region="NORTH WEST“ OR founded >= 1969;

   <img width="309" alt="image" src="https://user-images.githubusercontent.com/102899160/163667073-cc6ac52f-7087-4793-981f-31705196834f.png">

## 2.	排序

ORDER BY column ASC/DESC 对某列进行升序/降序排列

如果对多个列进行排列，则依次进行排列，注意后续排列不会打乱前面的排列

如果想对排列个数进行限制如只要排名前十的记录则用LIMIT关键字如: ORDER BY column DESC LIMIT 5

注意sql在排序时会把为NULL的项排在最前面或者最后，所以数据中有NULL记得加IS NOT NULL

Example
SELECT * FROM pay ORDER BY sal ASC;

   <img width="253" alt="image" src="https://user-images.githubusercontent.com/102899160/163667127-1a079966-2f14-4084-b91a-88128b1370fb.png">

SELECT * FROM unis WHERE region="NORTH WEST“ ORDER BY students DESC;

   <img width="283" alt="image" src="https://user-images.githubusercontent.com/102899160/163667164-c56dd2d1-f84e-49b4-8ba4-8d6f7a19e0ba.png">

SELECT * FROM People ORDER BY FirstName DESC, YearOfBirth ASC

   <img width="277" alt="image" src="https://user-images.githubusercontent.com/102899160/163667181-baa565cf-aa0d-4eda-9b5c-bdd84acedf38.png">

SELECT name, students FROM unis ORDER BY students DESC LIMIT 5;

   <img width="197" alt="image" src="https://user-images.githubusercontent.com/102899160/163667192-f962b573-e85f-4a62-bce6-e811d8ad56dc.png">

## 3.	聚合函数

   <img width="213" alt="image" src="https://user-images.githubusercontent.com/102899160/163667206-4b250ca1-8432-4cbc-adeb-871ea383bfa6.png">

这些函数用来对一组值进行操作来返回一个统计值

Example

SELECT COUNT(students),

AVG(students),

MIN(students),

MAX(students),

SUM(students)

FROM unis;

   <img width="239" alt="image" src="https://user-images.githubusercontent.com/102899160/163667243-82f35067-0818-497d-8030-c0de39fc1078.png">

返回

<img width="310" alt="image" src="https://user-images.githubusercontent.com/102899160/163667249-ec691f43-ef96-4755-934d-b57cd5ffe97f.png">

GROUP BY 允许我们对由行值定义的子集应用聚合函数。

GROUP BY column 将column中的项一样的做为一类，这样我们就能得到不同类的统计量

Example

SELECT region AS Region,//AS指为该属性起一个别名，在下面的查询中可以用别名代替该属性。同时返回的表中的列名将会变为别名。

COUNT(students) AS Count,

AVG(students) AS Average,

MIN(students) AS Min, 

MAX(students) AS Max,

SUM(students) AS Sum

FROM unis

GROUP BY region

ORDER BY Sum DESC;

   <img width="261" alt="image" src="https://user-images.githubusercontent.com/102899160/163667285-05e47a1b-1273-4a2a-b9f8-2d01514eea51.png">

返回

   <img width="349" alt="image" src="https://user-images.githubusercontent.com/102899160/163667291-56ec3da6-a698-4543-9761-470edc85e51b.png">
