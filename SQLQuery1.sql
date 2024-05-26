USE SportsStore;
GO

-- ������ ��� �������� ��� ������� ������ � ������� Products
SELECT * FROM Products;

-- ������ ���� ������ �������� (ProductName, Quantity, SalePrice) ��� ������� ������ � ������� Products
SELECT ProductName, Quantity, SalePrice FROM Products;

-- ������ ������ � ������� Products, �� ������� ������ ����� 10
SELECT * FROM Products WHERE Quantity > 10;

-- ������ ������ � ������� Products, �� �������� �� ������� ��������� (���������, "Nike")
SELECT * FROM Products WHERE Manufacturer = 'Nike';