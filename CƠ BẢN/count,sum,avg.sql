-- đếm số lượng customers
SELECT COUNT(*) AS "SỐ LƯỢNG KHÁCH HÀNG"
FROM Customers
-- TÍNH TỔNG SỐ TIỀN VẬN CHUYỂN CỦA ALL ĐƠN HÀNG
SELECT SUM (FREIGHT) AS "TỔNG SỐ TIỀN VẬN CHUYỂN" , COUNT (*) AS "TỔNG SỐ ĐƠN HÀNG"
FROM Orders;
-- TÍNH TRUNG BÌNH SỐ LƯỢNG ĐẶT HÀNG
SELECT AVG(QUANTITY) AS "TRUNG BINH SO LUONG DAT HÀNG",
       SUM (QUANTITY) AS "TỔNG SỐ LƯỢNG ĐẶT HÀNG",
       COUNT (QUANTITY) AS " SỐ LƯỢNG ĐẶT HÀNG"
FROM [Order Details]
-- ĐẾM SỐ LƯỢNG , TÍNH TỔNG ĐƠN HÀNG , TỒN KHO VÀ TRUNG BÌNH GIÁ 
SELECT COUNT (*) AS "SỐ LƯỢNG HÀNG",
       SUM ((UnitsInStock)-(UnitsOnOrder)) AS "TỔNG SỐ LƯỢNG HÀNG TỒN KHO",
       AVG (UnitPrice) AS "GIÁ TRUNG BÌNH"
FROM Products
SELECT (UnitsInStock)
FROM Products
-- ĐẾM SỐ LƯỢNG ĐƠN HÀNG
SELECT COUNT(*)
FROM Products
SELECT COUNT (ProductID)
FROM Products