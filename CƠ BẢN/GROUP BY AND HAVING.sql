-- TÍNH SỐ ĐƠN ĐẶT HÀNG TRONG NĂM 1997 CỦA TỪNG KHÁCH HÀNG
SELECT [CustomerID],COUNT([OrderID]) AS "TỔNG SỐ ĐƠN"
FROM Orders
WHERE YEAR([OrderDate])=1997
GROUP BY [CustomerID]
-- LỌC ĐƠN HÀNG THÁNG 5 NĂM 1997
SELECT *
FROM Orders
WHERE YEAR([OrderDate])=1997 AND MONTH([OrderDate])=5
-- DS KHÁCH HÀNG NĂM 1998 , SỐ ĐƠN HÀNG MỖI THÁNG , XẮP XẾP THÁNG TĂNG DẦN
SELECT [CustomerID],
      COUNT([OrderID]) AS "SỐ ĐƠN HÀNG",
      MONTH([OrderDate]) AS "THÁNG",
      YEAR([OrderDate]) AS "NĂM"
FROM Orders
WHERE YEAR([OrderDate])=1998
GROUP BY [CustomerID], MONTH([OrderDate]), YEAR([OrderDate])
ORDER BY MONTH([OrderDate])
---
SELECT *
FROM Orders
WHERE  MONTH([OrderDate])=5
ORDER BY YEAR(ORDERDATE)


-- NHỮNG KHÁCH HÀNG MUA TRÊN 20 ĐƠN VÀ XẾP
SELECT [CustomerID],COUNT([OrderID]) AS "TỔNG SỐ ĐƠN"
FROM Orders
GROUP BY [CustomerID]
HAVING COUNT([OrderID])>20
ORDER BY COUNT([OrderID]) DESC


-- NHÀ CUNG CẤP TỒN KHO TRÊN 30 VÀ TRUNG BÌNH ĐƠN GIÁ DƯỚI 50
SELECT [CategoryID] , 
       SUM([UnitsInStock])  AS "HÀNG TỒN KHO",
       AVG([UnitPrice]) AS "GIÁ TRUNG BÌNH"
FROM Products
GROUP BY [CategoryID]
HAVING SUM([UnitsInStock])>30 AND AVG([UnitPrice])<50
-- SỐ TIỀN VẬN CHUYỂN TỪNG THÁNG NỬA SAU 1996 XẮP XẾP
SELECT MONTH([ShippedDate]) AS "THÁNG VẬN CHUYỂN" ,
      SUM(FREIGHT) AS "SỐ TIỀN VẬN CHUYỂN"
FROM Orders
WHERE YEAR ([ShippedDate])=1996
GROUP BY MONTH ([ShippedDate])
HAVING MONTH ([ShippedDate]) >6
ORDER BY MONTH([ShippedDate])

