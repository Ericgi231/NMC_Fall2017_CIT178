USE Ch10_Normalized;
GO

DROP TABLE IF EXISTS NF1_Person;
DROP TABLE IF EXISTS NF1_Century;

CREATE TABLE NF1_Century (
	CenturyUid INT PRIMARY KEY IDENTITY,
	Century CHAR(4)
);

CREATE TABLE NF1_Person (
	PersonUid INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	CenturyUid INT ,
	FOREIGN KEY(CenturyUid) REFERENCES NF1_Century(CenturyUid)
);

INSERT INTO NF1_Century VALUES
	('18th'), 
	('19th'),
	('20th')

INSERT INTO NF1_Person VALUES 
	('Mary', 'Wollstonecraft', 1),
	('Jane', 'Austen', 1),
	('Sojourner', 'Truth', 1),
	('Margaret', 'Fuller', 2),
	('Florence', 'Nightengale', 2),
	('Susan B.', 'Anthony', 2),
	('Elizabeth', 'Blackwell', 2),
	('Rosa', 'Parks', 3),
	('Billie', 'Holiday', 3),
	('Indira', 'Gandhi', 3),
	('Eva', 'Peron', 3),
	('Betty', 'Friedan', 3),
	('Margaret', 'Thatcher', 3)




