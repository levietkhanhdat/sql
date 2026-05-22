SELECT [SupplierID] , AVG([UnitPrice])
FROM Products
GROUP BY [SupplierID] 


SELECT [SupplierID] , SUM([UnitsInStock])
FROM Products
GROUP BY [SupplierID] 
-- CHO BIẾN GIÁ MIN VÀ MAX CỦA CÁC ĐƠN HÀNG THEO COUNTRY VÀ CITY KHÁC NHAU
SELECT [ShipCountry],[ShipCity],
       MIN([Freight]) AS "GIÁ VẬN CHUYỂN THẤP NHẤT", 
       MAX([FREIGHT]) AS "GIÁ VẬN CHUYỂN CAO NHẤT"
FROM [Orders]
GROUP BY [ShipCountry],[ShipCity]
ORDER BY [ShipCountry],[ShipCity]

-- SỐ LƯỢNG NHÂN VIÊN THEO TỪNG QUỐC GIA
SELECT [Country],COUNT(*)
FROM [dbo].[Employees]