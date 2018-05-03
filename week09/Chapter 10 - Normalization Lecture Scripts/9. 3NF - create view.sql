USE Ch10_Normalized;
GO

DROP VIEW IF EXISTS NF3_SalesList;
GO

CREATE VIEW NF3_SalesList AS
SELECT 
	si.InvoiceNo,
	si.LineNum,
	s.CustId,
	s.SaleDate,
	i.PartId,
	i.PartDescription
	FROM NF3_SaleItem si
	JOIN NF3_Inventory i ON si.PartId = i.PartId
	JOIN NF2_SaleHead s ON s.InvoiceNo = si.InvoiceNo;

