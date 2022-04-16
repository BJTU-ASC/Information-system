# Lab 2

本节内容将重点在代码里演示，文档仅简要说明.

## SELECT的基本原理

如果指定了多个列，它们将按照SELECT语句中给出的顺序返回，
即SELECT attr1, att2…与SELECT att2不同。
但是SELECT不按特定顺序检索行。

## SELECT DISTINCT只返回查询产生的不同值

Example
SELECT title FROM emp;

   <img width="82" alt="image" src="https://user-images.githubusercontent.com/102899160/163666744-9dc3f814-7829-4014-84ce-066990f9c733.png">

SELECT DISTINCT title FROM emp;

   <img width="82" alt="image" src="https://user-images.githubusercontent.com/102899160/163666770-fa44ca88-9054-4c7e-b01d-49c5c3e0d167.png">

## SELECT ...WHERE...

SELECT查询现在通过测试表中的所有行来工作，每次测试一个谓词。被求值的行称为“候选行”，如果谓词被确定为真，那么该行将成为”选中的行”。只有当候选行的谓词解析为TRUE时，值才会包含在返回的数据中。

常用操作符

   <img width="221" alt="image" src="https://user-images.githubusercontent.com/102899160/163666792-25108bbb-3242-4901-a420-b53838c6e24c.png">

Example
SELECT title FROM pay WHERE sal > 39000;

   <img width="237" alt="image" src="https://user-images.githubusercontent.com/102899160/163666807-3f425551-b78a-4326-b94a-4874fd8059f1.png">

## 常用操作符解析

### 1. IN
IN允许谓词明确定义一组值来匹配，大概相当于多个=

Example
SELECT ename FROM emp WHERE title IN ("Elect. Eng.", "Mech. Eng.");

   <img width="255" alt="image" src="https://user-images.githubusercontent.com/102899160/163666835-c2bbbcc6-d268-4d5b-bc5d-dde27dbf714c.png">

### 2. BETWEEN
BETWEEN允许谓词定义要匹配的值范围。
形式:WHERE column Between lower AND upper

Example
SELECT title FROM pay WHERE sal BETWEEN 27000 AND 34000;

   <img width="281" alt="image" src="https://user-images.githubusercontent.com/102899160/163666853-f99fc09b-a7fc-45b6-a4c8-f002647ab3c3.png">

### 3. LIKE
LIKE允许我们在列中搜索模式，而不是精确匹配。
WHERE city LIKE "Man%" city列中以Man为前缀的项
WHERE city LIKE "%chester" city列中以chester为后缀的项

WHERE city LIKE "%upon%" city列中包含upon的项
当然也可以用NOT LIKE来返回不匹配模式的项

Example
SELECT ename FROM emp WHERE title LIKE "%Eng.";

   <img width="272" alt="image" src="https://user-images.githubusercontent.com/102899160/163666869-06f4dfa5-dc19-4d54-a0cf-8dbe3b41442a.png">

### 4. IS NULL
返回该列为空的记录，多使用IS NOT NULL来返回不为空的记录

Example:
SELECT ename FROM emp WHERE title IS NOT NULL;

   <img width="67" alt="image" src="https://user-images.githubusercontent.com/102899160/163666883-8730a099-f826-490c-872d-160cb48350f1.png">
