--exercise 1 - all columns from vender inner joined with invoice
SELECT* 
FROM Invoices 
	inner join Vendors 
	on Invoices.VendorID = Vendors.VendorID
  
--exercise 2 - all non zero balance invoices
SELECT  
	v.VendorName
	, i.InvoiceNumber
	, i.InvoiceDate
	, i.InvoiceTotal - (i.PaymentTotal + i.CreditTotal) AS Balance
	FROM Invoices i
	left join Vendors v
	on i.VendorID = v.VendorID
	WHERE i.InvoiceTotal - (i.PaymentTotal + i.CreditTotal) > 0
	ORDER BY VendorName
	
--exercise 3 - each vendor and their description
SELECT  
	DISTINCT v.VendorName
	,v.DefaultAccountNo
	,g.AccountDescription
	FROM Vendors AS v
	left join GLAccounts AS g
	on v.DefaultAccountNo = g.AccountNo
	ORDER BY g.AccountDescription, v.VendorName

--exercise 4 - exercise 2 but using legacy code
SELECT  
	VendorName
	, InvoiceNumber
	, InvoiceDate
	, InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Vendors,Invoices
	WHERE Vendors.VendorID = Invoices.VendorID AND
	InvoiceTotal - (PaymentTotal + CreditTotal) > 0
	ORDER BY VendorName

--exercise 5 - showing data from three tables
SELECT 
	v.VendorName AS 'Vendor'
	,i.InvoiceDate AS 'Date'
	,i.InvoiceNumber AS 'Number'
	,li.InvoiceSequence AS '#'
	,li.InvoiceLineItemAmount AS 'LineItem'
	FROM Vendors AS v
	LEFT JOIN Invoices AS i
	ON v.VendorID = i.VendorID
	LEFT JOIN InvoiceLineItems AS li
	ON v.DefaultAccountNo = li.AccountNo
	ORDER BY 'Vendor', 'Date', 'Number', '#'

--exercise 6 - all the vendor contacts that share first names 
SELECT
	v1.VendorID
	,v1.VendorName
	,v1.VendorContactFName + ' ' + v1.VendorContactLName AS 'Name'
	FROM Vendors AS v1
	JOIN Vendors AS v2
	ON v1.VendorID <> v2.VendorID
	AND v1.VendorContactFName = v2.VendorContactFName
	ORDER BY 'Name'

--exercise 7 - all non used account numbers
SELECT
	g.AccountNo
	,g.AccountDescription
	FROM GLAccounts AS g
	FULL OUTER JOIN InvoiceLineItems AS li
	ON g.AccountNo = li.AccountNo
	WHERE g.AccountNo IS NULL
	OR li.AccountNo IS NULL
	ORDER BY g.AccountNo

--exercise 8 - union between a list of people in CA and people outside CA
SELECT 
	VendorName
	,'CA' AS VendorState
	FROM Vendors
	WHERE VendorState = 'CA'
UNION
SELECT 
	VendorName
	,'Outside CA' AS VendorState
	FROM Vendors
	WHERE VendorState <> 'CA'
	ORDER BY VendorName

