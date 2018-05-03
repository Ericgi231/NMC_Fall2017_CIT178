----exercise 1
SELECT 
	VendorContactFName + ' ' + LEFT(VendorContactLName, 1) + '.' AS Contact
	,SUBSTRING(VendorPhone,7,8) AS Phone
	FROM Vendors
	WHERE LEFT(VendorPhone,5) = '(559)'
	ORDER BY Contact

----exercise 2
SELECT 
	InvoiceNumber
	,InvoiceTotal - CreditTotal - PaymentTotal AS Balance
	FROM Invoices
	WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 
	AND InvoiceDueDate < GETDATE() + 30

----exercise 3
SELECT 
	InvoiceNumber
	,InvoiceTotal - CreditTotal - PaymentTotal AS Balance
	FROM Invoices
	WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 
	AND InvoiceDueDate < 
	CAST(CAST(YEAR(GETDATE()) AS char(4)) 
	+ '-'
	+ CAST(MONTH(GETDATE()) + 1 AS char(2)) + '-01' AS datetime) - 1

----exercise 4
SELECT
	CASE
		WHEN GROUPING(AccountDescription) = 1 THEN '*ALL*'
			ELSE AccountDescription
	END AS Account
	,CASE
		WHEN GROUPING(VendorState) = 1 THEN '*ALL*'
			ELSE VendorState
	END AS State
	,SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts AS gla
	JOIN InvoiceLineItems AS ili 
		ON gla.AccountNo = ili.AccountNo
	JOIN Invoices AS i
		ON ili.InvoiceID =  i.InvoiceID
	JOIN Vendors AS v
		ON i.VendorID = v.VendorID
	GROUP BY AccountDescription, VendorState WITH CUBE

----exercise 5
SELECT 
	InvoiceNumber
    ,InvoiceTotal - CreditTotal - PaymentTotal AS Balance
    ,RANK() OVER (ORDER BY InvoiceTotal - CreditTotal - PaymentTotal DESC) As BalanceRank
	FROM Invoices
	WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
	AND InvoiceDueDate < GETDATE() + 30