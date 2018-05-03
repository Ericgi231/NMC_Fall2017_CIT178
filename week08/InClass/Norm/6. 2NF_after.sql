USE Ch10_Normalized;
GO

DROP TABLE IF EXISTS NF2_SaleHead;
DROP TABLE IF EXISTS NF2_SaleItem;
GO

CREATE TABLE NF2_SaleHead(
	InvoiceNo INT PRIMARY KEY
	, CustID CHAR(10)
	, SaleDate DATE
);


CREATE TABLE NF2_SaleItem(
	InvoiceNo INT NOT NULL 
	, LineNum INT NOT NULL
	, PartID CHAR(20)
	, PartDescription VARCHAR(200)
);


ALTER TABLE NF2_SaleItem
	ADD CONSTRAINT PK_Invoice_Line
	PRIMARY KEY (InvoiceNo, LineNum);


ALTER TABLE NF2_SaleItem
	ADD CONSTRAINT FK_InvoiceNo
	FOREIGN KEY (InvoiceNo)
		REFERENCES NF2_SaleHead (InvoiceNo);


INSERT INTO NF2_SaleHead VALUES
	(1001, 'IBM', '2017-04-03')
	, (1002, 'KONICA', '2017-05-03')
	, (1003, 'CANON', '2017-06-03');

INSERT INTO NF2_SaleItem VALUES
	(1001, 1, 'MEM2GB', '2GB Memory Module')
	, (1001, 2, 'MEM4GB', '4GB Memory Module')
	, (1001, 3, 'MEM6GB', '6gB Memory Module')
	, (1002, 1, 'MEM2GB', '2GB Memory Module')
	, (1002, 2, 'MEM8GB', '8GB Memory Module')
	, (1003, 1, 'MEM4GB', '4GB Memory Module');