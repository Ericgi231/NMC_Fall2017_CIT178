----page 265
--SELECT 
--VendorName,
--VendorContactLName +','+ LEFT(VendorContactFName,1)+'.' AS ContactName,
--RIGHT(VendorPhone,8) AS Phone
--FROM Vendors
--WHERE SUBSTRING(VendorPhone, 2, 3) = 559
--ORDER BY VendorName

----page 267
--SELECT *
--	FROM StringSample
--	ORDER BY CAST(ID AS int);

--SELECT 
--	Name
--	,Left(Name, CHARINDEX(' ', Name) - 1) AS First
--	,Right(Name, LEN(Name) - CHARINDEX(' ', Name) ) AS Last
--	FROM StringSample

----page 269
--SELECT
--ROUND(12.5,0)
--ROUND (12.4999,0)
--ROUND(12.4999,1)
--ROUND(12.4999,-1)
--ROUND(12.5,1,0)
--ISNUMERIC(-1.25)
--ISNUMERIC('SQL SEVER')
--ABS(-1.25)
--CEILING(-1.25) 
--FLOOR(-1.25)
--CEILING(1.25) 
--FLOOR(1.25)
--SQUARE(5.2786)
--SQRT(125.43)
--ROUND(RAND(),1)*10


---Pg271
--SELECT *
--	FROM RealSample
--	WHERE R BETWEEN 0.99 AND 1.01 

--SELECT *
--	FROM RealSample
--	WHERE ROUND(R,2) = 1

--SELECT
--	ID
--	,R
--	,CAST(R AS decimal(9,3)) AS R_Decimal
--	,CAST(CAST(R AS decimal(9,3)) AS varchar(9)) AS R_Varchar
--	,LEN(CAST(CAST(R AS decimal(9,3)) AS varchar(9))) AS R_Len
--	,SPACE(9 - LEN(CAST(CAST(R AS decimal(9,3)) AS varchar(9))))
--	+ CAST(CAST(R AS decimal(9,3)) AS varchar(9)) AS R_Formatted
--	FROM RealSample

----page 275
--SELECT
--GETDATE()
--GETUTCDATE()
--SYSDATETIME()
--SYSUTCDATETIME()
--SYSDATETIMEOFFSET()
--MONTH('2016-09-30')
--DATEPART(month,'2016-09-30')
--DATENAME(month,'2016-09-30')
--DATENAME(m,'2016-09-30')
--EOMONTH('2016-02-01')
--EOMONTH('2016-02-01',2)
--DATEFROMPARTS(2016,4,3)
--ISDATE('2017-10-11')
--ISDATE('2017-10-8')
--ISDATE('23:59:59')
--ISDATE('23:99:99')

---PG 277
--SELECT
	--DAY('2016-09-30')
	--MONTH('2016-09-30')
	--YEAR('2016-09-30')

	--DATEPART(day, '2016-09-30 11:35:00')
	--DATEPART(month, '2016-09-30 11:35:00')
	--DATEPART(year, '2016-09-30 11:35:00')

	--DATENAME(weekday, '2016-09-30 11:35:00')
	--DATENAME(month, '2016-09-30 11:35:00')
	--DATENAME(year, '2016-09-30 11:35:00')

----page 279
--SELECT
--DATEADD(d, 1, '2016-09-30 11:35:00' )
--DATEADD(dw, 1, '2016-09-30 11:35:00' )
--DATEADD(yy, 1, '2016-09-30 11:35:00' )
--DATEDIFF(d,'2016-09-30 11:35:00','2016-02-13')
--DATEDIFF(m,'2016-09-30 11:35:00','2016-02-13')
--DATEDIFF(dw,'2016-09-30 11:35:00','2016-02-13')
--CAST('2016-09-30 11:26:56' as smalldatetime) +1
--CAST('2016-09-30 11:26:56' as smalldatetime) -1
--CAST(CAST('2016-09-30 11:26:56' as smalldatetime) - CAST('2016-05-12 11:26:56' as smalldatetime)as int)

---PG 281
--SELECT *
--	FROM DateSample
--	WHERE StartDate = '2011-10-28';

--SELECT *
--	FROM DateSample
--	WHERE CONVERT(date, StartDate) = '2011-10-28';

--SELECT *
--	FROM DateSample
--	WHERE StartDate >= '2011-10-28' AND StartDate < '2011-10-29';

--SELECT *
--	FROM DateSample
--	WHERE 
--		MONTH(StartDate) = 10 AND 
--		DAY(StartDate) = 28 AND
--		YEAR(StartDate) = 2011;

--SELECT *
--	FROM DateSample
--	WHERE CAST(CAST(StartDate AS Char(11)) AS datetime) = '2011-10-28';

--SELECT *
--	FROM DateSample
--	WHERE CONVERT(datetime, CONVERT(char(10), StartDate, 110)) = '2011-10-28';

----page 283
--SELECT *
--FROM DateSample
--WHERE StartDate = CAST('10:00:00' AS DateTime)

--SELECT *
--FROM DateSample
--WHERE StartDate >= '09:00:00' AND StartDate <'12:59:59:999'

--SELECT *
--FROM DateSample
--WHERE CONVERT(Time, StartDate) >= '09:00:00' AND CONVERT(time, StartDate) <'12:59:59:999'

--SELECT *
--FROM DateSample
--WHERE CONVERT(datetime, convert(CHAR(12), StartDate, 8)) >= '09:00:00' AND CONVERT(datetime, convert(CHAR(12), StartDate, 8)) < '12:59:59:999'

---PG 285
--SELECT 
--	InvoiceNumber
--	,TermsID
--		,CASE TermsID
--			WHEN 1 THEN 'Net due 10 days'
--			WHEN 2 THEN 'Net due 20 days'
--			WHEN 3 THEN 'Net due 30 days'
--			WHEN 4 THEN 'Net due 60 days'
--			WHEN 5 THEN 'Net due 90 days'
--		END AS Terms
--	FROM Invoices

--SELECT 
--	InvoiceNumber
--	,InvoiceTotal
--	,InvoiceDate
--	,InvoiceDueDate
--		,CASE
--			WHEN DATEDIFF(d, InvoiceDueDate, GETDATE()) > 30
--				THEN 'Over 30 days past due'
--			WHEN DATEDIFF(d, InvoiceDueDate, GETDATE()) > 0
--				THEN '1 to 30 days past due'
--			ELSE 'Current'
--		END AS Status
--	FROM Invoices
--	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;

----page 287
--SELECT VendorId, 
--Sum(InvoiceTotal) AS SumInvoices,
--IIF(Sum(InvoiceTotal) <1000, 'Low', 'High') AS InvoiceRange
--FROM Invoices
--GROUP BY VendorID
 
-- SELECT 
-- InvoiceNumber, 
-- InvoiceTotal,
-- InvoiceDate,
--  CHOOSE(TermsID,'10 days', '20 days', '30 days','60 days','90 days') AS NetDue
--FROM Invoices
--WHERE InvoiceTotal - PaymentTotal-CreditTotal >0

---Page 289
--SELECT 
--	PaymentDate
--	,COALESCE(PaymentDate, '1900-01-01') AS NewDate
--	FROM Invoices
 
--SELECT 
--	PaymentDate
--	,ISNULL(PaymentDate, '1900-01-01') AS NewDate
--	FROM Invoices
 
-- SELECT 
--	PaymentDate
--	,COALESCE(CAST(InvoiceTotal AS Varchar), 'No Invoices') AS InvoiceTotal
--	FROM Vendors AS v
--	LEFT JOIN Invoices AS i
--		ON v.VendorID = i.VendorID
--	ORDER BY VendorName

--page 291
--SELECT 
--	CASE 
--		WHEN GROUPING (VendorState) = 1 THEN 'ALL'
--		ELSE VendorState
--		END AS VendorState,
		 
--		CASE 
--		WHEN GROUPING (VendorCity) = 1 THEN 'ALL'
--		ELSE VendorCity
--		END AS VendorCity,
--		COUNT(*) AS QTYVendors
		 
--		FROM Vendors
--		WHERE VendorState IN('IA','NJ')
--		GROUP BY VendorState,VendorCity With ROLLUP
--		ORDER BY VendorState Desc, VendorCity desc

----page 293
--SELECT ROW_NUMBER() OVER(ORDER BY VendorName) AS RowNumber
--	,VendorName
--	FROM Vendors

--SELECT ROW_NUMBER() OVER(PARTITION BY VendorState ORDER BY VendorName) AS RowNumber
--	,VendorName
--	,VendorState
--	FROM Vendors

----page 295
--SELECT
--	RANK() OVER (ORDER BY InvoiceTotal) AS Rank
--	,DENSE_RANK() OVER (ORDER BY InvoiceTotal) AS DenseRank
--	,InvoiceTotal
--	,InvoiceNumber
--	FROM Invoices

--SELECT
--	TermsDescription
--	,NTILE(2) OVER (ORDER BY TermsID) AS Tile2
--	,NTILE(3) OVER (ORDER BY TermsID) AS Tile3
--	,NTILE(4) OVER (ORDER BY TermsID) AS Tile4
--	FROM Terms

----page 297
--SELECT 
--	SalesYear
--	,RepFirstName + ' ' + RepLastName AS RepName
--	,SalesTotal
--	,FIRST_VALUE(RepFirstName + ' ' + RepLastName)
--		OVER (PARTITION BY SalesYear ORDER BY SalesTotal DESC) AS HighestSales
--	,LAST_VALUE(RepFirstName + ' ' + RepLastName)
--		OVER (PARTITION BY SalesYear ORDER BY SalesTotal DESC
--		RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LowestSales
--FROM SalesTotals JOIN SalesReps
--	ON SalesTotals.RepID = SalesReps.RepID

----page 299
--SELECT	
--	RepID
--	,SalesYear
--	,SalesTotal AS CurrentSales
--	,LAG(SalesTotal, 1, 0) OVER (PARTITION BY RepID ORDER BY SalesYear) AS LastSales
--	,SalesTotal - LAG(SalesTotal, 1, 0)
--		OVER (PARTITION BY REPID ORDER BY SalesYear) AS Change
--	FROM SalesTotals

--SELECT
--	SalesYear
--	,RepID
--	,SalesTotal
--	,PERCENT_RANK() OVER (PARTITION BY SalesYear ORDER BY SalesTotal) AS PctRank
--	,CUME_DIST() OVER (PARTITION BY SalesYear ORDER BY SalesTotal) AS CumeDist
--	,PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY SalesTotal)
--		OVER (PARTITION BY SalesYear) AS PercentileCont
--	,PERCENTILE_DISC(.5) WITHIN GROUP (ORDER BY SalesTotal)
--		OVER (PARTITION BY SalesYear) AS PercentileDisc
--	FROM SalesTotals