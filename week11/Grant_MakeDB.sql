USE master;
GO

IF DB_ID('Test') IS NOT NULL
BEGIN
	ALTER DATABASE Test
		SET SINGLE_USER 
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Test;
END

CREATE DATABASE Test;
GO

USE Test;
GO

----InvoiceLine
----
DROP TABLE IF EXISTS InvoiceLine;
CREATE TABLE InvoiceLine
(
	InvoiceID INT,
	LineNum INT,
	InventoryID CHAR(20),
	Quantity INT Default 1,
	Price MONEY,
	CONSTRAINT PK_InvoiceLine
		PRIMARY KEY (InvoiceID, LineNum)
);

INSERT INTO InvoiceLine VALUES
	(10001, 1, 'BACON', 400, 1.25),
	(10001, 2, 'LETTUCE', 400, .20),
	(10001, 3, 'TOMATO', 400, .50),
	
	(10002, 1, 'BACON', 200, 1.50),
	(10002, 2, 'LETTUCE', 200, .40),
	(10002, 3, 'TOMATO', 200, .75),

	(10003, 1, 'BACON', 600, .95),
	(10003, 2, 'LETTUCE', 600, .15),
	(10003, 3, 'TOMATO', 600, .45);

----Invoice
----
DROP TABLE IF EXISTS Invoice;
CREATE TABLE Invoice
(
	InvoiceID INT IDENTITY(10001, 1) PRIMARY KEY,
	InvoiceDate DATE DEFAULT GetDate(),
	CustID CHAR(10),
);

INSERT INTO Invoice (CustID) VALUES
	('MEJIER'),
	('FAMILYFARE'),
	('OLESONS');

ALTER TABLE InvoiceLine
	ADD CONSTRAINT FK_InvoiceLine_Invoice 
		FOREIGN KEY (InvoiceID)
		REFERENCES Invoice(InvoiceID);

