-- Task 1

USE Northwind
SELECT
  CONCAT(E.FirstName, ' ', E.LastName) AS 'Name',
  COUNT(O.EmployeeID) AS 'Order count'
FROM Employees AS E
INNER JOIN Orders AS O
  ON E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName,
         E.LastName
ORDER BY 'Order count' DESC

-- Task 1 with where and having

USE Northwind
SELECT
  CONCAT(E.FirstName, ' ', E.LastName) AS 'Name',
  COUNT(O.EmployeeID) AS 'Order count'
FROM Employees AS E
INNER JOIN Orders AS O
  ON E.EmployeeID = O.EmployeeID
WHERE MONTH(O.OrderDate) = 7
AND YEAR(O.OrderDate) = 1997
GROUP BY E.FirstName,
         E.LastName
HAVING COUNT(O.EmployeeID) >= 5
ORDER BY 'Order count' DESC

-- Task 2

USE Northwind
SELECT
  S.CompanyName AS 'Company name',
  S.Phone AS 'Phone',
  P.ProductName AS 'Product name',
  P.UnitsInStock AS 'Units in stock',
  SUM(OD.Quantity) AS 'Units sold'
FROM Suppliers AS S
INNER JOIN Products AS P
  ON S.SupplierID = P.SupplierID
INNER JOIN [Order Details] AS OD
  ON P.ProductID = OD.ProductID
WHERE P.UnitsInStock = 0
GROUP BY S.CompanyName,
         S.Phone,
         P.ProductName,
         P.UnitsInStock

-- Task 3

USE pubs
SELECT
  P.pub_name AS 'Publisher',
  ST.stor_name AS 'Store',
  T.title AS 'Book',
  SUM(S.qty * T.price) AS 'Total'
FROM publishers AS P
INNER JOIN titles T
  ON P.pub_id = T.pub_id
INNER JOIN sales AS S
  ON T.title_id = S.title_id
INNER JOIN stores AS ST
  ON S.stor_id = ST.stor_id
WHERE P.pub_name = 'New Moon Books'
GROUP BY P.pub_name,
         ST.stor_name,
         T.title

-- Task 4

USE AdventureWorksLT2017
SELECT
  CONCAT(C.FirstName, ' ', C.LastName) AS 'Buyer',
  COUNT(SOH.CustomerID) AS 'Order count',
  ISNULL(SUM(SOD.OrderQty), 0) AS 'Order quantity',
  A.CountryRegion AS 'Region',
  A.City AS 'City'

FROM SalesLT.Customer AS C
LEFT JOIN SalesLT.SalesOrderHeader AS SOH
  ON C.CustomerID = SOH.CustomerID
LEFT JOIN SalesLT.SalesOrderDetail AS SOD
  ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN SalesLT.CustomerAddress AS CA
  ON C.CustomerID = CA.CustomerID
INNER JOIN SalesLT.Address AS A
  ON CA.AddressID = A.AddressID
WHERE A.CountryRegion = 'United States'
OR A.City = 'Montreal'
GROUP BY C.FirstName,
         C.LastName,
         A.CountryRegion,
         A.City

-- Task 5

USE AdventureWorks2017
SELECT
  P.FirstName,
  P.LastName,
  CC.CardType,
  CC.CardNumber,
  SOH.SalesOrderNumber,
  SOH.ORderDate
FROM Sales.Customer AS C
INNER JOIN Person.Person AS P
  ON C.PersonID = P.BusinessEntityID
INNER JOIN Sales.PersonCreditCard AS PCC
  ON P.BusinessEntityID = PCC.BusinessEntityID
INNER JOIN Sales.CreditCard AS CC
  ON PCC.CreditCardID = CC.CreditCardID
INNER JOIN Sales.SalesOrderHeader AS SOH
  ON CC.CreditCardID = SOH.CreditCardID
WHERE P.FirstName = 'Jordan'
AND P.Lastname = 'Green'
