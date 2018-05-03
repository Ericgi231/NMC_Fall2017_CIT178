----exercise 1
----
--InvoiceID
--VendorID
--InvoiceNumber
--InvoiceDate
SELECT
	CAST(InvoiceTotal AS decimal (7,2)) AS CastDecimal
	,CAST(InvoiceTotal AS varchar) AS CastVarchar
	,CONVERT(decimal (7,2), InvoiceTotal) AS ConvertDecimal
	,CONVERT(varchar (10), InvoiceTotal,1) AS ConvertVarchar
	FROM Invoices
	order by ConvertVarchar
----exercise 2
----
SELECT
	CAST(InvoiceDate AS varchar) as cast1
	,CONVERT(varchar (1),InvoiceDate,1) as varchar1
	,convert(varchar (10), invoicedate,10) as varchar10
	,CAST(InvoiceDate as real) as real1
	FROM Invoices