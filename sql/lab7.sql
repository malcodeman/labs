-- Task 1

CREATE PROCEDURE GetAllProductNames
AS
BEGIN
  SELECT
    ProductName
  FROM Products
END

GO
ALTER PROCEDURE GetAllProductNames
AS
  SELECT
    ProductID,
    ProductName
  FROM Products
GO

GO
ALTER PROCEDURE GetAllProductNames
AS
  SELECT
    ProductName
  FROM Products
GO

DROP PROCEDURE GetAllProductNames

EXEC GetAllProductNames
