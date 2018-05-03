USE AP;
GO

--exercise 1
--
--CREATE PROC spBalanceRange
--	@VendorVar varchar(50) = '%'
--	, @BalanceMin money = 0
--	, @BalanceMax money = 0
--AS

--IF @BalanceMax = 0
--BEGIN
--	SELECT
--	VendorName
--	, InvoiceNumber
--	, InvoiceTotal - CreditTotal - PaymentTotal AS Balance
--		FROM Vendors JOIN Invoices
--			ON Vendors.VendorID = Invoices.VendorID
--			WHERE VendorName LIKE @VendorVar AND
--			(InvoiceTotal - CreditTotal - PaymentTotal) > 0 AND
--			(InvoiceTotal - CreditTotal - PaymentTotal) >= @BalanceMin
--		ORDER BY Balance DESC;
--END;
--ELSE
--BEGIN
--	SELECT
--		VendorName
--		, InvoiceNumber
--		, InvoiceTotal - CreditTotal - PaymentTotal AS Balance
--		FROM Vendors JOIN Invoices
--			ON Vendors.VendorID = Invoices.VendorID
--			WHERE VendorName LIKE @VendorVar AND
--			(InvoiceTotal - CreditTotal - PaymentTotal) > 0 AND
--			(InvoiceTotal - CreditTotal - PaymentTotal)
--			BETWEEN @BalanceMin AND @BalanceMax
--		ORDER BY Balance DESC;
--END;

--exercise 2
--
--EXEC spBalanceRange 'M%';

--EXEC spBalanceRange @BalanceMin = 200, @BalanceMax = 1000;

--EXEC spBalanceRange @VendorVar = '[C,F]%', @BalanceMax = 200;

--exercise 3
--

--CREATE PROC spDateRange
--       @DateMin varchar(50) = NULL,
--       @DateMax varchar(50) = NULL
--AS

--IF @DateMin IS NULL OR @DateMax IS NULL
--	THROW 50001, 'The DateMin and DateMax parameters are required.', 1;
--IF NOT (ISDATE(@DateMin) = 1 AND ISDATE(@DateMax) = 1)
--	THROW 50001, 'The date format is not valid. Please use mm/dd/yy.', 1;
--IF CAST(@DateMin AS datetime) > CAST(@DateMax AS datetime)
--	THROW 50001, 'The DateMin parameter must be earlier than DateMax', 1;

--SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
--       InvoiceTotal - CreditTotal - PaymentTotal AS Balance
--FROM Invoices
--WHERE InvoiceDate BETWEEN @DateMin AND @DateMax
--ORDER BY InvoiceDate;

--exercise 4
--
--BEGIN TRY
--	EXEC spDateRange @DateMin = '12-10-15', @DateMax = '12-20-15';
--END TRY
--BEGIN CATCH
--	PRINT 'Error Number' + CONVERT(varchar(100), ERROR_NUMBER());
--	PRINT 'Error Message: ' + CONVERT(varchar(100), ERROR_MESSAGE());
--END CATCH;

--exercise 5
--
--CREATE FUNCTION fnUnpaidInvoiceID()
--RETURNS int
--BEGIN
--    RETURN
--    (SELECT MIN(InvoiceID)
--     FROM Invoices
--     WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 AND
--           InvoiceDueDate =
--     (SELECT MIN(InvoiceDueDate)
--      FROM Invoices
--      WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0));
--END;

--SELECT VendorName, InvoiceNumber, InvoiceDueDate,
--	InvoiceTotal - CreditTotal - PaymentTotal AS Balance
--FROM Vendors JOIN Invoices
--	ON Vendors.VendorID = Invoices.VendorID
--WHERE InvoiceID = dbo.fnUnpaidInvoiceID();

--exercise 6
--
--CREATE FUNCTION fnDateRange(@DateMin smalldatetime, @DateMax smalldatetime)
--RETURNS table
--RETURN (
--	SELECT
--	InvoiceNumber
--	, InvoiceDate
--	, InvoiceTotal
--	, InvoiceTotal - CreditTotal - PaymentTotal AS Balance
--	FROM Invoices
--	WHERE InvoiceDAte BETWEEN @DateMin AND @DateMax
--);

--SELECT *
--	FROM dbo.fnDateRange('12/10/15','12/20/15');

--exercise 7
--

--SELECT VendorName, FunctionTable.*
--FROM Vendors JOIN Invoices
--  ON Vendors.VendorID = Invoices.VendorID
--JOIN dbo.fnDateRange('12/10/11','12/20/11') AS FunctionTable
--  ON Invoices.InvoiceNumber = FunctionTable.InvoiceNumber;

--exercise 8
--

--CREATE TABLE ShippingLabels
--(VendorName varchar(50),
-- VendorAddress1	varchar(50),
-- VendorAddress2 varchar(50),
-- VendorCity varchar(50),
-- VendorState char(2),
-- VendorZipCode varchar(20));


--CREATE TRIGGER Invoices_UPDATE_Shipping
--    ON Invoices
--    AFTER INSERT, UPDATE
--AS
--    INSERT ShippingLabels
--    SELECT VendorName, VendorAddress1, VendorAddress2,
--           VendorCity, VendorState, VendorZipCode
--    FROM Vendors JOIN Inserted
--      ON Vendors.VendorID = (SELECT VendorID FROM Inserted)
--    WHERE Inserted.InvoiceTotal - Inserted.PaymentTotal
--        - Inserted.CreditTotal = 0;

--UPDATE Invoices
--SET PaymentTotal = 67.92, PaymentDate = '2016-04-23'
--WHERE InvoiceID = 100;

--exercise 9
--

--CREATE TABLE TestUniqueNulls
--(RowID int IDENTITY NOT NULL,
-- NoDupName varchar(20) NULL);

--CREATE TRIGGER NoDuplicates
--	ON TestUniqueNulls
--	AFTER INSERT, UPDATE AS
--BEGIN
--	IF (SELECT COUNT(*)
--		FROM TestUniqueNulls JOIN Inserted
--       ON TestUniqueNulls.NoDupName = Inserted.NoDupName) > 1
--   BEGIN
--    ROLLBACK TRAN;
--	THROW 50001, 'Duplicate value.', 1;
--	END;
--END;

--INSERT into TestUniqueNulls 
--VALUES (NULL);

--INSERT into TestUniqueNulls 
--VALUES (NULL);

--INSERT into TestUniqueNulls 
--VALUES ('Anne Boehm');

--INSERT into TestUniqueNulls 
--VALUES ('Anne Boehm');