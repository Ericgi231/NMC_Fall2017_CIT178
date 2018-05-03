USE AP;
go

/*1*/
DROP VIEW IF EXISTS InvoiceBasic;
GO

CREATE VIEW InvoiceBasic AS
SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM  Vendors JOIN Invoices
  ON Vendors.VendorID = Invoices.VendorID;
go

SELECT *
FROM InvoiceBasic
WHERE VendorName LIKE '[N-P]%'
ORDER BY VendorName;
GO

/*2*/
DROP VIEW IF EXISTS Top10PaidInvoices;
GO

CREATE VIEW Top10PaidInvoices AS
	SELECT
		TOP 10 VendorName
		,MAX(InvoiceDate) AS LastInvoice
		,SUM(InvoiceTotal) AS SumOfInvoices
	FROM Vendors AS v 
	JOIN Invoices AS i
		ON v.VendorID = i.InvoiceID
	WHERE InvoiceTotal - CreditTotal - PaymentTotal = 0
	GROUP BY VendorName
	ORDER BY SUM(InvoiceTotal) DESC;
GO

/*3*/
CREATE VIEW VendorAddress AS
	SELECT 
	VendorID
	,VendorAddress1
	,VendorAddress2
	,VendorCity
	,VendorState
	,VendorZipCode
	FROM Vendors;
GO

SELECT *
	FROM VendorAddress
	WHERE VendorID = 4;

UPDATE VendorAddress
	SET VendorAddress1 = '1990 Westwood Blvd',
		VendorAddress2 = 'Ste 260'
	WHERE VendorID = 4;

/*4*/
SELECT *
FROM sys.foreign_keys;

/*5*/
--SQL automaticly adds an order by clause to the primary key