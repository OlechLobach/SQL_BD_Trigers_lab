USE SportsStore;
GO

-- Вибірка всіх стовпців для кожного запису з таблиці Products
SELECT * FROM Products;

-- Вибірка лише деяких стовпців (ProductName, Quantity, SalePrice) для кожного запису з таблиці Products
SELECT ProductName, Quantity, SalePrice FROM Products;

-- Вибірка записів з таблиці Products, де кількість товару більше 10
SELECT * FROM Products WHERE Quantity > 10;

-- Вибірка записів з таблиці Products, які належать до певного виробника (наприклад, "Nike")
SELECT * FROM Products WHERE Manufacturer = 'Nike';