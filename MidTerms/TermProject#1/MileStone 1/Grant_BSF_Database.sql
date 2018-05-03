USE master;
GO


----create database
----
IF DB_ID('BSF') IS NOT NULL
BEGIN
	ALTER DATABASE BSF
		SET SINGLE_USER 
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE BSF;
END

CREATE DATABASE BSF;
GO

USE BSF;
GO

----create request table
----
DROP TABLE IF EXISTS Request;
CREATE TABLE Request
(
	RequestID INT Primary Key,
	ClientID INT,
	EmployeeID INT,
	RecipientID INT,
	PackageID INT,
	PackageQuantity INT,
	RequestNote CHAR(200),
	DateOpened DATE,
	DateClosed DATE,
	RequestStatus CHAR(20)
);

INSERT INTO Request VALUES
	(101,201,313,401,501,5,'','8/16/2010','8/25/2010','RECEIVED'),
	(102,202,313,402,502,8,'','8/30/2010','9/11/2010','RECEIVED'),
	(103,203,313,403,503,17,'I have 0 money and 3 kids','9/13/2010','9/28/2010','RECEIVED'),
	(104,204,313,404,504,4,'','9/27/2010','10/15/2010','RECEIVED'),
	(105,205,314,405,505,1,'','10/11/2010','10/20/2010','FAILED'),
	(106,206,314,410,506,9999999,'I NEED IT','4/1/2011','4/1/2011','VOID'),
	(107,207,314,406,507,6,'','4/22/2011','5/1/2011','RECEIVED'),
	(108,208,314,407,508,8,'','5/13/2011','5/22/2011','RECEIVED'),
	(109,NULL,312,408,501,20,'Rext E-Sports Promotion','6/3/2011','6/12/2011','RECEIVED'),
	(110,209,313,409,502,4,'','6/24/2011','7/3/2011','RECEIVED'),
	(111,205,313,405,503,1,'One more time','7/15/2011','7/17/2011','FAILED'),
	(112,NULL,307,411,504,400,'Texas Flood','8/5/2011','8/11/2011','RECEIVED'),
	(113,NULL,307,412,505,200,'Florida Flood','8/26/2011',NULL,'RECEIVED'),
	(114,210,314,413,506,13,'','9/16/2011',NULL,'SHIPPING'),
	(115,NULL,306,414,506,100,'Church Halloween4DaHomeless','10/7/2011',NULL,'PROCESSING')

----create donation table
----
DROP TABLE IF EXISTS Donation;
CREATE TABLE Donation
(
	DonationID INT PRIMARY KEY,
	DonorID INT,
	DonationAmount MONEY,
	DonationDate DATE,
	DonationNote CHAR(200)
);

INSERT INTO Donation VALUES
	(1001,1101,100,'12/7/2009',''),
	(1002,1102,400,'1/9/2010','Seems Good'),
	(1003,1103,700,'2/11/2010',''),
	(1004,1104,1000,'3/16/2010',''),
	(1005,1105,1300,'4/18/2010','4 da kids'),
	(1006,1106,1600,'5/21/2010',''),
	(1007,1107,1900,'6/23/2010','I lost a bet'),
	(1008,1108,2200,'7/26/2010',''),
	(1009,1101,700,'7/28/2010',''),
	(1010,1104,1000,'8/18/2010','Back for more')


----create package table
----
DROP TABLE IF EXISTS Package;
CREATE TABLE Package
(
	PackageID INT PRIMARY KEY,
	PackageName CHAR(20),
	PackageDesc CHAR(100),
	PackageSize CHAR(6)
);

INSERT INTO Package VALUES
	(501,'Sweet Tooth','variety of sweet candy','Small'),
	(502,'Wake Up','caffinated candy','Small'),
	(503,'Sweeter Tooth','variety of sweet candy','Large'),
	(504,'Choco Pack','variety of chocolate candy','Medium'),
	(505,'Sour Boy','variety of sour candy','Small'),
	(506,'Sour Man','variety of sour candy','Medium'),
	(507,'Crunchers','variety of crunchy candy','Medium'),
	(508,'Max Candy','variety of all candies','Large'),
	(509,'Nut Lover','variety of nut','Medium')


----create package manifest table
----
DROP TABLE IF EXISTS PackageManifest;
CREATE TABLE PackageManifest
(
	PackageID INT,
	CandyID CHAR(10),
	Quantity INT,
	CONSTRAINT PK_PackageManifest
		PRIMARY KEY (PackageID, CandyID)
);

INSERT INTO PackageManifest VALUES
	(501,'BIGJ',20),
	(501,'FAIRYD',10),
	(501,'PDRAG',10),
	(502,'LOCMO',30),
	(503,'BIGJ',160),
	(503,'FAIRYD',80),
	(504,'CHOCO',30),
	(504,'SNACK',30),
	(505,'MAXA',20),
	(505,'SOURF',20),
	(506,'MAXA',40),
	(506,'SOURF',40),
	(506,'TOXKIS',20),
	(507,'GOATP',30),
	(507,'NUTLOG',30),
	(507,'QUACK',30),
	(508,'CHOCO',60),
	(508,'MBALLS',120),
	(508,'UNIHOR',60),
	(509,'BIGN',40),
	(509,'NUTLOG',40),
	(509,'SNACK',20)
	
----create candy table
----
DROP TABLE IF EXISTS Candy;
CREATE TABLE Candy
(
	CandyID CHAR(10) PRIMARY KEY,
	CandyName CHAR(20),
	CandyType CHAR(20),
	ContianeNut CHAR(5),
	ValuePerUnit MONEY
);

INSERT INTO Candy VALUES
	('BIGJ','Big Juice','Sweet','FALSE',0.25 ),
	('NUTLOG','Nut Logger','Crunchy','TRUE',0.30), 
	('SNACK','Snackers','Chocolate','TRUE',0.20 ),
	('CHOCO','Choco Labs','Chocolate','FALSE',0.15), 
	('QUACK','Quacker','Crunchy','FALSE',0.20 ),
	('MAXA','Max Apple' ,'Sour','FALSE',0.07 ),
	('MAMO','Marsh Monsters','Fluffly','FALSE',0.11 ),
	('FAIRYD','Fairy Dust','Sweet','FALSE',0.03 ),
	('PDRAG','Purple Dragon','Sweet','FALSE',0.50 ),
	('UNIHOR','Unicorn Horns','Savory','FALSE',0.24 ),
	('GOATP','Goat Pebble','Crunchy','FALSE',0.33 ),
	('LOCMO','Loco Moco','Coffee','FALSE',0.70 ),
	('MBALLS','Mystery Balls','Hard Candy','FALSE',0.26 ),
	('SOURF','Sour Flower','Sour','FALSE',0.22 ),
	('BIGN','Big Nut','Crunchy','TRUE',0.05 ),
	('TOXKIS','Toxic Kiss','Sour','FALSE',0.17) 

----create client table
----
DROP TABLE IF EXISTS Client;
CREATE TABLE Client
(
	ClientID INT PRIMARY KEY,
	ClientName CHAR(40),
	ClientPhone CHAR(22),
	DateOfFirstRequest DATE,
	DateOfRecentRequest DATE
);

INSERT INTO Client VALUES
	(201,'John Doe','(555)555-6136','8/16/2010','8/16/2010'),
	(202,'Tidus','(555)555-8258','8/30/2010','8/30/2010'),
	(203,'Mo Manny','(555)555-1834','9/13/2010','9/13/2010'),
	(204,'Timmy Carter','(555)555-0174','9/27/2010','9/27/2010'),
	(205,'Max Hanson','(555)555-9274','10/11/2010','7/15/2011'),
	(206,'James Cort','(555)555-1063','4/1/2011','4/1/2011'),
	(207,'Alex Trobo','(555)555-1053','4/22/2011','4/22/2011'),
	(208,'Hannah Hart','(555)555-1045','5/13/2011','5/13/2011'),
	(209,'Paul Blorn','(555)555-9246','6/24/2011','6/24/2011'),
	(210,'Anne Molt','(555)555-9163','9/16/2011','9/16/2011')

----create employee table
----
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee
(
	EmployeeID INT PRIMARY KEY,
	EmployeeName CHAR(40),
	Position CHAR(40)
);

INSERT INTO Employee VALUES
	(301,'Lance Joy','Driver'),
	(302,'Heino Humbert','Driver'),
	(303,'Kayode Myrddin','Driver'),
	(304,'Radha Leroy','Pilot'),
	(305,'Branislav Absalom','Pilot'),
	(306,'Ana Livy','Manager'),
	(307,'Mordikai Elçin','CEO'),
	(308,'Nana Markéta','Developer'),
	(309,'Marin Shoshannah','IT'),
	(310,'Teobaldo Abdias','Front Desk'),
	(311,'Juan Deepti','Shipping'),
	(312,'Isla Lilian','PR'),
	(313,'Bartholomeus Ekua','Clerk'),
	(314,'Coline Marin','Clerk')


----create recipient table
----
DROP TABLE IF EXISTS Recipient;
CREATE TABLE Recipient
(
	RecipientID INT PRIMARY KEY,
	RecipientName CHAR(40),
	Address CHAR(100)
);

INSERT INTO Recipient VALUES
	(401,'Sonja Lucette','4321 Elk Street Irvine, CA 92664'),
	(402,'Irati Yoshiyahu','2953 Meadow Lane Oakland, CA 94612'),
	(403,'Aristokles Uthyr','1072 Edington Drive Atlanta, GA 30305'),
	(404,'Kalina Hyun-Jung','3937 Lincoln Street Laurel Springs, NJ 08021'),
	(405,'Max Hanson','3464 Jewell Road Minneapolis, MN 55417'),
	(406,'Kshitij Ralf','2662 Owagner Lane Seattle, WA 98101'),
	(407,'Stephen Katrė','4291 Devils Hill Road Brookhaven, MS 39601'),
	(408,'Katrien Aniruddha','1231 Kelly Drive Clarksburg, WV 26301'),
	(409,'Finbarr Ingolf','785 Mount Olive Road Norcross, GA 30093'),
	(410,'James Cort','1760 Oak Avenue Chicago, IL 60606'),
	(411,'Tihana Reşide','3571 Ash Street Grand Prairie, TX 75051'),
	(412,'Suzie Abhina','1445 Walnut Street Jackson, MS 39201'),
	(413,'Alphege Ravi','175 Maple Street Irvine, CA 92618'),
	(414,'Saturninus Carla','2307 Wetzel Lane Grand Rapids, MI 49503')

----create donor table
----
DROP TABLE IF EXISTS Donor;
CREATE TABLE Donor
(
	DonorID INT PRIMARY KEY,
	DonorName CHAR(40),
	DateOfFirstDonation DATE,
	DateOfRecentDonation DATE,
	TotalDonated MONEY
);

INSERT INTO Donor VALUES
	(1101,'Nicomedes Helena','12/7/2009','7/28/2010',800 ),
	(1102,'Stijn Elmas','1/9/2010','1/9/2010',400 ),
	(1103,'Zekiye Ragna','2/11/2010','2/11/2010',700), 
	(1104,'Leofstan Duda','3/16/2010','8/18/2010',2000 ),
	(1105,'Yared Ildikó','4/18/2010','4/18/2010',1300 ),
	(1106,'Hacer Annelise','5/21/2010','5/21/2010',1600 ),
	(1107,'Shabnam Europa','6/23/2010','6/23/2010',1900 ),
	(1108,'Dobroslava Berit','7/26/2010','7/26/2010',2200 )

----foreign keys
----
ALTER TABLE Request
	ADD CONSTRAINT FK_Request_Client
		FOREIGN KEY (ClientID)
		REFERENCES Client(ClientID);

ALTER TABLE Request
	ADD CONSTRAINT FK_Request_Employee
		FOREIGN KEY (EmployeeID)
		REFERENCES Employee(EmployeeID);

ALTER TABLE Request
	ADD CONSTRAINT FK_Request_Recipient
		FOREIGN KEY (RecipientID)
		REFERENCES Recipient(RecipientID);

ALTER TABLE Request
	ADD CONSTRAINT FK_Request_Package
		FOREIGN KEY (PackageID)
		REFERENCES Package(PackageID);

ALTER TABLE Donation
	ADD CONSTRAINT FK_Donation_Donor
		FOREIGN KEY (DonorID)
		REFERENCES Donor(DonorID);

ALTER TABLE PackageManifest
	ADD CONSTRAINT FK_PackageManifest_Package
		FOREIGN KEY (PackageID)
		REFERENCES Package(PackageID);

ALTER TABLE PackageManifest
	ADD CONSTRAINT FK_PackageManifest_Candy
		FOREIGN KEY (CandyID)
		REFERENCES Candy(CandyID);