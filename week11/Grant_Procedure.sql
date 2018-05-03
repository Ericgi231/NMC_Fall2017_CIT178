USE WideWorldImporters
GO

DROP PROCEDURE IF EXISTS Sales.GetCustomerOrders;
GO

CREATE PROCEDURE Sales.GetCustomerOrders
	@custID AS INT = 1
	, @fromDate AS DATE = '1900-01-01'
	, @thruDate AS DATE = '9999-12-31'
	, @numRows AS INT OUTPUT
	AS
	SET NOCOUNT ON;
	
	SELECT *
		FROM Sales.Orders
		WHERE CustomerID = @custID
			AND OrderDate >= @fromDate
			AND OrderDate <= @thruDate
			
	SET @numRows = @@ROWCOUNT;

GO