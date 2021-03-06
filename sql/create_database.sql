CREATE DATABASE Sales
ON
(NAME = Sales_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\saledat.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON
(NAME = Sales_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\salelog.ldf',
SIZE = 5 MB,
MAXSIZE = 25 MB,
FILEGROWTH = 5 MB);
GO

CREATE TABLE Clients (
  ClientID int IDENTITY PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50),
  City varchar(50)
);

INSERT INTO Clients (FirstName, LastName, City)
  VALUES ('First name', 'Last name', NULL)

CREATE UNIQUE INDEX ix_uq_first_name ON Clients (FirstName)
GO

CREATE PROCEDURE Clients_Insert (@FirstName varchar(50),
@LastName varchar(50),
@City varchar(50))
AS
BEGIN
  INSERT INTO Clients
    VALUES (@FirstName, @LastName, @City)
END
GO

EXEC Clients_Insert 'John',
                    'Doe',
                    'New York'
GO
EXEC Clients_Insert @FirstName = 'Jane',
                    @City = 'Chicago',
                    @LastName = 'Doe'
GO

CREATE VIEW view_clients
AS
SELECT
  CONCAT(FirstName, ' ', LastName) AS Name,
  City
FROM Clients
GO

SELECT
  Name,
  City
FROM view_clients