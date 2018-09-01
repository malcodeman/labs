-- Task 1

USE Northwind
SELECT
  P.ProductName,
  (SELECT
    MAX(OD.Quantity)
  FROM [Order Details] AS OD
  WHERE OD.ProductID = ProductID)
FROM Products AS P
ORDER BY P.ProductName

-- Task 2

USE Northwind
SELECT DISTINCT
  C.CompanyName,
  C.ContactName,
  C.City,
  C.Phone
FROM Customers AS C
INNER JOIN Orders AS O
  ON C.CustomerID = O.CustomerID
WHERE (SELECT
  SUM(OD.UnitPrice * OD.Quantity)
FROM [Order Details] AS OD
WHERE OD.OrderID = O.OrderID
AND OD.ProductID = 1)
> 100
