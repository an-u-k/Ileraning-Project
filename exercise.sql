CREATE DATABASE practice;
USE Practice;


--Q1

CREATE TABLE Department
(
	DeptNo NUMERIC(2) PRIMARY KEY,
	DeptName VARCHAR(40) UNIQUE,
	DeptFloor NUMERIC(2),
	Location VARCHAR(20)
);

CREATE TABLE Employee
(
	EmpNo NUMERIC(3) PRIMARY KEY,
	ManagerId NUMERIC(3),
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20),
	UserId VARCHAR(20),
	DeptNo NUMERIC(2),
	Salary NUMERIC(5,2),
	Commission NUMERIC(3),
	JoiningDate DATE,
	Designation VARCHAR(20),
	CONSTRAINT fk_deptno
		FOREIGN KEY(DeptNo)
		REFERENCES Department(DeptNo)
		ON DELETE CASCADE
);

--Q4,5,6.HRA and PF 

ALTER TABLE EMPLOYEE ADD HRA DECIMAL(4,2)
ALTER TABLE EMPLOYEE ADD PF DECIMAL(4,2) CONSTRAINT ck_pf CHECK(PF<=5000)

ALTER TABLE EMPLOYEE DROP COLUMN HRA
ALTER TABLE EMPLOYEE DROP COLUMN PF
ALTER TABLE EMPLOYEE DROP CONSTRAINT ck_pf
SELECT * FROM Employee


--Q7,8,9,10
CREATE TABLE Customer
(
	CustNo NUMERIC(3) PRIMARY KEY,
	CustName VARCHAR(20),
	Addres VARCHAR(40)
);

CREATE TABLE Orders
(
	OrderNo NUMERIC(2) PRIMARY KEY,
	CustNo NUMERIC(3),
	OrderDate DATE,
		CONSTRAINT fk_customerno
		FOREIGN KEY(CustNo)
		REFERENCES Customer(CustNo)
);

CREATE TABLE OrderItem
(
	ItemId NUMERIC(3) PRIMARY KEY,
	OrderNo NUMERIC(2),
	ItemName VARCHAR(20),
	Quantity NUMERIC(2),
		CONSTRAINT fk_orderno
			FOREIGN KEY(OrderNo)
			REFERENCES Orders(OrderNo)
);


--Q.11
ALTER TABLE Customer ALTER COLUMN Addres VARCHAR(100)

--Q12,13,14,15
--WITHOUT COMPOSITE KEY
CREATE TABLE Course
(
	CourseId VARCHAR(10),
	StreamId VARCHAR(20),
	Title VARCHAR(40),
	Description VARCHAR(20),
	Fees NUMERIC,
	PRIMARY KEY(CourseId)
);
--WITH COMPOSITE KEY
CREATE TABLE Courses
(
	CourseId VARCHAR(10),
	StreamId VARCHAR(20),
	Title VARCHAR(40),
	Description VARCHAR(20),
	Fees NUMERIC,
	PRIMARY KEY(CourseId,StreamId)
);
--without composite
CREATE TABLE Batch
(
	BatchId VARCHAR(30) PRIMARY KEY,
	CourseId VARCHAR(10),
	BatchName Char(1)
	CONSTRAINT fk_courseid
		FOREIGN KEY(CourseId)
		REFERENCES Course(CourseId)
);
--with composite
CREATE TABLE Batches
(
	BatchId VARCHAR(30) PRIMARY KEY,
	CourseId VARCHAR(10),
	StreamId VARCHAR(20),
	BatchName Char(1)
	CONSTRAINT fk_courseidstreamid
		FOREIGN KEY(CourseId,StreamId)
		REFERENCES Courses(CourseId,StreamId)
);

CREATE TABLE Student
(
	StudId VARCHAR(20) PRIMARY KEY,
	LastName VARCHAR(25),
	BatchId VARCHAR(30),
	MiddleName VARCHAR(30),
	FirstName VARCHAR(20),
	DOb DATE DEFAULT GETDATE(),
	Addres VARCHAR(50),
	City VARCHAR(40),
	StudState VARCHAR(2),
	ZipCode VARCHAR(9),
	Telephone VARCHAR(10),
	Fax VARCHAR(10),
	Mail VARCHAR(30),
	GRADE CHAR(1),
		CONSTRAINT ck_grade
		CHECK(Grade IN('A','A+','A-','B','B+','B-','C','C+','C-','D','D+','D-','F','F+','F-')),
		CONSTRAINT fk_batchid
		FOREIGN KEY(BatchId)
		REFERENCES Batch(BatchId)
);

--Q16
ALTER TABLE Student DROP COLUMN MiddleName;

--Q17.
EXEC sp_rename 'Student','Participa

--Added Normalisation with Solutions
