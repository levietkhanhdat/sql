WITH SHORT_E AS (
      SELECT [EmployeeID],[LastName],[FirstName]
      FROM [dbo].[Employees]
      )
SELECT * FROM SHORT_E
-- LẤY THÔNG TIN ĐƠN HÀNG CÙNG VỚI TỔNG GIÁ TRỊ ĐƠN HÀNG VÀ TỶ LỆ GIÁ TRỊ VÀ PHÍ GIAO HÀNG
WITH GT AS(
   SELECT [OrderID] , 
   SUM([UnitPrice]*[Quantity]) AS "TỔNG"
   FROM [dbo].[Order Details]
   GROUP BY [OrderID]
)
SELECT O.[OrderID],GT.[TỔNG],
GT.[TỔNG]/[Freight] AS " TỈ LỆ TRUNG BÌNH"
FROM [dbo].[Orders] O
JOIN GT 
ON O.[OrderID]=GT.[OrderID]

SELECT [OrderID],
        (
        SELECT SUM( [UnitPrice]*[Quantity])
        FROM [dbo].[Order Details] OD
        WHERE OD.[OrderID]=O.OrderID
        GROUP BY [OrderID]
        )  AS "TỔNG",
     
        
        
FROM [dbo].[Orders] O
-- TÍNH TỔNG DOANH THU BÁN HÀNG THEO TỪNG KHÁC HÀNG VÀ XẮP SẾP DANH SÁCH THEO DOANH SỐ GIẢM DẦN
WITH DOANH_THU_ĐON_HÀNG AS(
     SELECT [OrderID],
     SUM ([Quantity]*[UnitPrice]) AS"TỔNG DOANH THU ĐƠN HÀNG"
     FROM [dbo].[Order Details]
     GROUP BY [OrderID]
    )
 SELECT C.[ContactName] , 
 SUM(DT."TỔNG DOANH THU ĐƠN HÀNG") AS "DOANH SỐ THEO KHÁCH HÀNG"
 FROM [dbo].[Customers] C
 JOIN [dbo].[Orders] O
 ON O.[CustomerID]=C.[CustomerID]
 JOIN DOANH_THU_ĐON_HÀNG DT
 ON DT.[OrderID]=O.[OrderID]
 GROUP BY C.[ContactName]
