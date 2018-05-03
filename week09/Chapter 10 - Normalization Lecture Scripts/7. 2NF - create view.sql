USE CH10_Normalized;
GO

DROP VIEW IF EXISTS NF2_SalesList;
GO

CREATE VIEW NF2_SalesList AS
SELECT
	si.InvoiceNo,
	si.LineNum,
	sh.CustID,
	sh.SaleDate,
	si.PartID,
	si.PartDescription
	FROM NF2_SaleItem si
	JOIN NF2_SaleHead sh ON sh.InvoiceNo = si.InvoiceNo;

