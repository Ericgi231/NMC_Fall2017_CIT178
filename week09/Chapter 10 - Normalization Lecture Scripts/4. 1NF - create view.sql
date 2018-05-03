USE Ch10_Normalized;
GO

DROP VIEW IF EXISTS NF1_CenturyPerson;
GO 

CREATE VIEW NF1_CenturyPerson AS
	SELECT Century, FirstName, LastName
		FROM NF1_Century c
		JOIN NF1_Person p 
			ON c.CenturyUid = p.CenturyUid;

