/*1*/
USE master;
GO

IF DB_ID('Membership2') IS NOT NULL
BEGIN 
	ALTER DATABASE Membership2
		SET SINGLE_USER 
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Membership2;
END

CREATE DATABASE Membership2;
GO

/*2*/
DROP TABLE IF EXISTS GroupMembership;

DROP TABLE IF EXISTS Individuals;
CREATE TABLE Individuals (
	IndividualID int NOT NULL IDENTITY Primary Key,
	FirstName varchar(500) NOT NULL,
	LastName varchar(500) NOT NULL,
	Address varchar(500) NULL,
	Phone varchar(500) NULL,
	DuesPaid BIT NOT NULL DEFAULT 0
);

INSERT INTO Individuals (FirstName, LastName, Address, Phone) VALUES 
	('John', 'Madden', 'moon', '555-555-5555')

DROP TABLE IF EXISTS Groups;
CREATE TABLE Groups (
	GroupID int NOT NULL IDENTITY primary key,
	GroupName varchar(500) NOT NULL,
	Dues money NOT NULL default 0 CHECK (Dues >= 0)
);

INSERT INTO Groups (GroupName, Dues) VALUES 
	('Salad', 6000000)

CREATE TABLE GroupMembership (
	GroupID int REFERENCES Groups(GroupID),
	IndividualID int REFERENCES Individuals(IndividualID)
);

INSERT INTO GroupMembership VALUES 
	(1,1)

/*3*/
CREATE CLUSTERED INDEX IX_GroupMemberShip_GroupID
	ON GroupMemberShip(GroupID)

CREATE NONCLUSTERED INDEX IndividualID
	ON GroupMemberShip(IndividualID)
