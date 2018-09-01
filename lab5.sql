-- Task 1
USE Northwind

SELECT TOP 1
  C.ContactName,
  C.Address,
  C.Phone,
  SUM(OD.UnitPrice * OD.Quantity) AS 'Total'
FROM Customers AS C
JOIN ORders AS O
  ON C.CustomerID = O.CustomerID
JOIN [Order Details] AS OD
  ON O.OrderID = OD.OrderID
WHERE MONTH(O.OrderDate) = 2
AND C.City LIKE 'London'
GROUP BY C.ContactName,
         C.Address,
         C.Phone
ORDER BY 'Total' DESC

-- Task 2

USE pubs
SELECT
  CONCAT(E.fname, ' ', E.lname) AS 'Name',
  MIN(S.qty) AS 'Min quantity',
  MAX(S.qty) AS 'Max quantity',
  AVG(S.qty) AS 'Average quantity',
  SUM(S.qty) AS 'Total quantity'
FROM employee AS E
JOIN publishers AS P
  ON P.pub_id = E.pub_id
JOIN titles AS T
  ON P.pub_id = T.pub_id
JOIN sales AS S
  ON T.title_id = S.title_id
GROUP BY E.fname,
         E.lname
HAVING SUM(S.qty) > 100
AND AVG(S.qty) BETWEEN 20 AND 25

-- Task 3

USE AdventureWOrks2017
SELECT DISTINCT
  P.FirstName,
  P.Lastname,
  EA.EmailAddress,
  CC.CardType,
  CC.CardNumber,
  CC.ExpYear
FROM Sales.Customer AS C
JOIN Person.Person AS P
  ON C.PersonID = P.BusinessEntityID
JOIN Person.EmailAddress AS EA
  ON P.BusinessEntityID = EA.BusinessEntityID
JOIN Sales.PersonCreditCard AS PCC
  ON P.BusinessEntityID = PCC.BusinessEntityID
JOIN Sales.CreditCard AS CC
  ON PCC.CreditCardID = CC.CreditCardID
LEFT OUTER JOIN Sales.SalesORderHeader AS SOH
  ON CC.CreditCardID = SOH.CreditCardID
WHERE CC.CardType LIKE 'Vista'
AND CC.ExpYear = 2008
ORDER BY P.LastName ASC
