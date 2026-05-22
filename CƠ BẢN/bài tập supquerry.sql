-- LIỆT KÊ CÁC ĐƠN HÀNG CÓ NGÀY ĐẶT HÀNG GẦN NHẤT
SELECT TOP 1 WITH TIES P.[ProductName],O. [OrderDate] AS "NGÀY ĐẶT HÀNG"
FROM [dbo].[Products] AS P
JOIN [dbo].[Order Details] OD
ON P.[ProductID]=P.[ProductID] 
JOIN [dbo].[Orders] O
ON O.[OrderID]=OD.[OrderID]
ORDER BY O. [OrderDate] DESC


--LẤY THÔNG TIN ĐƠN HÀNG , SẢN PHẨM M THUỘC CÁC ĐƠN HÀNG CHƯA ĐƯỢC GIAO 
SELECT *
FROM [dbo].[Orders]
WHERE [ShippedDate] IS NOT  NULL
