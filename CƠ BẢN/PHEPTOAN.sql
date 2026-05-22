-- TÍNH SẢN PHẨM CÒN TỒN KHO
SELECT ([UnitsInStock]-[UnitsOnOrder]) AS " SẢN PHẨM CÒN TỒN KHO"
FROM [dbo].[Products]
-- TÍNH GIÁ TIỀN
SELECT [ProductID],([UnitPrice]*[Quantity]) AS" TỔNG GIÁ TIỀN "
FROM [dbo].[Order Details]
ORDER BY ([UnitPrice]*[Quantity])
--TÍNH TỈ LỆ VẬN CHUYỂN
SELECT AVG([Freight])/MAX (Freight)  AS "TỈ LỆ VẬN CHUYỂN"
FROM [dbo].[Orders]
-- LIỆT KÊ SẢN PHẨM SAU KHI GIẢM GIÁ 
SELECT [ProductName], [UnitPrice] AS "GIÁ GỐC" , [UnitPrice]*90/100 AS "GIÁ SAU KHI GIẢM"
FROM [dbo].[Products]
ORDER BY [UnitPrice]*90/100