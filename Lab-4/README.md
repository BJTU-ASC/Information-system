# lab 4

## 1. 查询机制
如果直接将两个表连接起来，结果会返回两个表记录集合的笛卡尔积

Example

SELECT * FROM orders, employees; (cartesian product)

   <img width="270" alt="image" src="https://user-images.githubusercontent.com/102899160/163667451-088f8e34-1927-42cb-8c80-d9d98620cdb7.png">

虽然我们可以用WHERE来筛选记录，还有一种更好的方法：利用JOIN。![image](https://user-images.githubusercontent.com/102899160/163667455-0223fa19-ed18-4df5-9d7c-89e93d7d0be7.png)

## 2. 形形色色的Join

JOIN可以联合不同的表，为了使获得的数据有意义，这些表之间应该有特殊的键相关联。

### （1）INNER JOIN

INNER JOIN 的语法结构为

FROM table1  

INNER JOIN table2

ON condition

当table1与table2中的记录满足condition是这两条记录将并为一条记录输出


Example

SELECT firstName, lastName, employees_new.grade, salary, minSalary, maxSalary

FROM employees_new 

INNER JOIN grades 

ON grades.grade = employees_new.grade 

AND (salary < minSalary OR salary > maxSalary);


在这条查询语句中，condition有两条

一条为grades.grade = employees_new.grade 

另一条为 (salary < minSalary OR salary > maxSalary) 

这意味着如果employees_new表中的某一条记录与grades中的某一条记录满足grades.grade并且 employees_new.salary < grades.minSalary 或者 
employees_new.salary > grades.maxSalary 则将两条记录并为一条输出

其实相当于

SELECT firstName, lastName, employees_new.grade, salary, minSalary, maxSalary

FROM employees_new, grades 

WHERE grades.grade = employees_new.grade 

AND (salary < minSalary OR salary > maxSalary);

   <img width="316" alt="image" src="https://user-images.githubusercontent.com/102899160/163667552-c61fd5be-27ff-40d1-904b-884127919bbc.png">


### （2）NATURAL JOIN

NATURAL JOIN只在两个表中某列列名相同并且数据类型相同时才生效。

它的作用是返回两列中相同项所对应的记录。


Example

SELECT orderID, city

FROM orders

NATURAL JOIN customers;

其作用类似

SELECT orderID, city

FROM orders

INNER JOIN customers

ON orders.custID = customers.custID;

   <img width="294" alt="image" src="https://user-images.githubusercontent.com/102899160/163667582-64bbedf1-f9df-4f3f-aada-cd5dfec21598.png">

与INNER JOIN略有不同的是，NATURAL JOIN会将相关的两列合并，但INNER JOIN 不会

如

SELECT * FROM foods NATURAL JOIN company;

   <img width="357" alt="image" src="https://user-images.githubusercontent.com/102899160/163667594-6c60fb9e-b7b6-4723-a0b8-96cd753bd0c2.png">

SELECT * FROM company INNER JOIN foods ON company.company_id = foods.company_id;

   <img width="357" alt="image" src="https://user-images.githubusercontent.com/102899160/163667611-6b4fe0e4-c1d9-4d01-8201-a38e19451cf0.png">


### （3）SELF JOIN

SELF JOIN 自连接，故名思意就是一个表自己与自己进行连接，它的运行机制与INNER JOIN并无不同，可以理解为将自己复制了一份然后自己与自己进行INNER JOIN。

SELF JOIN 应用于一些特定场景


Example:

   <img width="170" alt="image" src="https://user-images.githubusercontent.com/102899160/163667637-1f68c28f-9acd-402b-96de-09f63940ae3a.png">

在这个表中，我们知道员工的ID，姓名，和对应管理者的ID（EmpMgrid）。我们想获得每名员工所对应管理者的姓名，那么我们就可以使用SELF JOIN。

SELECT e.EmpID, e.Name, m.Name AS Manager 

FROM emp e 

INNER emp m 

ON e.EmpMgrid = m.EmpID;

这里的m与e可以理解为emp表的复制，这两个表进行INNER JOIN，其中条件为

e.EmpMgrid = m.EmpID意思是将e中的管理者ID与m中的员工ID匹配来获得e中员工管理者的姓名及m.Name。


### （4）CROSS JOIN

就是笛卡尔积，在查询机制一节有相应例子。


### （5）OUTER JOIN

#### LEFT OUTER JOIN

语法

FROM table1

LEFT OUTER JOIN table2

ON condition

此时，不仅返回两个表中匹配的行，table1中未匹配的行也会被返回，未匹配的table1中的行所对应的table2中的属性为null。


Example：

SELECT EmpName, City 

FROM emp LEFT OUTER JOIN address 

ON emp.EmpID = address.ID;

   <img width="272" alt="image" src="https://user-images.githubusercontent.com/102899160/163667704-c5845f72-25cc-4233-ad5f-dbb02878d178.png">

结果为

   <img width="190" alt="image" src="https://user-images.githubusercontent.com/102899160/163667713-f6939340-a390-413f-b5c1-870db4c39301.png">


#### RIGHT OUTER JOIN

语法

FROM table1

RIGHT OUTER JOIN table2

ON condition

与LEFT OUTER JOIN类似

不仅返回两个表中匹配的行，table2中未匹配的行也会被返回，未匹配的table2中的行所对应的table1中的属性为null。


Example:

SELECT EmpName, City 

FROM emp 

RIGHT OUTER JOIN address 

ON emp.EmpID = address.ID;

   <img width="149" alt="image" src="https://user-images.githubusercontent.com/102899160/163667742-0e2f53e2-b709-49ce-9177-3a466bacc4c3.png">


#### FULL OUTER JOIN

不仅返回两个表中匹配的行，table1,table2中未匹配的行也会被返回，未匹配的table2中的行所对应的table1中的属性为null，未匹配的table1中的行所对应的table2中的属性为null。


Example:

SELECT EmpName, City

FROM emp 

FULL OUTER JOIN address 

ON emp.EmpID = address.ID;

   <img width="97" alt="image" src="https://user-images.githubusercontent.com/102899160/163667777-e95ff9d1-74ed-4c4c-9914-500eba8c5d7d.png">

注意： MySQL不支持full join








