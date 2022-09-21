CREATE DATABASE practice;
USE Practice;
-----------------------------------------------------------------------------------------------------------------------------------------------
--------------DML------------------------------------



--Q3.Theres an error while adding the same department number twice because DeptNo is a primary key
--Q4.


--inserting into department table

INSERT INTO Department VALUES
(1,'IB1',1,'TVM'),
(2,'IB2',1,'KLM'),
(3,'IB3',1,'ALP')

INSERT INTO Employee VALUES
(1,11,'Ann','Mary','345',1,67,9,'1992-12-10','IT'),
(2,12,'Bnn','Mary','346',2,63,8,'1990-01-09','QA'),
(3,13,'Cnn','Mary','347',3,62,7,'1995-01-04','HR')

INSERT INTO Customer VALUES
(1,'SAM','ASDSFS SDFD'),
(2,'BAM','DHCBND D'),
(3,'RAM','CHDSAB MSA')

INSERT INTO Orders VALUES
(11,1,'2000-09-10'),
(12,2,'2001-09-10'),
(13,1,'2001-10-10')

INSERT INTO OrderItem VALUES
(1,11,'ice cream',2),
(2,11,'chocolate ice cream',2),
(3,13,'fresh cream',2)

INSERT INTO Course VALUES
('A','1','ML','MachineLearning',2300),
('B','2','DL','DeepLearning',2300),
('C','3','DS','DataScience',2300)

INSERT INTO Batch VALUES
('11','A','F'),
('12','A','S'),
('13','C','T')

INSERT INTO Participant VALUES
('20','Paj','11','Sama','1992-09-09','sam villa','kul','KL','908','908789','HG','ASD@DFG','A'),
('13','Raj','11','Ram','1994-09-05','Ram villa','Lul','TN','928','908789','HG','ARE@DFG','B'),
('14','Raj','11','Tam','1996-09-04','Tam villa','Yul','AP','948','958789','HG','ART@DFG','C')

--Q5.

TRUNCATE TABLE Course;


--Q6.
INSERT INTO Employee(EmpNo,FirstName) VALUES
(5,'Ann')

--Q7.
SELECT * FROM Customer

UPDATE Customer
	SET Addres='NewDelhi'
	WHERE CustNo=2;

	--
--Q8.
DELETE FROM Employee 
	WHERE Salary>=5000;

--q9.

SELECT * FROM Employee
UPDATE Employee
	SET FirstName='Anu',DeptNo=2
	WHERE EmpNo=1;


--q10.
SELECT * FROM Participant
--inserting only the id and making mail attribute to null
INSERT INTO Participant(StudId,DOb) VALUES
('29','2020-01-05')
--checking
UPDATE Participant
	SET Mail='NA'
	WHERE Mail IS NULL;

--Q11.

DELETE FROM Participant 
	WHERE DATEDIFF(hour,Dob,GETDATE())>20

--q12.
DELETE FROM Participant
	WHERE Mail IS NULL AND TELEPHONE IS NULL;

--Q13.
DELETE From Participant
	WHERE DOb LIKE '%-05-05'

--Q14.
UPDATE Participant 
	SET FirstName='XXX',DOb=CURRENT_TIMESTAMP
	WHERE FirstName LIKE '___a%'

--Q15.
DELETE FROM Participant
	WHERE StudState LIKE '%a';

--Q16.

UPDATE Participant
	SET LastName='Jan'
	WHERE Dob LIKE '_____01%'

--Q17.
DELETE FROM Participant
	WHERE StudState LIKE 'T%'
	