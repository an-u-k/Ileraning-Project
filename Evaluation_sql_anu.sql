CREATE DATABASE exam;

USE exam;

CREATE TABLE Manufacturer
(
	Mfname NVARCHAR(20) PRIMARY KEY,
	City NVARCHAR(20),
	State_ NVARCHAR(20)

);
CREATE TABLE Employee
(
	EmployeeId INT PRIMARY KEY,
	EmpName NVARCHAR(20),
	Phone BIGINT,
	Email NVARCHAR(20)
);
CREATE TABLE Computer
(
	SerialNumber INT PRIMARY KEY,
	Mfname NVARCHAR(20),
	Model NVARCHAR(20),
	Weight INT,
	EmployeeId INT,
	CONSTRAINT fk_employee
		FOREIGN KEY(EmployeeId)
		REFERENCES Employee(EmployeeId),
	CONSTRAINT fk_manu
		FOREIGN KEY(Mfname)
		REFERENCES Manufacturer(Mfname)
);

--inserting into table manufacturer

INSERT INTO Manufacturer VALUES('Lenovo','Charity','SouthDakota'),
								('IBM','Seattle','Washington'),
								('Acer','Pierre','SouthDakota'),
								('Apple','Buffalo','NewYork'),
								('Dell','Dallas','Texas')

--inserting into table employee
INSERT INTO Employee VALUES (1,'abc',2456738,'abc@gmail.com'),
							(2,'def',25678904,'def@gmail.com'),
							(3,'ghi',345678902,'ghi@gmail.com'),
							(4,'klm',890765422,'klm@gmail.com'),
							(5,'nop',2345678,'nop@gmail.com')

INSERT INTO COMPUTER VALUES(101,'Lenovo','15insp',45,1),
							(102,'Lenovo','16insp',25,2),
							(103,'IBM','17insp',44,3),
							(104,'Acer','18insp',35,4),
							(105,'Apple','19insp',49,5)
SELECT * FROM Manufacturer
SELECT * FROM Employee
SELECT * FROM Computer
/*
SELECT * 
	FROM Computer
	JOIN Employee 
	ON Computer.EmployeeId=Employee.EmployeeId
	JOIN Manufacturer
	ON Computer.Mfname=Manufacturer.Mfname*/

--1.
SELECT Mfname
	FROM Manufacturer
	WHERE State_='SouthDakota'

--2.
SELECT Mfname,AVG(Weight) AS AvgWeight
	FROM Computer
	GROUP BY(Mfname) 
--3.
SELECT EmpName
	FROM Employee
	WHERE Phone LIKE '2%'

--4.
SELECT SerialNumber
	FROM Computer
	WHERE Weight<(SELECT AVG(Weight) FROM Computer)

--5.
SELECT Manufacturer.Mfname 
	FROM Manufacturer
	WHERE Manufacturer.Mfname NOT IN (SELECT Mfname 
											FROM Computer)

--6.
SELECT EmpName,SerialNumber,City
	FROM Computer
	JOIN Manufacturer
	ON Manufacturer.MfName=Computer.Mfname
	JOIN Employee
	ON Employee.EmployeeId=Computer.EmployeeId

--7.
CREATE PROCEDURE sp_connect
@EmployeeId INT
AS
BEGIN 
	SELECT SerialNumber,Mfname,Model,Weight
	FROM Computer
	WHERE EmployeeId=@EmployeeId
END

sp_connect 1