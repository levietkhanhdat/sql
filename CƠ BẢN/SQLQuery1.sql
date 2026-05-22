-- KHÁCH HÀNG CÓ TÊN = CHỮ A
SELECT *
FROM [dbo].[Customers]
WHERE [ContactName] LIKE 'A%'

SELECT *
FROM [dbo].[Customers]
WHERE [ContactName] LIKE 'H_%'


SELECT *
FROM ORDERS
WHERE [ShipCity] LIKE 'L[^u,o]%'

-- tên công ty bắt đầu bằng a và ko chứa b
SELECT * 
FROM [dbo].[Suppliers]
WHERE [CompanyName] LIKE 'A%'