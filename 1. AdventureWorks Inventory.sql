USE AdventureWorks2019;

-- 1. creating inventory report
-- view table
SELECT *
FROM  Production.ProductInventory
ORDER BY ModifiedDate DESC;

SELECT *
FROM  Production.ProductInventory
ORDER BY ProductID
	, LocationID
	, Shelf
	, Bin;

-- count rows
SELECT COUNT ( * )
FROM Production.ProductInventory;