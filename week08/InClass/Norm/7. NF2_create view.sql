USE Ch10_Normalized;
GO

DROP VIEW IF EXISTS NF2_SalesList;
GO

CREATE VIEW NF2_SalesList AS
SELECT
	si.invoiceNo
	, si.lineNum
	, sh.custID
	, sh.SaleDate
	, si.partID
	, si.partDescription
	FROM NF2_SaleItem AS si
	JOIN NF2_SaleHead AS sh
		ON si.InvoiceNo = sh.InvoiceNo;

