USE AP;
GO

--exercise 1
--
--BEGIN TRAN;
--	UPDATE Invoices
--	SET VendorID = 123
--	WHERE VendorID = 122;

--	DELETE Vendors
--	WHERE VendorID = 122;

--	UPDATE Vendors
--	SET VendorName = 'FedUP'
--	WHERE VendorID = 123;
--COMMIT TRAN;

--exercise 2
--
USE AP;

BEGIN TRAN;
  INSERT InvoiceArchive
  SELECT Invoices.*
  FROM Invoices LEFT JOIN InvoiceArchive
    ON Invoices.InvoiceID = InvoiceArchive.InvoiceID
  WHERE Invoices.InvoiceTotal - Invoices.CreditTotal -
          Invoices.PaymentTotal = 0 AND
        InvoiceArchive.InvoiceID IS NULL;

  DELETE Invoices
  WHERE InvoiceID IN
    (SELECT InvoiceID
     FROM InvoiceArchive);
COMMIT TRAN;
