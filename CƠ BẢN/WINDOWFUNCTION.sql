--XẾP HẠNG SẢN PHẨM THEO GIÁ TIỀN
SELECT [ProductID],
      [ProductName],
      [CategoryID],
      [UnitPrice],
      RANK () OVER (ORDER BY [UnitPrice] DESC) AS RANKING
FROM [dbo].[Products]
--XẾP HẠNG SẢN PHẨM THEO GIÁ TIỀN THEO THỂ LOẠI 
SELECT [ProductID],
      [ProductName],
      [CategoryID],
      [UnitPrice],
      RANK () OVER ( PARTITION BY [CategoryID]
      ORDER BY [UnitPrice] DESC , [ProductName] ASC) AS RANKING
FROM [dbo].[Products] 
--XẾP HẠNG SINH VIÊN TOÀN TRƯỜNG THEO TỪNG LỚP HỌC DỰA TRÊN SỐ ĐIỂM GIẢM DẦN, KHÔNG NHẢY HẠNG
SELECT [ma_sinh_vien],[ho_ten],[diem_trung_binh],[ma_lop_hoc],
       ROW_NUMBER () OVER ( 
       PARTITION BY [ma_lop_hoc] 
       ORDER BY [diem_trung_binh] DESC) AS "RANK"
FROM [dbo].[sinh_vien]  
- Chúng ta sẽ sử dụng hàm LAG() lấy thông tin về đơn đặt hàng 
-- và ngày đặt hàng của đơn đặt hàng trước đó cho mỗi khách hàng.
SELECT
	[CustomerID],
	[OrderID],
	[OrderDate],
	LAG([OrderDate]) OVER (PARTITION BY [CustomerID] ORDER BY [OrderDate] ASC) AS PreviousOrderDate
FROM [dbo].[Orders]
ORDER BY [CustomerID], [OrderDate];
-- TÍNH TỔNG DOANH SỐ BÁN HÀNG HÀNG NĂM CHO MỖI KHÁCH HÀNG VÀ XẾP HẠNG DỰA TRÊN DOANH SỐ BÁN HÀNG
WITH DOANH_THU AS(
      SELECT O.[CustomerID],SUM(OD.[Quantity]*OD.[UnitPrice]) AS DOANH_THU
      , YEAR([OrderDate]) AS NAM
      FROM [dbo].[Order Details] OD
      JOIN [dbo].[Orders]  O
      ON OD.[OrderID]=O.[OrderID]
      GROUP BY O.[CustomerID],YEAR([OrderDate])
     )


SELECT [ContactName],
        DT.DOANH_THU, DT.NAM,
        RANK () OVER ( PARTITION BY  DT.NAM 
        ORDER BY  DT.DOANH_THU) AS RANK
FROM [dbo].[Customers] C
JOIN DOANH_THU DT
ON DT.CustomerID=C.CustomerID
 