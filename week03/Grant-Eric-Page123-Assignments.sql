--Part 1
--
--SELECT VendorContactFName, VendorContactLName, VendorName
-- FROM Vendors
-- ORDER BY VendorContactLName, VendorContactFName

--Part 2
--
--SELECT 
--InvoiceNumber, InvoiceTotal, PaymentTotal + CreditTotal AS Credits, InvoiceTotal-PaymentTotal+CreditTotal AS Balance
--FROM Invoices
--WHERE InvoiceTotal between 500 and 10000

--Part 3
--
--SELECT
--	VendorContactLName + ', ' + VendorContactFName AS 'Full Name'
--	FROM Vendors
--	WHERE VendorContactLName LIKE '[A,B,C,E]%'
--	ORDER BY VendorContactLName, VendorContactFName

--Part 4
--
--Part 
--SELECT 
--InvoiceTotal
--, InvoiceTotal / 10 AS '10%'
--, InvoiceTotal * 1.1 AS 'Plus 10%'
--FROM Invoices
--WHERE InvoiceTotal > 1000
--ORDER BY InvoiceTotal DESC

--Part 7
--
--SELECT
--	InvoiceTotal
--	,PaymentTotal
--	,PaymentDate
--	,InvoiceTotal - PaymentTotal AS BalanceDue
--	FROM Invoices
--	WHERE (
--	InvoiceTotal - PaymentTotal > 0
--	AND PaymentDate IS NOT NULL
--	) OR (
--	InvoiceTotal - PaymentTotal = 0
--	AND PaymentDate IS NULL
--	)