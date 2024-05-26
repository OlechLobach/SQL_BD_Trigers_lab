USE SportsStore;
GO

-- Інсерт до таблиці Products
INSERT INTO Products (ProductName, ProductType, Quantity, CostPrice, Manufacturer, SalePrice)
VALUES ('T-Shirt', 'Clothing', 50, 10.00, 'ABC Clothing Co.', 20.00),
       ('Running Shoes', 'Footwear', 30, 40.00, 'XYZ Sports', 70.00);
GO

-- Інсерт до таблиці Sales
INSERT INTO Sales (ProductName, SalePrice, Quantity, SaleDate, Salesperson, Customer)
VALUES ('T-Shirt', 20.00, 2, '2024-05-27', 'John Doe', 'Jane Smith'),
       ('Running Shoes', 70.00, 1, '2024-05-28', 'Alice Johnson', 'Bob Brown');
GO

-- Інсерт до таблиці Employees
INSERT INTO Employees (EmployeeName, Position, HireDate, Gender, Salary)
VALUES ('John Doe', 'Sales Associate', '2020-01-15', 'M', 30000.00),
       ('Alice Johnson', 'Store Manager', '2018-03-10', 'F', 50000.00);
GO

-- Інсерт до таблиці Customers
INSERT INTO Customers (CustomerName, Email, Phone, Gender, PurchaseHistory, Discount, Subscribed)
VALUES ('Jane Smith', 'jane@example.com', '123-456-7890', 'F', NULL, 0.00, 1),
       ('Bob Brown', 'bob@example.com', '987-654-3210', 'M', NULL, 0.00, 1);