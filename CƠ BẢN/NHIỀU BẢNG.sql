--
SELECT [ProductID],[ProductName],[dbo].[Categories].[CategoryID],[dbo].[Categories].[CategoryName]
FROM [dbo].[Products],[dbo].[Categories]
WHERE [dbo].[Categories].[CategoryID]=[dbo].[Products].[CategoryID]


-- MÃ NHÂN VIÊN, TÊN NHÂN VIÊN , SL ĐƠN HÀNG
SELECT O.[EmployeeID],E.[LastName],E.[FirstName],COUNT (O.[OrderID]) AS" TỔNG ĐƠN HÀNG"
FROM [dbo].[Orders] AS O
INNER JOIN [dbo].[Employees] AS E 
ON O.[EmployeeID]=E.[EmployeeID]
GROUP BY O.[EmployeeID],E.[LastName],E.[FirstName]


SELECT C.[CustomerID],C.[CompanyName],C.[ContactName],COUNT(O.[OrderID]) AS"SỐ LƯỢNG ĐƠN HÀNG"
FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Orders] AS O
ON C.[CustomerID]=O.[CustomerID]
WHERE [Country]='UK'
GROUP BY C.[CustomerID],C.[CompanyName],C.[ContactName]


SELECT S.[ShipperID],S.[CompanyName],SUM(O.[Freight]) AS "TỔNG SỐ TIỀN VẬN CHUYỂN"
FROM [dbo].[Orders] AS O
INNER JOIN [dbo].[Shippers] AS S
ON O.[ShipVia]=S.[ShipperID]
GROUP BY S.[ShipperID],S.[CompanyName]
ORDER BY SUM(O.[Freight]) DESC


SELECT S.[SupplierID],S.[CompanyName],COUNT(DISTINCT P.[ProductName]) AS "TỔNG SỐ SẢN PHẨM KHÁC NHAU"
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[Suppliers] AS S
ON P.[SupplierID]=S.[SupplierID]
GROUP BY S.[SupplierID],S.[CompanyName]

SELECT TOP 1 WITH TIES S.[SupplierID],S.[CompanyName],COUNT(DISTINCT P.[ProductName]) AS "TỔNG SỐ SẢN PHẨM KHÁC NHAU"
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[Suppliers] AS S
ON P.[SupplierID]=S.[SupplierID]
GROUP BY  S.[SupplierID],S.[CompanyName]
ORDER BY COUNT(DISTINCT P.[ProductName]) DESC

SELECT O.[OrderID], E.[LastName],E.[FirstName],
       SUM(D.[UnitPrice]*D.[Quantity]*(1-D.[Discount])) AS "TỔNG TIỀN ĐƠN HÀNG"
FROM [dbo].[Orders] AS O
INNER JOIN [dbo].[Order Details] AS D
ON O.[OrderID]=D.[OrderID]
INNER JOIN [dbo].[Employees] AS E
ON E.[EmployeeID]=O.[EmployeeID]
GROUP BY O.[OrderID], E.[LastName],E.[FirstName]
