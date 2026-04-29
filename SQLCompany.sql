CREATE DATABASE COMPANY
USE COMPANY
CREATE TABLE Employee(
SSN INT PRIMARY KEY ,
Fname VARCHAR(50),
Lname VARCHAR(50),
BirthDate DATE ,
Gender VARCHAR(10),

)

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

CREATE TABLE Project (
    Pnum INT PRIMARY KEY,
    Pname VARCHAR(50),
    Location VARCHAR(50),
    Dept_ID INT,
);
CREATE TABLE Dependent (
    DName VARCHAR(50),
    Gender VARCHAR(10),
    BirthDate DATE,
    )

CREATE TABLE Works_On (
    SSN INT,
    Pnum INT,

    PRIMARY KEY (SSN, Pnum),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (Pnum) REFERENCES Project(Pnum)
);
ALTER TABLE Employee
ADD Super_ID INT, Dept_ID INT;

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Super
FOREIGN KEY (Super_ID) REFERENCES Employee(SSN);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Department
FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID);

ALTER TABLE Project
ADD CONSTRAINT FK_Project_Department
FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID);

ALTER TABLE Dependent
ADD SSN INT;

ALTER TABLE Dependent
ADD CONSTRAINT FK_Dependent_Employee
FOREIGN KEY (SSN) REFERENCES Employee(SSN);


ALTER TABLE Works_On
ADD Work_Hours INT;

CREATE TABLE Dept_Location (
    Dept_ID INT,
    Location VARCHAR(50),

    PRIMARY KEY (Dept_ID, Location),
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

SELECT * FROM Employee;
SELECT * FROM Dependent;
SELECT * FROM Project;
SELECT * FROM Works_On;
SELECT * FROM Dept_Location;


SELECT 
    fk.name AS FK_Name,
    OBJECT_NAME(fk.parent_object_id) AS Table_Name,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS Column_Name,
    OBJECT_NAME(fk.referenced_object_id) AS Referenced_Table
FROM sys.foreign_keys fk
JOIN sys.foreign_key_columns fc 
ON fk.object_id = fc.constraint_object_id;