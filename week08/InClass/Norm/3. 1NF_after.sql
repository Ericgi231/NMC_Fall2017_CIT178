USE Ch10_Normalized;
GO

DROP TABLE IF EXISTS NF1_Person;
DROP TABLE IF EXISTS NF1_Century;

CREATE TABLE NF1_Century(
	CenturyUid INT PRIMARY KEY IDENTITY
	,Century CHAR(4)
);

CREATE TABLE NF1_Person(
	PersonUid INT PRIMARY KEY IDENTITY
	,FirstName VARCHAR(30)
	,LastName VARCHAR(30)
	,CenturyUid INT
	,FOREIGN KEY(CenturyUid) REFERENCES NF1_Century(CenturyUid)
);

INSERT INTO NF1_Century VALUES
	('18th')
	,('19th')
	,('20th');

INSERT INTO NF1_Person VALUES
	('Mar', 'Wolf', 1)
	,('Jane', 'Austen', 1)
	,('Sojo', 'Truth', 1)
	,('Marge', 'Full', 2)
	,('Susan B.', 'Anthony', 2)
	,('Flore', 'Night', 2)
	,('Eli', 'Black', 2)
	,('Rose', 'Park', 3)
	,('Billie', 'Hooliday', 3)
	,('Indira', 'Gandhi', 3)
	,('Eva', 'Peron', 3)
	,('Betty', 'Frie', 3)
	,('Marge', 'Thatchy', 3);