-- note - no "before" script this time, flows from 2NF_after.sql

USE Ch10_Normalized;
GO

DROP TABLE IF EXISTS NF3_SaleItem;
DROP TABLE IF EXISTS NF3_Inventory;
GO

CREATE TABLE NF3_SaleItem (
		InvoiceNo INT NOT NULL,
		LineNum INT NOT NULL,
		PartID CHAR(20)
);

ALTER TABLE NF3_SaleItem 
	ADD CONSTRAINT PK_Invoice_Line2 
	PRIMARY KEY (InvoiceNo, LineNum);

ALTER TABLE NF3_SaleItem 
	ADD CONSTRAINT FK_InvoiceNo2
	FOREIGN KEY (InvoiceNo) 
	REFERENCES NF2_SaleHead(InvoiceNo);

INSERT INTO NF3_SaleItem VALUES 
	(1001, 1, 'MEM2GB'),
	(1001, 2, 'MEM4GB'),
	(1001, 3, 'MEM6GB'),
	(1002, 1, 'MEM2GB'),
	(1002, 2, 'MEM8GB'),
	(1003, 1, 'MEM4GB');

CREATE TABLE NF3_Inventory (
		PartID CHAR(20) PRIMARY KEY, 
		PartDescription VARCHAR(200)
);

INSERT INTO NF3_Inventory VALUES 
	('MEM2GB', '2GB Memory Module'),
	('MEM4GB', '4GB Memory Module'),
	('MEM6GB', '6GB Memory Module'),
	('MEM8GB', '8GB Memory Module')

ALTER TABLE NF3_SaleItem 
	ADD CONSTRAINT FK_PartId 
		FOREIGN KEY (PartId)
		REFERENCES NF3_Inventory(PartId);
