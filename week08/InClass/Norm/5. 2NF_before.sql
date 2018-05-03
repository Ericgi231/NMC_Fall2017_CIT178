USE Ch10_Before;
GO

DROP TABLE IF EXISTS NF2_Sale;

CREATE TABLE NF2_Sale(
	InvoiceNo INT
	, CustID CHAR(10)
	, SaleDate DATE
	, LineNum INT
	, PartID CHAR(20)
	, PartDescription VARCHAR(200)
);

INSERT INTO NF2_Sale VALUES
	(1001, 'IBM', '2017-04-03', 1, 'MEM2GB', '2GB Memory Module')
	, (1001, 'IBM', '2017-04-03', 2, 'MEM4GB', '4GB Memory Module')
	, (1001, 'IBM', '2017-04-03', 3, 'MEM6GB', '6gB Memory Module')
	, (1002, 'KONICA', '2017-05-03', 1, 'MEM2GB', '2GB Memory Module')
	, (1002, 'KONICA', '2017-05-03', 2, 'MEM8GB', '8GB Memory Module')
	, (1003, 'CANON', '2017-06-03', 1, 'MEM4GB', '4GB Memory Module');