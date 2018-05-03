USE AP;
GO

CREATE PROC spBalanceRange
       @VendorVar varchar(50) = '%',
       @BalanceMin money = 0,
       @BalanceMax money = 0
AS