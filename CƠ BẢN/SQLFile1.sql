-- LIỆT KÊ TÊN NHÀ CUNG CẤP THEO A-Z
SELECT *
FROM Suppliers
ORDER BY [CompanyName] ASC
-- LIỆT KÊ SẢN PHẨM
SELECT *
FROM Products
ORDER BY ProductName DESC
-- LIỆT KÊ THEO HỌ VÀ TÊN ĐỆM 
SELECT *
FROM Employees
ORDER BY LastName , FirstName
-- LẤY SẢN PHẨM CÓ SỐ LƯỢNG BÁN CAO NHẤT 
SELECT TOP 1 *
FROM [Order Details]
ORDER BY UnitPrice DESC

SELECT  *
FROM [Order Details]
WHERE UnitPrice = (SELECT MAX (UNITPRICE) FROM [Order Details])

SELECT TOP 1 WITH TIES *
FROM [Order Details]
ORDER BY UnitPrice DESC;
-- LIỆT KÊ SẢN PHẨM
SELECT[ProductName],[QuantityPerUnit],[UnitPrice],[UnitsInStock] 
FROM [dbo].[Products]
ORDER BY [UnitsInStock] DESC