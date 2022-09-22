CREATE TABLE Register
(
	MemoNo INT PRIMARY KEY,
	MName VARCHAR(40),
	MAddress VARCHAR(40),
	PhoneNo BIGINT,
	CreadtedDate DATE DEFAULT GetDate()
);

CREATE TABLE MovieDetails
(
	MovieRented VARCHAR(50),
	IssueDate DATE,
	RecevDate DATE,
	MemoNo INT,
	CONSTRAINT fk_emo1
		FOREIGN KEY (MemoNo)
		REFERENCES Register(MemoNo)
		ON DELETE CASCADE
);

CREATE TABLE CategoryDetails
(
	CategoryId INT PRIMARY KEY,
	Category VARCHAR(10)
);
CREATE TABLE CategoryMovie(
	MovieName Varchar(30),
	CategoryId INT,
	Constraint fk_cat
		FOREIGN KEY (CategoryID)
		REFERENCES CategoryDetails(CategoryId)
);
TRUNCATE TABLE MovieDetails
	
INSERT INTO Register(MemoNo,MName,MAddress,PhoneNo)VALUES(101,'Robert','#4LightStreet',9448903311),
													     (120,'Thomas','#20Thornard',82168888897),
														 (110,'Albert','#2Thornard',7779990012),
														 (112,'James','#5LightStreet',786934231),
														 (130,'Stacy','No1gopaline',7766554433)

SELECT * FROM CategoryDetails

INSERT INTO MovieDetails VALUES ('pirates','2015-01-01','2015-01-02',101),
								('SamsonTheGreat','2015-01-01','2015-01-02',101),
								('Titanic','2015-01-05','2015-01-20',120),
								('Thamasamenthe','2015-02-15','2015-02-24',110),
								('Kowsalam','2015-01-02','2015-01-12',112),
								('Titanic','2015-01-02','2015-01-12',112),
								('Ananthan','2015-03-03','2015-03-13',130)
INSERT INTO CategoryDetails VALUES	(1,'Action'),
									(2,'Romance'),
									(3,'Thriller')

select * from CategoryMovie

INSERT INTO CategoryMovie VALUES ('Pirates',1),('SamsonTheGreat',1),('Titanic',2),('Thamasamenthe',3),('Kowsalam',1),('Ananthan',3)

SELECT COUNT(*),MovieRented FROM MovieDetails group by MovieRented