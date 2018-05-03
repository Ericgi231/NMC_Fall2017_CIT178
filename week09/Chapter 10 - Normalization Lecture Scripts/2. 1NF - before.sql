USE Ch10_Before;
GO

DROP TABLE IF EXISTS NF1_Person;

CREATE TABLE NF1_Person (
		Century CHAR(4) PRIMARY KEY,
		Person VARCHAR(250)
);

INSERT INTO NF1_Person VALUES 
	('18th', 'Mary Wollstonecraft, Jane Austen, Sojourner Truth'),
	('19th', 'Margaret Fuller, Florence Nightingale, Susan B. Anthony, Elizabeth Blackwell'),
	('20th', 'Rosa Parks, Billie Holiday, Indira Gandhi, Eva Peron, Betty Friedan, Margaret Thatcher');






