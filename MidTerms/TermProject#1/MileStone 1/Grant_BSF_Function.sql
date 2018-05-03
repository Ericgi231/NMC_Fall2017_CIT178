USE BSF;
GO

DROP FUNCTION IF EXISTS dbo.GetFirstName;
GO

----take a string and remove all characters after the first space.
----
CREATE FUNCTION dbo.GetFirstName
	(
		@fullName AS CHAR(100)
	)
	RETURNS CHAR(100)
	AS
	BEGIN
		DECLARE @space AS INT;
		DECLARE	@firstName AS CHAR(100)

		SET @space = CHARINDEX(' ', @fullName)
		SET @firstName = left(@fullName, @space)

		RETURN @firstName;
	END;