USE BSF;
GO

DROP  PROCEDURE IF EXISTS dbo.FindStatus
GO


----find people that are both clients and recipients based on full name.
----
CREATE PROCEDURE dbo.FindStatus @status CHAR(20) = 'RECEIVED' AS
SELECT
	*
	FROM Request
	WHERE RequestStatus = @status
GO