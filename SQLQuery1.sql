CREATE DATABASE SportsStore;
GO

-- ������������ ���� ����� "SportsStore"
USE SportsStore;
GO

-- ��������� ������� ��� ������
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    ProductType NVARCHAR(50),
    Quantity INT,
    CostPrice DECIMAL(10, 2),
    Manufacturer NVARCHAR(100),
    SalePrice DECIMAL(10, 2)
);
GO

-- ��������� ������� ��� �������
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    SalePrice DECIMAL(10, 2),
    Quantity INT,
    SaleDate DATE,
    Salesperson NVARCHAR(100),
    Customer NVARCHAR(100)
);
GO

-- ��������� ������� ��� �����������
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    EmployeeName NVARCHAR(100),
    Position NVARCHAR(100),
    HireDate DATE,
    Gender CHAR(1),
    Salary DECIMAL(10, 2)
);
GO

-- ��������� ������� ��� �볺���
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    CustomerName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Gender CHAR(1),
    PurchaseHistory NVARCHAR(MAX),
    Discount DECIMAL(5, 2),
    Subscribed BIT
);
GO

-- ��������� ������� ��� ����� �������
CREATE TABLE SalesHistory (
    SaleID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    SalePrice DECIMAL(10, 2),
    Quantity INT,
    SaleDate DATE,
    Salesperson NVARCHAR(100),
    Customer NVARCHAR(100)
);
GO

-- ��������� ������� ��� ������
CREATE TABLE Archive (
    ArchiveID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    SalePrice DECIMAL(10, 2),
    Quantity INT,
    SaleDate DATE,
    Salesperson NVARCHAR(100),
    Customer NVARCHAR(100)
);
GO

-- ��������� ������� ��� �������� ������� ������
CREATE TABLE LastUnit (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    SalePrice DECIMAL(10, 2),
    Quantity INT,
    SaleDate DATE,
    Salesperson NVARCHAR(100),
    Customer NVARCHAR(100)
);
GO

-- ��������� ������� ��� ��������� ���������� ��� ������ � ������� �����
CREATE TRIGGER trg_SalesHistory
ON Sales
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesHistory (SaleID, ProductName, SalePrice, Quantity, SaleDate, Salesperson, Customer)
    SELECT SaleID, ProductName, SalePrice, Quantity, SaleDate, Salesperson, Customer
    FROM inserted;
END;
GO

-- ��������� ������� ��� ����������� ���������� ��� ������� �������� ����� �� ������� ������
CREATE TRIGGER trg_Archive
ON Products
AFTER UPDATE
AS
BEGIN
    INSERT INTO Archive (ProductName, SalePrice, Quantity, SaleDate, Salesperson, Customer)
    SELECT ProductName, SalePrice, Quantity, GETDATE(), 'Unknown', 'Unknown'
    FROM deleted
    WHERE Quantity = 0;
END;
GO

-- ��������� ������� ��� �������� ������� ������ � ��������
CREATE TRIGGER trg_CheckStock
ON Sales
AFTER INSERT
AS
BEGIN
    DECLARE @ProductName NVARCHAR(100);
    DECLARE @Quantity INT;

    SELECT @ProductName = ProductName, @Quantity = Quantity
    FROM inserted;

    IF @Quantity > (SELECT Quantity FROM Products WHERE ProductName = @ProductName)
    BEGIN
        -- ����������� ���� ������� �� ����� ����� �� ������� ������, �� �������
    END;
END;