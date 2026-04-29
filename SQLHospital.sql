
CREATE DATABASE Hospital 

USE Hospital;

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(50),
    Blood_Group VARCHAR(10),
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    DOB DATE,
    Age INT
);
DROP TABLE Patient;

CREATE TABLE Doctor (
    D_id INT PRIMARY KEY,
    Specialization VARCHAR(50),
    Professional_Details VARCHAR(100),
    
);

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    D_id INT   -- manager
);

CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Type VARCHAR(30),
    Date DATE,
    Patient_ID INT,
    D_id INT
);

CREATE TABLE Medical_Record (
    M_id INT PRIMARY KEY,
    Diagnosis VARCHAR(100),
    Treatment VARCHAR(100),
    Patient_ID INT,
    D_id INT,
    Appointment_ID INT
);

CREATE TABLE Billing (
    Id_bill INT PRIMARY KEY,
    Total_Amount DECIMAL(10,2),
    Appointment_ID INT
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2),
    Payment_Method VARCHAR(30),
    Payment_Date DATE,
    Id_bill INT
);

CREATE TABLE Insurance (
    Insurance_ID INT PRIMARY KEY,
    Provider_Name VARCHAR(50),
    Coverage_Percentage DECIMAL(5,2),
    Patient_ID INT
);

CREATE TABLE Service_Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50)
);

CREATE TABLE Appointment_Service (
    Appointment_ID INT,
    Service_ID INT,
    Quantity INT,
    PRIMARY KEY (Appointment_ID, Service_ID)
);
CREATE TABLE Service (
    Service_ID INT PRIMARY KEY,
    Service_Name VARCHAR(50),
    Service_Type VARCHAR(30),
    Price DECIMAL(10,2),
    Dept_ID INT,
    Category_ID INT
);

ALTER TABLE Doctor
ADD FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID);

ALTER TABLE Doctor
ADD Dept_ID INT;

ALTER TABLE Insurance 
ADD FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID);

ALTER TABLE Department
ADD FOREIGN KEY (D_id) REFERENCES Doctor(D_id);

ALTER TABLE Appointment
ADD FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID);

ALTER TABLE Appointment
ADD FOREIGN KEY (D_id) REFERENCES Doctor(D_id);

ALTER TABLE Medical_Record
ADD FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID);


ALTER TABLE Medical_Record
ADD FOREIGN KEY (D_id) REFERENCES Doctor(D_id);

ALTER TABLE Medical_Record
ADD FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID);

ALTER TABLE Billing
ADD FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID);

ALTER TABLE Payment
ADD FOREIGN KEY (Id_bill) REFERENCES Billing(Id_bill);


ALTER TABLE Service
ADD FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID);

ALTER TABLE Service
ADD FOREIGN KEY (Category_ID) REFERENCES Service_Category(Category_ID);

ALTER TABLE Appointment_Service
ADD FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID);


ALTER TABLE Appointment_Service
ADD FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID);

select * from Patient;
select * from Doctor;
select * from Department;
select * from Appointment;
select * from Medical_Record;
select * from Billing;
select * from Payment;
select * from Insurance;
select * from Service_Category;
select * from Appointment_Service;
select * from Service;


SELECT 
    fk.name AS FK_Name,
    OBJECT_NAME(fk.parent_object_id) AS Table_Name,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS Column_Name,
    OBJECT_NAME(fk.referenced_object_id) AS Referenced_Table
FROM sys.foreign_keys fk
JOIN sys.foreign_key_columns fc 
ON fk.object_id = fc.constraint_object_id;