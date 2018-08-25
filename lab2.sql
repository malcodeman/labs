USE Northwind

-- Task 1

SELECT
  CompanyName,
  City,
  Fax
FROM Customers
WHERE (CompanyName LIKE '%Restaurant%'
OR City = 'Madrid')
AND Fax IS NOT NULL

-- Task 2

SELECT
  CompanyName,
  Country
FROM Suppliers
WHERE (Country = 'Germany'
OR Country = 'France')
AND (SUBSTRING(CompanyName, 1, 1) = 'A'
OR SUBSTRING(CompanyName, 1, 1) = 'E'
OR SUBSTRING(CompanyName, 1, 1) = 'P')

SELECT
  CompanyName,
  Country
FROM Suppliers
WHERE (Country = 'Germany'
OR Country = 'France')
AND (CompanyName LIKE '[A,E,P]%')

-- Task 3

USE pubs

SELECT
  title,
  type,
  price,
  (price - (price * 0.20)) AS Discount
FROM titles
WHERE (price - (price * 0.20)) >= 10
AND (price - (price * 0.20)) <= 20
ORDER BY type, Discount DESC

-- Task 4

USE Northwind

SELECT
  LOWER(CONCAT(LastName, '.', FirstName, '@', City, '.com')) AS 'Emai',
  RIGHT(REPLACE(SUBSTRING(REVERSE(CONCAT(Notes, Title, Address)), 10, 15), ' ', '#'), 8) AS 'Password',
  DATEDIFF(YEAR, BirthDate, GETDATE())
FROM Employees
