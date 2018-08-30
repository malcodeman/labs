-- Task 1

USE AdventureWorks2017

SELECT
  TerritoryID,
  COUNT(CustomerID) AS 'Total buyer number'
FROM Sales.Customer
GROUP BY TerritoryID
HAVING COUNT(CustomerID) > 1000

-- Task 2

USE AdventureWorks2017

SELECT
  ProductModelID,
  COUNT(ProductID) AS 'Total product number'
FROM Production.Product
WHERE ProductModelID IS NOT NULL
AND SUBSTRING(Name, 1, 1) = 'S'
GROUP BY ProductModelID
HAVING COUNT(ProductID) > 1

-- Task 3

USE AdventureWorks2017

SELECT TOP 10 WITH TIES
  ProductID,
  SUM(OrderQty) AS 'Quantity'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY 2 DESC

-- Task 4

USE AdventureWorks2017

SELECT
  ProductID,
  ROUND(SUM(OrderQty * UnitPrice), 2) AS 'Total without discount',
  SUM(OrderQty * UnitPrice * UnitPriceDiscount) AS 'Discount',
  SUM(OrderQty * UnitPrice) - SUM(OrderQty * UnitPrice * UnitPriceDiscount) AS 'Total with discount'

FROM Sales.SalesOrderDetail
WHERE UnitPriceDiscount > 0
GROUP BY ProductID
ORDER BY 4 DESC

-- Task 5

USE AdventureWorks2017

SELECT
  MONTH(OrderDate) AS 'Month',
  MIN(TotalDue) AS 'Min',
  MAX(TotalDue) AS 'Max',
  AVG(TotalDue) AS 'Avg',
  SUM(TotalDue) AS 'Total'
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013
GROUP BY MONTH(OrderDate)
ORDER BY 1
