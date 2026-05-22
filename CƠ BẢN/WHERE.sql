-- LIỆT KÊ CÁC NV ĐẾN TỪ UK
SELECT *
FROM Employees
WHERE [Country]='UK'
ORDER BY FIRSTNAME
-- LIỆT KÊ ĐƠN HÀNG GIAO MUỘN
SELECT*
FROM [dbo].[Orders]
WHERE [RequiredDate]<[ShippedDate]
-- LIỆT KÊ ĐƠN HANG ĐC GIẢM GIÁ HƠN 10%
SELECT COUNT(*) AS "TỔNG SỐ ĐƠN HÀNG ĐƯỢC GIẢM GIÁ HƠN 10%"
FROM [dbo].[Order Details]
WHERE [Discount]>0.1
-- LIỆT KÊ SẢN PHẨM CÓ SỐ LƯỢNG TRONG KHO >=50 <=100
SELECT *
FROM Products
WHERE [UnitsInStock]<=50 OR [UnitsInStock]>=100

SELECT *
FROM Products
WHERE NOT [UnitPrice]>100 AND [CategoryID]=1

SELECT *
FROM Products
WHERE  [UnitPrice] BETWEEN 10 AND 20 AND [CategoryID]=1


SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31' AND ShipVia=3