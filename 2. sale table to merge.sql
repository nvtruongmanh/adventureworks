USE AdventureWorks2019;

SELECT *
FROM Person.BusinessEntity;

SELECT TOP 100 *
FROM Person.Person;


SELECT  *
	, OrderQty * UnitPrice - LineTotal as 'diff 1'
	, OrderQty * UnitPrice * ( 1 - UnitPriceDiscount) - LineTotal as 'diff 2'
FROM Sales.SalesOrderDetail
WHERE UnitPriceDiscount > 0;

SELECT TOP 100 *
FROM Sales.SalesOrderHeader;

SELECT TOP 100 
	b.SalesOrderNumber 'Mã đơn hàng'
	, b.OrderDate 'Ngày bán hàng'
	, a.ProductID 'Mã sản phẩm'
	, c.Name 'Tên sản phẩm'
	, a.OrderQty 'Số lượng bán'
	, a.UnitPrice 'Đơn giá bán'
	, a.UnitPriceDiscount 'Đơn giá chiết khấu'
	, a.LineTotal  'Thành tiền'
	, b.CustomerID 'Mã khách hàng'
	, CONCAT ( f.FirstName, ' ', f.LastName ) 'Tên khách hàng'
	, b.SalesPersonID 'Mã nhân viên bán hàng'
	, b.Status 'Trạng thái đơn hàng'
	, CASE b.OnlineOrderFlag 
		WHEN 0 THEN N'Tại quầy'
		WHEN 1 THEN N'Online'
	END 'Kênh bán hàng'
	, b.Comment 'Ghi chú'
FROM Sales.SalesOrderDetail a
LEFT JOIN Sales.SalesOrderHeader b
	ON a.SalesOrderID = b.SalesOrderID
LEFT JOIN Production.Product c
	ON a.ProductID = c.ProductID
LEFT JOIN Sales.Customer d
	ON b.CustomerID = d.CustomerID
LEFT JOIN Person.BusinessEntity e
	ON d.PersonID = e.BusinessEntityID
LEFT JOIN Person.Person f
	on e.BusinessEntityID = f.BusinessEntityID;
