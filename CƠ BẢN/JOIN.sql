SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM [dbo].[Categories] c
LEFT JOIN [dbo].[Products] p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;


SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM [dbo].[Categories] c
inner JOIN [dbo].[Products] p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;


--
SELECT DISTINCT P.[ProductName],S.[ContactName]
FROM  [dbo].[Order Details] AS OD
JOIN [dbo].[Products] AS P
ON P.[ProductID]=OD.[ProductID]
JOIN [dbo].[Suppliers] AS S
ON S.[SupplierID]=P.[SupplierID]
---