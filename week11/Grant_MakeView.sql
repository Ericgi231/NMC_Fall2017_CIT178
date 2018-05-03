CREATE VIEW InvoiceItems AS

SELECT
	invli.InvoiceID,
	invli.LineNum,
	inv.InvoiceDate,
	inv.CustID,
	invli.InventoryID,
	invli.Quantity,
	invli.Price,
	invli.Quantity * invli.Price AS ExtPrice
	FROM InvoiceLine AS invli
	JOIN Invoice AS inv
		ON inv.InvoiceID = invli.InvoiceID