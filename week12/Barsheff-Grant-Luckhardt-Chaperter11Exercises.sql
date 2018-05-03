/*1*/
USE master;
GO

IF DB_ID('Membership') IS NOT NULL
BEGIN 
	ALTER DATABASE Membership
		SET SINGLE_USER 
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Membership;
END

CREATE DATABASE Membership;
GO

USE Membership;
GO

/*2*/
DROP TABLE IF EXISTS GroupMembership;

DROP TABLE IF EXISTS Individuals;
CREATE TABLE Individuals (
	IndividualID int NOT NULL IDENTITY Primary Key,
	FirstName varchar(500) NOT NULL,
	LastName varchar(500) NOT NULL,
	Address varchar(500) NULL,
	Phone varchar(500) NULL
);

INSERT INTO Individuals (FirstName, LastName, Address, Phone) VALUES 
	('John', 'Madden', 'moon', '555-5555-5555555')

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


--ALTER TABLE GroupMembership
--	ADD CONSTRAINT FK_GroupMembership_Individuals
--	FOREIGN KEY (IndividualID)
--	REFERENCES Individuals(IndividualID);
--ALTER TABLE Groups
--	ADD CONSTRAINT FK_Groups_GroupMembership
--	FOREIGN KEY (GroupID)
--	REFERENCES GroupMembership(GroupID);

/*3*/
CREATE CLUSTERED INDEX IX_GroupMemberShip_GroupID
	ON GroupMemberShip(GroupID)

CREATE NONCLUSTERED INDEX IndividualID
	ON GroupMemberShip(IndividualID)

/*4*/

ALTER TABLE Individuals
ADD DuesPaid BIT NOT NULL DEFAULT 0 

/*5*/
ALTER TABLE Invoices
ADD CHECK ((PaymentDate IS NULL AND PaymentTotal = 0) OR (PaymentDate IS NOT NULL AND PaymentTotal > 0)),
    CHECK ((PaymentTotal + CreditTotal) <= InvoiceTotal);

/*6*/
DROP TABLE GroupMembership;
CREATE Table GroupMembership
(GroupID int REFERENCES Groups(GroupID),
 IndividualID int REFERENCES Individuals(IndividualID),
 UNIQUE(GroupID, IndividualID));