USE Ch10_Normalized;
GO

DROP VIEW IF EXISTS NF1_CenturyPerson;
GO

CREATE VIEW NF1_CenturyPerson AS 
SELECT 
	c.Century
	,p.FirstName
	,p.LastName
	FROM NF1_Century AS c
	JOIN NF1_Person AS p
		ON c.CenturyUid = p.CenturyUid;