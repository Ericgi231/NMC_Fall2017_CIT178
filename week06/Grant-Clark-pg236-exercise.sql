----exercise 1
----
--SELECT *
--	INTO InvoicesCopy
--	FROM Invoices

--SELECT *
--	INTO VendorsCopy
--	FROM Vendors

----exercise 2
----
--INSERT INTO InvoicesCopy 
--VALUES (32,'AX-014-027',6/21/2016, $434.58, $0.00, $0.00, 2, 07/8/2016, NULL );

----exercise 3
----
--INSERT INTO VendorsCopy
--SELECT
--	VendorName
--	,VendorAddress1
--	,VendorAddress2
--	,VendorCity
--	,VendorState
--	,VendorZipCode
--	,VendorPhone
--	,VendorContactLName
--	,VendorContactFName
--	,DefaultTermsID
--	,DefaultAccountNo
--FROM Vendors
--WHERE VendorState != 'CA';

----exercise 4
----
--UPDATE VendorsCopy
--SET DefaultAccountNo = 403 
--WHERE DefaultAccountNo = 400

----exercise 5
----
--UPDATE InvoicesCopy
--SET PaymentDate = GETDATE(), PaymentTotal = (InvoiceTotal - PaymentTotal)
--WHERE (InvoiceTotal - PaymentTotal) > 0

----exercise 6
----
--UPDATE InvoicesCopy
--SET TermsId = 2
--WHERE VendorID IN (
--	SELECT VendorID
--		FROM Vendors
--		WHERE DefaultTermsID = 2
--	)

----exercise 7
----
--UPDATE InvoicesCopy
--SET TermsId = DefaultTermsID
--	FROM Vendors AS v
--	LEFT JOIN InvoicesCopy AS ic
--		ON v.VendorID = ic.VendorID
--	WHERE DefaultTermsID = 2

----exercise 8
----
--DELETE FROM VendorsCopy
--	WHERE VendorState = 'MA'

----exercise 9
----
--DELETE FROM VendorsCopy
--	WHERE VendorState NOT IN (
--		SELECT
--			DISTINCT VendorState
--			FROM Vendors AS v
--			LEFT JOIN Invoices AS i
--				ON v.VendorID = i.VendorID
--			WHERE i.InvoiceID IS NOT NULL
--	)