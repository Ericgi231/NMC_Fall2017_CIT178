/*1*/
USE AP;
GO

--DECLARE @TotalMoneyDue MONEY

--SELECT @TotalMoneyDue = SUM(InvoiceTotal - CreditTotal - PaymentTotal) 
--FROM Invoices
--WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0;

--IF @TotalMoneyDue > 10000
--	SELECT VendorName, InvoiceNumber, InvoiceDueDate, InvoiceTotal - CreditTotal - PaymentTotal AS Balance 
--	FROM Invoices Join Vendors on Invoices.VendorID = Vendors.VendorID 
--	WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
--	ORDER BY InvoiceDueDate; 
--ELSE 
--	PRINT 'Balance due is less than $10,000.00';

/*2*/
--IF OBJECT_ID('tempdb..#FirstInvoice') IS NOT NULL
--    DROP TABLE #FirstInvoice;

--SELECT VendorID, MIN(InvoiceDate) AS FirstInvoiceDate
--INTO #FirstInvoice
--FROM Invoices
--GROUP BY VendorID;

--SELECT VendorName, FirstInvoiceDate, InvoiceTotal
--FROM Invoices JOIN #FirstInvoice
--  ON (Invoices.VendorID = #FirstInvoice.VendorID AND
--      Invoices.InvoiceDate = #FirstInvoice.FirstInvoiceDate)
--JOIN Vendors
--  ON Invoices.VendorID = Vendors.VendorID
--ORDER BY VendorName, FirstInvoiceDate;

/*3*/
--USE AP;

--DROP VIEW IF EXISTS ExampleView;
--GO

--CREATE VIEW ExampleView
--AS
--SELECT VendorID, MIN(InvoiceDate) AS FirstInvoiceDate
--FROM Invoices
--GROUP BY VendorID;
--GO

--SELECT VendorName, FirstInvoiceDate, InvoiceTotal
--FROM Invoices AS i JOIN ExampleView AS ev
--  ON (i.VendorID = ev.VendorID AND
--      i.InvoiceDate = ev.FirstInvoiceDate)
--JOIN Vendors AS v
--  ON i.VendorID = v.VendorID
--ORDER BY VendorName, FirstInvoiceDate;

/*4*/
DECLARE @TableName varchar(128);

SELECT @TableName = MAX(name)
FROM sys.tables
WHERE name <> 'dtproperties' AND name <> 'sysdiagrams';

EXEC ('SELECT COUNT(*) AS CountOf' + @TableName +
      ' FROM ' + @TableName + ';');
