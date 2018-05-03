USE BSF;
GO

DROP VIEW IF EXISTS repeat_donors 
GO

CREATE VIEW repeat_donors AS
SELECT *
	FROM Donor
	WHERE DateOfFirstDonation != DateOfRecentDonation
GO

DROP VIEW IF EXISTS nut_free_candy
GO

CREATE VIEW nut_free_candy AS
SELECT *
	FROM Candy
	WHERE ContianeNut = 'FALSE'
GO