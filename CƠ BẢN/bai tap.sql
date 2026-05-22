-- KHÁCH HÀNG ĐẶT TRÊN 20 ĐƠN HÀNG VÀ SẮP XẾP GIẢM DẦN
SELECT [CustomerID] , COUNT(*) AS "TỔNG SỐ ĐƠN HÀNG"
FROM [dbo].[Orders]
GROUP BY [CustomerID] 
HAVING COUNT(*)>20
ORDER BY COUNT(*) DESC
-- NHÂN VIÊN CÓ TỔNG SỐ ĐƠN HÀNG >= 100 , SẮP XẾP ĐƠN HÀNG GIẢM DẦN 
SELECT [EmployeeID] , COUNT(*) AS "TỔNG SỐ ĐƠN HÀNG"
FROM [dbo].[Orders]
GROUP BY [EmployeeID]
HAVING COUNT(*)>=100
ORDER BY COUNT(*) DESC
-- QUỐC GIA CÓ NHIỀU HƠN 7 KHÁCH HÀNG
SELECT [ShipCountry], COUNT(DISTINCT [CustomerID]) AS" TỔNG SỐ KHÁCH HÀNG"
FROM [dbo].[Orders]
GROUP BY [ShipCountry]
HAVING COUNT(DISTINCT [CustomerID]) >7
-- NHỮNG NGÀY CÓ HƠN 5 ĐƠN HÀNG ĐƯỢC GIAO
SELECT [ShippedDate] , COUNT(*) AS "TỔNG SỐ ĐƠN HÀNG ĐƯỢC GIAO"
FROM [dbo].[Orders]
GROUP BY [ShippedDate]
HAVING COUNT(*) >5  AND [ShippedDate] IS NOT NULL
ORDER BY [ShippedDate]

-- QUỐC GIA BẮT ĐẦU BẰNG G HOẶC A VÀ CÓ HƠN 29 ĐƠN HÀNG 
SELECT [ShipCountry] , COUNT(*) AS" TỔNG SỐ ĐƠN HÀNG"
FROM [dbo].[Orders]
GROUP BY [ShipCountry]
HAVING COUNT(*) >29 AND [ShipCountry] LIKE '[A,G]%'--

-- NHỮNG THÀNH PHỐ CÓ SL  ĐƠN HÀNG KHÁC 1 VÀ 2  ĐẶT HÀNG TỪ 1997-04-01 ĐẾN 31-8
SELECT [ShipCity] , COUNT(*) AS" TỔNG SỐ ĐƠN HÀNG"
FROM [dbo].[Orders]
--WHERE MONTH([OrderDate]) BETWEEN  4 AND 8 AND YEAR([OrderDate])=1997
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-08-31 '
GROUP BY [ShipCity] 
HAVING COUNT(*) !=1 AND COUNT(*)!=2

