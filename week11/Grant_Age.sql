USE WideWorldImporters
GO

DROP FUNCTION IF EXISTS dbo.CalcAge;
GO

CREATE FUNCTION dbo.CalcAge
	(
		@dateOfBirth AS DATE
	)
	RETURNS INT
	AS 
	BEGIN
		DECLARE @todaysDate AS DATE = GETDATE();
		DECLARE @ageInYears AS INT;

		SET @ageInYears = 
			DATEDIFF(YEAR, @dateOfBirth, @todaysDate)
			- CASE WHEN
				100 * MONTH(@todaysDate)
				+ DAY(@todaysDate)
				<
				100 * MONTH(@dateOfBirth)
				+ day(@dateOfBirth)
				THEN 1 ELSE 0
				END;

		RETURN @ageInYears
	END;
GO