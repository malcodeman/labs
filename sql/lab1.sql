USE AdventureWorks2017

-- Task 1

SELECT
  ProductNumber,
  Name,
  Color,
  ListPrice
FROM Production.Product
WHERE Name LIKE '[ST]%'
AND Color IN ('Blue', 'Black')
AND ListPrice BETWEEN 100 AND 1000
ORDER BY ListPrice DESC

SELECT
  ProductNumber,
  Name,
  Color,
  ListPrice
FROM Production.Product
WHERE (SUBSTRING(Name, 1, 1) = 'T'
OR SUBSTRING(Name, 1, 1) = 'S')
AND (Color = 'Blue'
OR Color = 'Black')
AND (ListPrice >= 100
AND ListPrice <= 1000)
ORDER BY ListPrice DESC

-- Task 2

SELECT
  SalesOrderNumber,
  OrderDate,
  TotalDue
FROM Sales.SalesOrderHeader
WHERE (OrderDate >= '2011-07-01'
AND OrderDate <= '2011-12-31')
AND (TotalDue > 100000)

-- Task 3

SELECT
  ISNULL(Title, 'N/A') AS 'Title',
  FirstName + LastName AS 'Name'
FROM Person.Person
WHERE MiddleName IS NULL

-- Task 4

SELECT
  SUBSTRING(LoginID, CHARINDEX('\', LoginID) + 1, (LEN(LoginID) - CHARINDEX('\', LoginID))),
  JobTitle,
  HireDate,
  DATEDIFF(YEAR, BirthDate, GETDATE()) AS 'Age',
  DATEDIFF(YEAR, HireDate, GETDATE()) AS 'Experience'
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager%'
ORDER BY Experience DESC

-- Task 5

SELECT TOP 10
  ProductID,
  OrderQty,
  (CONCAT(ROUND(UnitPrice, 2), '$')) AS 'Price',
  ROUND(OrderQty * UnitPrice, 2) AS 'Total'
FROM Sales.SalesOrderDetail
ORDER BY Total DESC
